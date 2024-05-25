import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/constants/routes.dart';
import 'package:proyectoaula/controllers/main-controller.dart';
import 'package:proyectoaula/screens/home/home.dart';
import 'package:proyectoaula/screens/home/anatomy.dart';
import 'package:proyectoaula/screens/home/burns.dart';
import 'package:proyectoaula/screens/home/cicatrization.dart';
import 'package:proyectoaula/screens/home/grafttypes.dart';
import 'package:proyectoaula/screens/home/supplies.dart';
import 'package:proyectoaula/screens/home/instrumental.dart';
import 'package:proyectoaula/screens/home/treatments.dart';
import 'package:proyectoaula/screens/home/bibliography.dart';
import 'package:proyectoaula/screens/loading/loading.dart';

void main() {
  runApp(App());
}

// ignore: must_be_immutable
class App extends StatelessWidget {
  MainController mainController = Get.put(MainController());
  final String initRoute = loading_route;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manejo de Quemaduras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: initRoute,
      routes: {
        loading_route: (context) => LoadingScreen(),
        home_route: (context) => HomeScreen(),
        anatomy_route: (context) => AnatomyScreen(),
        burns_route: (context) => BurnsScreen(),
        cicatrization_route: (context) => CicatrizationScreen(),
        grafttypes_route: (context) => GraftTypesScreen(),
        supplies_route: (context) => SuppliesScreen(),
        instrumental_route: (context) => InstrumentalScreen(),
        treatments_route: (context) => TreatmentsScreen(),
        bibliography_route: (context) => BibliographyScreen(),
      },
    );
  }
}
