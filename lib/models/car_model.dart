import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/entities/car.dart';
import 'package:wswork_app/entities/lead.dart';
import 'package:wswork_app/repository/api/car_api.dart';
import 'package:wswork_app/repository/local/lead_repository.dart';
import 'package:wswork_app/repository/local/user_repository.dart';

class CarModel extends ChangeNotifier {
  // late Car car;
  // Car car = Car(id: 1, brandId: 2, brandName: 'brandName', modelName: 'modelName', year: 2, fuel: 'fuel', numDoors: 4, fipeValue: 12, color: 'color', timestampRegister: 3);

  // late Future<List<Car>?> futureCars;
  Future<List<Car>?>? futureCars;
  bool loading = false;

  static CarModel of(BuildContext context) {
    // return Provider.of<CarModel>(context);
    return Provider.of<CarModel>(context, listen: false);
  }

  Future<void> fetchCars() async {
    loading = true;
    // futureCars = Future.delayed(const Duration(seconds: Duration.millisecondsPerDay));
    // futureCars = Future.delayed(const Duration(seconds: 5));
    // notifyListeners();
    // futureCars = (await CarApi.instance.getCars()) as Future<List<Car>?>;
    futureCars = CarApi.instance.getCars();
    loading = false;
    notifyListeners();
  }

  /*Future<List<Car>> getCars() async {
    futureCars
  }*/

  void deselectCarCard() {
    // Future.value(futureCars).then((value) => value?.where((element) => element.isSelected == true));
    Future.value(futureCars).then((value) => value?.forEach((element) {
          element.isSelected = false;
        }));
    notifyListeners();
  }

  /*void selectCarCard(int index) {
    int indexList;

    Future.value(futureCars).then((value) => value?.forEach((element) {
      element.isSelected = false;
    }));

    // Future.value(futureCars).then((value) => value?.indexWhere((element == index) => false));
    // if (car.isSelected == true) {
    //   car.isSelected = false;
    // } else {
    //   car.isSelected = true;
    // }
    notifyListeners();
  }*/

  void selectCarCard(Car car) {
    Future.value(futureCars).then((value) => value?.forEach((element) {
      if(element != car){
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
    Car? car = Future.value(futureCars).then((value) =>
        value?.where((element) => element.isSelected == true).first) as Car?;
    int userId =
        await UserRepository.instance.getUserIdByEmailPassword(email, password);
    Lead lead = Lead(
        userId: userId,
        /*id: id,*/
        name: '${car?.brandName} ${car?.modelName} ${car?.year}',
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        time: DateFormat('HH:mm').format(DateTime.now()));
    await LeadRepository.instance.registerLead(lead);
  }
}
