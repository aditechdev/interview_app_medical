import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/auth/services/auth_service.dart';
import 'package:interview_app_medical/features/home/services/drinks_api.dart';
import 'package:interview_app_medical/features/home/viewModel/drinks_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  DrinksAPi drinksAPi = DrinksAPi();
  DateFormat dateFormat = DateFormat.jm();
  String myTime = "";
  @override
  void didChangeDependencies() {
    myTime = dateFormat.format(DateTime.now());
    super.didChangeDependencies();
  }

  @override
  void initState() {
    final myModel = Provider.of<DrinksViewModel>(context, listen: false);
    myModel.getDrinksModel();
    // drinksAPi.drinksAPI();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    final myModel = Provider.of<DrinksViewModel>(context);

    // myModel.fetchDrinkModel();
    // DrinkModel drinkModel = myModel.getDrinksModel();
    // TickerProvider tickerProvider = const TickerProvider();

    logOut() {
      AuthService authService = AuthService();
      authService.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Brew Court"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logOut(),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Hello Name"),
                  Text(myTime),
                ],
              ),
              const Text("Email ID"),
            ]),
          )),
          TabBar(
            controller: _tabController,
            padding: EdgeInsets.zero,
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black87,
            tabs: const <Widget>[
              SizedBox(
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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                    child: (myModel.loading)
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: myModel.drinkModel?.drinks?.length,
                            itemBuilder: ((context, index) => Text(myModel
                                .drinkModel!.drinks![index].strDrink
                                .toString())),
                          )),
                const Text("Hello"),
              ],
            ),
          )
        ],
      ),

      // const
    );
  }
}
