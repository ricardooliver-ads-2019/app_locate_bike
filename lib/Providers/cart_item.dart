import 'package:app_locate_bike/Models/bike.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier{
  List<Bike> _bikes = [];
  List<Bike> get bike => [..._bikes];

  int get total => _bikes.length;

  void addBike(Bike bike){
    print(_bikes.contains(bike));
    bool result = _bikes.contains(bike);
    if (!result) {
      _bikes.add(bike);
      notifyListeners();
    } else {
      print("Item já está no carrionho!!!");
    }
    
  }

  void removeBike(Bike bike){
    _bikes.remove(bike);
    notifyListeners();
  }
}