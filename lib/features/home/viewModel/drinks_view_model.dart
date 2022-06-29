import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/home/model/drink_model.dart';
import 'package:interview_app_medical/features/home/services/drinks_api.dart';

class DrinksViewModel with ChangeNotifier {
  DrinkModel? drinkModel = DrinkModel();
  DrinksAPi drinkAPi = DrinksAPi();
  bool loading = false;

  getDrinksModel() async {
    loading = true;
    
    drinkModel = await drinkAPi.drinksAPI();
    loading = false;
    notifyListeners();
    // return drinkModel;
  }

  // fetchDrinkModel() async {
  //   DrinkModel? _d = await drinkAPi.drinksAPI();
  //   drinkModel = _d;
  //   notifyListeners();
  // }
}
