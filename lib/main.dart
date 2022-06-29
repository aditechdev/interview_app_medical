import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/auth/screen/auth_screen.dart';
import 'package:interview_app_medical/features/auth/services/auth_service.dart';
import 'package:interview_app_medical/features/home/screen/home_screen.dart';
import 'package:interview_app_medical/features/home/viewModel/drinks_view_model.dart';
import 'package:interview_app_medical/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (__) => AuthService(),
          
        ),
        ChangeNotifierProvider<DrinksViewModel>(create:(__) => DrinksViewModel(),),
        // StreamProvider<DrinksViewModel>(create: (__)=> DrinksViewModel())

        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Wrapper(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          AuthScreen.routeName: (context) => const AuthScreen(),
        },
      ),
    );
  }
}
