import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:interview_app_medical/features/home/model/drink_model.dart';

class DrinksAPi {
// API FOR DRINKS
  Future<DrinkModel?> drinksAPI() async {
    DrinkModel? drinksData;
    final http = client.Client();

    try {
      final response = await http.get(Uri.parse(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar"));

      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        drinksData = DrinkModel.fromJson(item);
      } else {
        print("Print Error");
      }

      return drinksData;
    } catch (e) {
      print(e.toString());
    }
  }
}
