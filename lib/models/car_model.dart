import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/entities/car.dart';
import 'package:wswork_app/entities/lead.dart';
import 'package:wswork_app/repository/api/car_api.dart';
import 'package:wswork_app/repository/local/lead_repository.dart';
import 'package:wswork_app/repository/local/user_repository.dart';

class CarModel extends ChangeNotifier {
  Future<List<Car>?>? futureCars;
  bool loading = false;

  static CarModel of(BuildContext context) {
    return Provider.of<CarModel>(context, listen: false);
  }

  Future<void> fetchCars() async {
    loading = true;
    futureCars = CarApi.instance.getCars();
    loading = false;
    notifyListeners();
  }

  void deselectCarCard() {
    Future.value(futureCars).then((value) => value?.forEach((element) {
          element.isSelected = false;
        }));
    notifyListeners();
  }

  void selectCarCard(Car car) {
    Future.value(futureCars).then((value) => value?.forEach((element) {
          if (element != car) {
            element.isSelected = false;
          }
        }));
    if (car.isSelected == true) {
      car.isSelected = false;
    } else {
      car.isSelected = true;
    }
    notifyListeners();
  }

  void doLead(String email, String password) async {
    Car? car = await Future.value(futureCars).then(
        (value) => value?.where((element) => element.isSelected == true).first);
    int userId =
        await UserRepository.instance.getUserIdByEmailPassword(email, password);
    Lead lead = Lead(
        userId: userId,
        name: '${car?.brandName} ${car?.modelName} ${car?.year}',
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        time: DateFormat('HH:mm').format(DateTime.now()));
    await LeadRepository.instance.registerLead(lead);
  }
}
