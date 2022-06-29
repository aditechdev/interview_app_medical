import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/home/model/user_model.dart';
import 'package:interview_app_medical/features/home/services/user_api.dart.dart';

class UserViewModel with ChangeNotifier {
  UserModel? userModel = UserModel();
  UserAPi userAPi = UserAPi();
  bool loading = false;

  getUserModel() async {
    loading = true;

    userModel = await userAPi.userAPi();
    loading = false;
    notifyListeners();
  }
}
