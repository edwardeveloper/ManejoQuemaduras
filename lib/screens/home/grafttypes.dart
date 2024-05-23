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
import 'components/tasks/task-grafttype.dart';
import 'components/title-grafttypes.dart';

class GraftTypesScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  HomeAnimationsController homeAnimationsController =
      Get.put(HomeAnimationsController());
  int num = 0;
  bool _isDark;
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
                  GraftTypesTitleText(),
                  // GraftTypeTasks(),
                  Card(
                    // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      // side:
                      //     const BorderSide(color: Colors.black38, width: 2)
                    ),
                    // Set the clip behavior of the card
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.all(25),
                    elevation: 0,
                    color: _isDark
                        ? kBackgroundColor.withOpacity(0.2)
                        : Color.fromARGB(255, 151, 142, 142).withOpacity(0.2),
                    // Define the child widgets of the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                        Image.asset(
                          'assets/images/injertototal.jpg',
                          height: 310,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // Add a container with padding that contains the card's title, text, and buttons
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display the card's title using a font size of 24 and a dark grey color
                              Text(
                                "Injertos cutáneos de espesor total",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: _isDark
                                        ? kBackgroundColor.withOpacity(0.8)
                                        : Colors.black.withOpacity(0.8)
                                    // fontWeight: FontWeight.w700,
                                    ),
                              ),
                              // Add a space between the title and the text
                              Container(height: 10),
                              // Display the card's text using a font size of 15 and a light grey color
                              Text(
                                'están compuestos por el conjunto de la epidermis y el grosor completo de la dermis, incluidas las estructuras anejas, como los folículos pilosos y las glándulas sudoríparas.',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18.5,
                                    fontWeight: FontWeight.bold,
                                    color: _isDark
                                        ? kBackgroundColor.withOpacity(0.5)
                                        : Colors.black.withOpacity(0.3)),
                              ),
                              Container(height: 10),
                            ],
                          ),
                        ),
                        // Add a small space between the card and the next widget
                        Container(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // Set the clip behavior of the card
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.only(left: 25.0, right: 25.0),
                    elevation: 0,
                    color: _isDark
                        ? kBackgroundColor.withOpacity(0.2)
                        : Color.fromARGB(255, 151, 142, 142).withOpacity(0.2),
                    // Define the child widgets of the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                        Image.asset(
                          'assets/images/injertoparcial.jpg',
                          height: 310,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // Add a container with padding that contains the card's title, text, and buttons
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display the card's title using a font size of 24 and a dark grey color
                              Text(
                                "Injertos cutáneos de espesor parcial",
                                style: GoogleFonts.ubuntu(
                                  fontSize: 20,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Add a space between the title and the text
                              Container(height: 10),
                              // Display the card's text using a font size of 15 and a light grey color
                              Text(
                                'Están constituidos por el grosor completo de la epidermis y por el grosor parcial de la dermis. Estos injertos pueden diferenciarse en delgados, intermedios o gruesos, dependiendo de la cantidad de dermis que se incluya en ellos.',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 18.5,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(height: 10),
                            ],
                          ),
                        ),
                        // Add a small space between the card and the next widget
                        Container(height: 5),
                      ],
                    ),
                  ),
                  Card(
                    // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // Set the clip behavior of the card
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.all(25),
                    elevation: 0,
                    color: _isDark
                        ? kBackgroundColor.withOpacity(0.2)
                        : Color.fromARGB(255, 151, 142, 142).withOpacity(0.2),
                    // Define the child widgets of the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                        // Image.asset(
                        //   'assets/images/injertoparcial.jpg',
                        //   height: 310,
                        //   width: double.infinity,
                        //   fit: BoxFit.cover,
                        // ),
                        // Add a container with padding that contains the card's title, text, and buttons
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Display the card's title using a font size of 24 and a dark grey color
                              Text(
                                "Injertos compuestos:",
                                style: GoogleFonts.ubuntu(
                                  fontSize: 20,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Add a space between the title and the text
                              Container(height: 10),
                              // Display the card's text using a font size of 15 and a light grey color
                              Text(
                                'constan de al menos dos tipos de tejidos distintos, habitualmente piel y cartílago.',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 18.5,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(height: 10),
                            ],
                          ),
                        ),
                        // Add a small space between the card and the next widget
                        Container(height: 5),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Injertos de cartílago libre ',
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.8)
                                : Colors.black.withOpacity(0.8)),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  ' constan de cartílago con su pericondrio correspondiente. \nDe acuerdo al material pueden ser: ',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Biológico, ',
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.8)
                                : Colors.black.withOpacity(0.8)),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  ' deriva de tejido vivo y se divide en los siguientes:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.fiber_smart_record,
                              size: 22,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.8),
                            ),
                          ),
                          TextSpan(
                              text: ' Aloinjerto:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' injerto transferido de un individuo a otro. Los aloinjertos, también llamados homoinjertos, se extraen de do- nantes y se conservan en bancos de tejidos hasta que sea necesario utilizarlos. La piel, el hueso y el cartílago son empleados comúnmente en aloinjertos. Una vez implantado el aloinjerto, se incorpora a los tejidos del paciente y es eventualmente absorbido.',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.fiber_smart_record,
                              size: 22,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.8),
                            ),
                          ),
                          TextSpan(
                              text: ' Autoinjerto:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' injerto biológico tomado de un área del cuerpo y trasplantado a otra zona del mismo paciente. Los tejidos comúnmente utilizados son: piel, hueso, cartílago y grasa.',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.fiber_smart_record,
                              size: 22,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.8),
                            ),
                          ),
                          TextSpan(
                              text: ' Injerto compuesto:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' injerto biológico compuesto por más de un tipo de tejido (piel, vasos sanguíneos, nervios y fascia). Estos injertos se clasifican según el método de trasplante (se describe más adelante en este capítulo en los procedimientos quirúrgicos).',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.fiber_smart_record,
                              size: 22,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.8),
                            ),
                          ),
                          TextSpan(
                              text: ' Xenoinjerto:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' injerto de tejido que se toma de una especie y se injerta en otra (piel porcina o bovina que se injerta en un paciente).',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.fiber_smart_record,
                              size: 22,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.8),
                            ),
                          ),
                          TextSpan(
                              text: ' Sintético:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' deriva de materiales artificiales                                         ',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.fiber_smart_record,
                              size: 22,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.8),
                            ),
                          ),
                          TextSpan(
                              text: ' Biosintético:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' es absorbido por el cuerpo o mejora la curación, pero no deriva de tejido biológico.',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.5)
                                      : Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
            // floatingActionButton: Padding(
            //     padding: const EdgeInsets.only(right: 15, bottom: 25),
            //     child: HomeFloatingButton()),
          ),
        );
      },
    );
  }
}
