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
import 'package:proyectoaula/screens/home/components/tasks/task-treatments.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class BibliographyScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  HomeAnimationsController homeAnimationsController =
      Get.put(HomeAnimationsController());
  int num = 0;
  bool _isDark;
  List<Map<String, dynamic>> bibli = [
    {
      "step": "1. ",
      "description":
          "Tortora. Principios de anatomía y fisiología. s.l. : PANAMERICANA, 2018.                                           "
    },
    {
      "step": "2. ",
      "description":
          "Lesiones derivadas de los incendios: quemados e itoxicación por humo. Caparrós y Boter. s.l. : Elsevie, 2020."
    },
    {
      "step": "3. ",
      "description":
          "Cirugía plástica reparadora y estética. Duquennoy, Guerreschip, Depoortère. 1, s.l. : Elsevier, 2021, Vol. 29."
    },
    {
      "step": "4. ",
      "description":
          "Ratner, Nayyar. Injertos. Dermatología. s.l. : ELSEVIER, 2019."
    },
    {
      "step": "5. ",
      "description":
          "Voulliaume, Comparin, Viard, P. Foyatier. Tratamiento quirúrgico de las secuelas de quemaduras de la cara. Cirugía plástica reparadora y estética. s.l. : Elsevier, 2017, Vol. 25."
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
                    RichText(
                      text: TextSpan(
                        text: "Bibliografía",
                        style: GoogleFonts.ubuntu(
                          fontSize: 35,
                          color: _isDark ? kBackgroundColor : Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TreatmentsTasks(
                      title: bibli[0]["step"],
                      description: bibli[0]["description"],
                    ),
                    TreatmentsTasks(
                      title: bibli[1]["step"],
                      description: bibli[1]["description"],
                    ),
                    TreatmentsTasks(
                      title: bibli[2]["step"],
                      description: bibli[2]["description"],
                    ),
                    TreatmentsTasks(
                      title: bibli[3]["step"],
                      description: bibli[3]["description"],
                    ),
                    TreatmentsTasks(
                      title: bibli[4]["step"],
                      description: bibli[4]["description"],
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

Future<void> _launchInBrowser(String url) async {
  try {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } catch (e) {
    throw 'Could not launch $url';
  }
}
