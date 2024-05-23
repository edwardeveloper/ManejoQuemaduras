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
import 'package:proyectoaula/screens/home/components/title-cicatrization.dart';

class CicatrizationScreen extends StatelessWidget {
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
                  CicatrizationTitleText(),
                  // CicatrizationTasks()
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 25.0, bottom: 25.0),
                    child: Text(
                      "La cicatrización cutánea es el proceso en el cual se genera el cierre de una perdida de sustancia cutánea por un tejido conjuntivo y epitelial cicatrizal. Es decir, el cierre de una herida.",
                      style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.5)
                              : Colors.black.withOpacity(0.3)),
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text(
                      "Proceso de cicatrización:",
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
                        text: 'Hemostasia, ',
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.8)
                                : Colors.black.withOpacity(0.8)),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  ' el coágulo se forma en la herida y la protege, ya que el coágulo se forma de plaquetas.',
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
                              text: ' Fase inflamatoria y vascular:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' vasodilatación, que permite la diapédesis de algunas células sanguíneas, y el paso a los tejidos del líquido necesario para la formación de una matriz extracelular provisional, que sostiene el tejido cicatricial. Al mismo tiempo, la neoangiogénesis tiene lugar gracias a la estimulación de los vasos de la herida por los numerosos factores de crecimiento resultantes en particular de la desgranulación de las plaquetas.',
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
                      "Fenómenos celulares:",
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
                              text: ' Células polimorfonucleares:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' contribuyen a la detersión y la lisis de las proteínas del tejido necrótico.',
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
                              text: ' Linfocitos:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' su activación contribuye a la lucha contra la infección.',
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
                              text: ' Células endoteliales:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' migran y proliferan y contribuyen a la neoangiogénesis.',
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
                              text: ' Fibroblastos:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' proliferan y se infiltran en la matriz extracelular provisional. Se transforman en fibrocitos que producen fibrina y colágeno, que inducen no sólo la retracción la herida, sino también la solidez y la resistencia mecánica.',
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
                      "Epidermización, depende de los queratinocitos aún presentes en la herida. Se multiplican a partir de la capa basal de la epidermis restante o de la de los anexos, para luego migrar y formar una neoepidermis que al principio es muy fina y luego se engrosa y se queratiniza.",
                      style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.5)
                              : Colors.black.withOpacity(0.3)),
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text(
                      "La regeneración de las terminaciones nerviosas, la recuperación de los anexos, la migración de los melanocitos y el restablecimiento, a menudo incompleto, de las glándulas sebáceas son los últimos mecanismos de la cicatrización, que suelen ser muy lentos.",
                      style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.5)
                              : Colors.black.withOpacity(0.3)),
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
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
