import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:interview_app_medical/features/home/model/drink_model.dart';
import 'package:interview_app_medical/features/home/model/user_model.dart';

class UserAPi {
// API FOR DRINKS
  Future<UserModel?> userAPi() async {
    UserModel? userData;
    final http = client.Client();

    try {
      final response = await http.get(Uri.parse(
          "https://randomuser.me/api/"));

      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        userData = UserModel.fromJson(item);
      } else {
        print("Print Error");
      }

      return userData;
    } catch (e) {
      print(e.toString());
    }
  }
}
