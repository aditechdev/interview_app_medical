import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/auth/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logOut() {
      AuthService authService = AuthService();
      authService.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logOut(),
          )
        ],
      ),
    );
  }
}
