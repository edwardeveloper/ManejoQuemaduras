import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/constants/types.dart';
import 'package:proyectoaula/models/set-system-overlay-style.dart';
import 'package:proyectoaula/screens/home/animations.dart';
import 'package:proyectoaula/controllers/home/home-controller.dart';
import 'package:proyectoaula/screens/home/components/drawer/drawer.dart';
import 'package:proyectoaula/screens/home/components/navbar.dart';
import 'components/tasks/task-supplies.dart';
import 'components/title-supplies.dart';

// ignore: must_be_immutable
class SuppliesScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  HomeAnimationsController homeAnimationsController =
      Get.put(HomeAnimationsController());
  int num = 0;
  bool _isDark;
  List<Map<String, dynamic>> supplies = [
    {
      "title": "Equipo de plastia ",
      "description": "",
      "image": "assets/images/plastia1.jpg",
    },
    {
      "title": "Heparina: ",
      "description": "control de sangrado",
      "image": "assets/images/heparina.jpeg",
    },
    {
      "title": "Compresas",
      "description": "",
      "image": "assets/images/compresa.jpg",
    },
    {
      "title": "Vendas elásticas y vendas de algodón  ",
      "description": "",
      "image": "assets/images/elastica.jpg",
    },
    {
      "title": "Sulfadiazina de plata:  ",
      "description": "curaciones iniciales",
      "image": "assets/images/sulfadiazina.jpeg",
    },
    {
      "title": "Nitrofurazona:  ",
      "description": "etapa de cicatrización",
      "image": "assets/images/nitrofurazon.jpeg",
    },
    {
      "title": "Vaselina ",
      "description": "",
      "image": "assets/images/vaselina.jpg",
    },
    {
      "title": "Hojas de bisturí",
      "description": "",
      "image": "assets/images/hojas.jpg",
    },
    {
      "title": "Suturas para fijar los injertos: ",
      "description": "monocryl 3/0 4/0 o polipropileno 3/0 4/0 ",
      "image": "assets/images/monocry.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    _isDark
        ? setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.BLUE_DARK)
        : setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.LIGHT);
    homeController.advancedDrawerController.addListener(() {
      Get.find<HomeController>().changeDrawerStatus();
      if (Get.find<HomeController>().drawerStatus == DrawerStatus.OPEN) {
        _isDark
            ? setSystemUIOverlayStyle(
                systemUIOverlayStyle: SystemUIOverlayStyle.DARK)
            : setSystemUIOverlayStyle(
                systemUIOverlayStyle: SystemUIOverlayStyle.BLUE);
      } else if (Get.find<HomeController>().drawerStatus ==
          DrawerStatus.CLOSE) {
        _isDark
            ? setSystemUIOverlayStyle(
                systemUIOverlayStyle: SystemUIOverlayStyle.BLUE_DARK)
            : setSystemUIOverlayStyle(
                systemUIOverlayStyle: SystemUIOverlayStyle.LIGHT);
      }
    });
    startHomeAnimations();
    return GetBuilder<HomeController>(
      builder: (_) {
        return AdvancedDrawer(
          backdropColor: _isDark ? kDarkBackgroundColor : kSecondaryColor,
          controller: homeController.advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          openRatio: 0.66,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          drawer: HomeDrawer(),
          child: Scaffold(
            backgroundColor: _isDark ? kDarkBackgroundColor2 : kBackgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    HomeNavbar(),
                    SuppliesTitleText(),
                    Container(height: 25.0),
                    SuppliesTasks(
                      title: supplies[0]["title"],
                      description: supplies[0]["description"],
                      imageUrl: supplies[0]["image"],
                    ),
                    SuppliesTasks(
                      title: supplies[1]["title"],
                      description: supplies[1]["description"],
                      imageUrl: supplies[1]["image"],
                    ),
                    SuppliesTasks(
                      title: supplies[2]["title"],
                      description: supplies[2]["description"],
                      imageUrl: supplies[2]["image"],
                    ),
                    SuppliesTasks(
                      title: supplies[3]["title"],
                      description: supplies[3]["description"],
                      imageUrl: supplies[3]["image"],
                    ),
                    SuppliesTasks(
                      title: supplies[4]["title"],
                      description: supplies[4]["description"],
                      imageUrl: supplies[4]["image"],
                    ),
                    SuppliesTasks(
                      title: supplies[5]["title"],
                      description: supplies[5]["description"],
                      imageUrl: supplies[5]["image"],
                    ),
                    SuppliesTasks(
                      title: supplies[6]["title"],
                      description: supplies[6]["description"],
                      imageUrl: supplies[6]["image"],
                    ),
                    SuppliesTasks(
                      title: supplies[7]["title"],
                      description: supplies[7]["description"],
                      imageUrl: supplies[7]["image"],
                    ),
                    SuppliesTasks(
                      title: supplies[0]["title"],
                      description: supplies[0]["description"],
                      imageUrl: supplies[0]["image"],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
