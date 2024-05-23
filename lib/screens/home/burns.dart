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
import 'package:proyectoaula/screens/home/components/title-burns.dart';

class BurnsScreen extends StatelessWidget {
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
                  BurnsTitleText(),
                  // BurnsTasks(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 25.0, right: 20.0, bottom: 25.0),
                    child: Text(
                      "Según la profundidad las quemaduras se clasifican en:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
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
                              text: ' Clasificación de primer grado:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' son quemaduras que incluyen solo la epidermis, no producen secuelas histológicas permanentes producen dolor y color eritematoso. Su curación es espontanea y puede durar 5 días.',
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
                              text: ' Clasificación de segundo grado:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' afecta hasta la dermis papilar; es de color rojo y húmeda, y presenta flictena y edema. Se asocia a dolor intenso. Cura en 5-15 días sin cicatriz patológica.',
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
                              text: ' Clasificación de segundo grado profundo:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' afecta hasta la dermis reticular; es de color blanco amarillento moteado y seca. Se asocia a dolor poco intenso (terminaciones nerviosas parcialmente destruidas). Cura en 3 semanas con cicatriz patológica. Puede requerir cirugía.',
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
                              text:
                                  ' Clasificación de tercer grado o de espesor total:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' afecta a todo el espesor cutáneo. Es pálida, de color grisáceo o negruzco, seca y deprimida. Puede exponerse tejido graso y hueso. Cursa sin dolor (terminaciones nerviosas totalmente destruidas). No cura. Precisa cirugía.',
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
                              text: ' Clasificación de cuarto grado:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' son quemaduras en las cuales el daño se extiende a estructuras profundas como músculos, tendones y huesos. El tratamiento incluye cirugía y de acuerdo a la gravedad puede hacerse una amputación.',
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
                    child: Text(
                      "Según el agente causante pueden ser:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
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
                              text: ' Lesiones térmicas:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' por llama, escaldaduras por líquidos calientes, por contacto (metales, vidrio) y por gases calientes.',
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
                              text: ' Químicas:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' producidas por álcalis o ácidos; son progresivas hasta que se neutralizan y deben ser consideradas profundas.',
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
                              text: ' Alto voltaje:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' no existe relación entre el porcentaje de superficie cutánea quemada (%SCQ) y la masa de tejido lesionado.',
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
                              text: ' Por radiación:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' ionizantes (radioactividad) y no ionizantes (quemaduras solares y fogonazo eléctrico)',
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

                  // Padding(
                  //     padding: const EdgeInsets.only(
                  //         left: 25.0, right: 25.0, bottom: 25.0),
                  //     child: Text.rich(
                  //       TextSpan(
                  //         text: 'Hello',
                  //         style: TextStyle(
                  //             fontSize: 18.5,
                  //             fontWeight: FontWeight.bold,
                  //             color: _isDark
                  //                 ? kBackgroundColor.withOpacity(0.8)
                  //                 : Colors.black
                  //                     .withOpacity(0.3)), // default text style
                  //         children: <TextSpan>[
                  //           TextSpan(
                  //               text: ' beautiful ',
                  //               style: TextStyle(fontStyle: FontStyle.italic)),
                  //           TextSpan(
                  //               text: 'world',
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold,
                  //                   color: _isDark
                  //                       ? kBackgroundColor.withOpacity(0.5)
                  //                       : Colors.black.withOpacity(0.3))),
                  //         ],
                  //       ),
                  //     )),
                  // Padding(
                  //     padding: const EdgeInsets.only(
                  //         left: 25.0, right: 25.0, bottom: 25.0),
                  //     child: Text.rich(
                  //       TextSpan(
                  //         text: 'Hello', // default text style
                  //         children: <TextSpan>[
                  //           TextSpan(
                  //               text: ' beautiful ',
                  //               style: TextStyle(fontStyle: FontStyle.italic)),
                  //           TextSpan(
                  //               text: 'world',
                  //               style: TextStyle(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //     )
                  // ),
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
