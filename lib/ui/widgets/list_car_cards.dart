import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/entities/car.dart';
import 'package:wswork_app/models/car_model.dart';
import 'package:wswork_app/ui/widgets/car_card.dart';
import 'package:wswork_app/ui/widgets/message.dart';

//ignore: must_be_immutable
class ListCarCards extends StatefulWidget {

  // Function? registerLead;

  const ListCarCards({Key? key,
    // required this.registerLead,
  }) : super(key: key);

  @override
  State<ListCarCards> createState() => _ListCarCardsState();
}

class _ListCarCardsState extends State<ListCarCards> {
  // late bool value = false;
  // late Future<List<Car>> futureCars;

  // @override
  // void initState() {
  //   super.initState();
  //   _reload();
  // }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _reload();
    });
  }

  void _reload() {
    CarModel.of(context).fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarModel>(
        builder: (BuildContext context, CarModel carModel, Widget? widget) {
      return FutureBuilder(
        future: carModel.futureCars,
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
                return Message.alert(
                    'Não foi possível obter os dados do servidor');
              } else if (!snapshot.hasData) {
                return Message.alert(
                    'Não foi possível obter os dados dos estoques');
              } else if (snapshot.data!.isEmpty) {
                return Message.alert('Nenhum carro encontrado');
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
                          /*child: CarCard(
                            car: snapshot.data![index],
                          ),*/
                          /*child: InkWell(*/
                            child: CarCard(
                              car: snapshot.data![index],
                            ),
                            /*onTap: (){
                              print('touch');
                            },
                          ),*/
                        );
                      }),
                );
              }
          }
        },
      );
    });
  }
}



// @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 8.0),
//           // child: InkWell(
//             child: CarCard(
//               isSelected: null,
//             ),
//           //   onTap: () {
//           //     setState(() {
//           //       value = true;
//           //     });
//           //     print('touch');
//           //   },
//           // ),
//         );
//       },
//     );
//   }
