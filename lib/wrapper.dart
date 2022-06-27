import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/auth/model/user_model.dart';
import 'package:interview_app_medical/features/auth/screen/auth_screen.dart';
import 'package:interview_app_medical/features/auth/services/auth_service.dart';
import 'package:interview_app_medical/features/home/screen/home_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServiceProvider = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authServiceProvider.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return (user == null) ? const AuthScreen() : const HomeScreen();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
