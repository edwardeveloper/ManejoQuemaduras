import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/constants/types.dart';
import 'package:proyectoaula/models/set-system-overlay-style.dart';
import 'package:proyectoaula/screens/home/animations.dart';
import 'package:proyectoaula/controllers/home/home-controller.dart';
import 'package:proyectoaula/screens/home/components/drawer/drawer.dart';
import 'package:proyectoaula/screens/home/components/navbar.dart';
import 'components/tasks/task-supplies.dart';

class InstrumentalScreen extends StatefulWidget {
  @override
  State<InstrumentalScreen> createState() => _InstrumentalScreenState();
}

class _InstrumentalScreenState extends State<InstrumentalScreen> {
  HomeController homeController = Get.put(HomeController());

  HomeAnimationsController homeAnimationsController =
      Get.put(HomeAnimationsController());

  int num = 0;

  bool _isDark;

  List<Map<String, dynamic>> instrumental = [
    {
      "title": "Dermatomo de Padgett",
      "description": "",
      "image": "assets/images/padgett.jpeg",
    },
    {
      "title": "Dermatomo de Zimmer ",
      "description": "",
      "image": "assets/images/zimmer.jpeg",
    },
    {
      "title":
          "Dermatomo de Watson\nDermatomo de Silver\nDermatomo de Rosenburg\nDermatomo de Goulian",
      "description": "",
      "image": "assets/images/varios.jpeg",
    },
    {
      "title": "Expansor de injertos ",
      "description": "",
      "image": "assets/images/expansorinjertos.jpeg",
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
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: RichText(
                      text: TextSpan(
                        text: "Equipos e instrumental especializados",
                        style: GoogleFonts.ubuntu(
                          fontSize: 30,
                          color: _isDark ? kBackgroundColor : Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SuppliesTasks(
                    title: instrumental[0]["title"],
                    description: instrumental[0]["description"],
                    imageUrl: instrumental[0]["image"],
                  ),
                  SuppliesTasks(
                    title: instrumental[1]["title"],
                    description: instrumental[1]["description"],
                    imageUrl: instrumental[1]["image"],
                  ),
                  SuppliesTasks(
                    title: instrumental[2]["title"],
                    description: instrumental[2]["description"],
                    imageUrl: instrumental[2]["image"],
                  ),
                  SuppliesTasks(
                    title: instrumental[3]["title"],
                    description: instrumental[3]["description"],
                    imageUrl: instrumental[3]["image"],
                  ),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
