import 'package:app_locate_bike/Models/bike.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier{
  List<Bike> _bikes = [];
  List<Bike> get bike => [..._bikes];

  int get total => _bikes.length;

  void addBike(Bike bike){
    _bikes.add(bike);
    notifyListeners();    
    
  }

  void removeBike(Bike bike){
    _bikes.remove(bike);
    notifyListeners();
  }


  CheckListCart(Bike bike, Function addBike){ //!função para verificar se um determindado item já existe lista 
    // função recebe como parametro, *uma lista do tipo Bike e *uma função que add um elemento na lista
    
    String result ="";                          //!---> variavel que vai ser retornada com a resposta da ferificação
   
    if (!_bikes.contains(bike)) {               //!---> ferificação * se não contem o elemento (bike) na lista 
        addBike(bike);                          //!---> então add o elemento na lista 
        result = "Item Adicionado com Sucesso"; //!---> e a variavel result = recebe o valor de "Item Adicionado com Sucesso"
                          
    } else {                                    //!---> se o item já está na lista então a variavel result = o valor de "Item já está no carrinho"
        result = "Item já está no carrinho";
    }

    return result;

  }



}

