import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/entities/car.dart';
import 'package:wswork_app/repository/api/car_api.dart';

class CarModel extends ChangeNotifier{
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

  void selectCarCard(Car car){
    if(car.isSelected == true){
      // value = false;
      car.isSelected = false;
    }else{
      car.isSelected = true;
    }
    notifyListeners();
  }

}