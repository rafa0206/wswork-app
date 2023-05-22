import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/models/lead_model.dart';
import 'package:wswork_app/ui/widgets/lead_card.dart';
import 'package:wswork_app/ui/widgets/message.dart';

class ListLeadsCard extends StatefulWidget {
  const ListLeadsCard({Key? key}) : super(key: key);

  @override
  State<ListLeadsCard> createState() => _ListLeadsCardState();
}

class _ListLeadsCardState extends State<ListLeadsCard> {

  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _reload();
    });
  }

  void _reload() {
    LeadModel.of(context).fetchLeads();
  }

  void addLeads() async {
    var futureLeads = LeadModel.of(context).futureLeads;
    if (futureLeads != null) {
      var leads = await Future.value(futureLeads);
      if (context.mounted) {
        LeadModel.of(context).addLeads(
          leads!,
          onPostLeads: () {
            Message.onSuccess(
              scaffoldKey: _scaffoldKey,
              message: 'Boas compras',
              seconds: 2,
              onPop: () {},
            );
            return;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LeadModel>(
        builder: (BuildContext context, LeadModel leadModel, Widget? widget) {
      return FutureBuilder(
          future: leadModel.futureLeads,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Message.alert(
                    'Não foi possível obter os dados decessários');
              case ConnectionState.waiting:
                return Center(
                  child: Message.loading(context),
                );
              default:
                if (snapshot.hasError) {
                  return Message.alert('Nenhuma compra encontrada');
                } else if (!snapshot.hasData) {
                  return Message.alert('Nenhuma compra encontrada');
                } else if (snapshot.data!.isEmpty) {
                  return Message.alert('Nenhuma compra encontrada');
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      _reload();
                    },
                    child: ListView.builder(
                        itemCount: snapshot.data?.length ?? 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: LeadCard(
                              lead: snapshot.data![index],
                            ),
                          );
                        }),
                  );
                }
            }
          });
    });
  }
}
