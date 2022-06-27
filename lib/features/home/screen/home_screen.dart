import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/auth/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabController tabController;
    logOut() {
      AuthService authService = AuthService();
      authService.signOut();
    }

    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Medi Buddy"),
          bottom: TabBar(
            padding: EdgeInsets.zero,
            indicatorColor: Theme.of(context).errorColor,
            tabs: <Widget>[
              Container(
                width: double.infinity,
                child: Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => logOut(),
            )
          ],
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}
