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
import 'package:proyectoaula/screens/home/components/title-anatomy.dart';

class AnatomyScreen extends StatelessWidget {
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
                  AnatomyTitleText(),
                  // AnatomyTasks(),

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 25.0, right: 25.0),
                    child: Text(
                      "El sistema tegumentario está formado por la piel, el pelo, las glándulas sebáceas y sudoríparas, las uñas y los receptores sensitivos, sus funciones son:",
                      style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.5)
                              : Colors.black.withOpacity(0.3)),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "1. Regular la temperatura corporal.",
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.5)
                                : Colors.black.withOpacity(0.3)),
                        maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "2. Detectar las sensaciones cutáneas.",
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.5)
                                : Colors.black.withOpacity(0.3)),
                        maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "3. Almacenar sangre.",
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.5)
                                : Colors.black.withOpacity(0.3)),
                        maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "4. Excretar y absorber sustancias.",
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.5)
                                : Colors.black.withOpacity(0.3)),
                        maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "5. Proteger el cuerpo del medio externo.",
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.5)
                                : Colors.black.withOpacity(0.3)),
                        maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 20.0, left: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "6. Sintetiza vitamina D",
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? kBackgroundColor.withOpacity(0.5)
                                : Colors.black.withOpacity(0.3)),
                        maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  // AnatomyTasks(),
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child:
                        Image.asset('assets/images/anatomia.jpeg', width: 350),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text(
                      "La piel, conocida también como membrana cutánea, cubre la superficie externa del cuerpo, y es el órgano más grande en cuanto a su peso. En el adulto, la piel cubre un área de unos dos metros cuadrados y pesa 4,5 a 5 kg, cerca de un 7% del peso corporal total. Su grosor varía desde 0,5 mm en los párpados hasta 4 mm en los talones. En la mayor parte del cuerpo su espesor es de 1-2 mm. La piel está formada por dos partes principales:",
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
                  // icon: FontAwesomeIcons.home,
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
                              text: ' Epidermis:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' La porción superficial, más delgada, compuesta por el tejido epitelial, siendo avascular y sin terminaciones nerviosas, formada por queratinocitos (95%), melanocitos, células de Langerhans y células de Merkel. La descamación de las células formadas en la capa basal tarda 2-4 semanas. Cada 48 días se renueva toda la epidermis.',
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
                              text: ' Dermis:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                            text:
                                ' La porción más profunda y gruesa, compuesta por tejido conectivo, es vascularizada. Formado principalmente por colágeno y elastinas de los fibroblastos, y sustento a la piel.',
                            style: TextStyle(
                              fontSize: 18.5,
                              fontWeight: FontWeight.bold,
                              color: _isDark
                                  ? kBackgroundColor.withOpacity(0.5)
                                  : Colors.black.withOpacity(0.3),
                            ),
                          ),
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
                              text: ' Capa subcutánea o hipodermis:',
                              style: TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.bold,
                                  color: _isDark
                                      ? kBackgroundColor.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8))),
                          TextSpan(
                              text:
                                  ' Se encuentra por debajo de la dermis, pero no forma parte de la piel. Está formada por tejido areolar y adiposo. Desde la dermis se extienden fibras que unen la piel a la capa subcutánea, la que a su vez se adhiere a la fascia subyacente, formada por tejido conectivo alrededor de los músculos y los huesos. La capa subcutánea sirve como depósito de grasa y contiene gran cantidad de vasos sanguíneos que irrigan la piel.',
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
          ),
        );
      },
    );
  }
}
