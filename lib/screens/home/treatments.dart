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
import 'components/tasks/task-treatments.dart';
import 'components/title-treatments.dart';

class TreatmentsScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  HomeAnimationsController homeAnimationsController =
      Get.put(HomeAnimationsController());
  int num = 0;
  bool _isDark;
  List<Map<String, dynamic>> treatments1 = [
    {
      "step": "1. ",
      "description":
          "Asepsia con clorhexidina                                           "
    },
    {
      "step": "2. ",
      "description":
          "Anestesia general, aunque las incisiones se hagan a través de los tejidos necrosados y, por tanto, insensibles"
    },
    {
      "step": "3. ",
      "description":
          "Las incisiones se efectúan en los bordes interno y externo del brazo y del antebrazo, en el eje del miembro"
    },
    {
      "step": "4. ",
      "description":
          "Una incisión transversal del pliegue de flexión del codo permite desbridar los vasos humerales"
    },
    {
      "step": "5. ",
      "description":
          "La hemorragia de las venas basílica y cefálica requiere ligaduras apretadas."
    },
    {
      "step": "6. ",
      "description":
          "En el codo hay que mantenerse a distancia del surco del nervio cubital."
    },
    {
      "step": "7. ",
      "description":
          "En la muñeca no hay que lesionar los elementos vasculonerviosos y los tendones por debajo del ligamento anular del carpo"
    },
    {
      "step": "8. ",
      "description":
          "Las incisiones de la mano son dorsales en los valles Inter metacarpianos."
    },
    {
      "step": "9. ",
      "description":
          "En los dedos son dorsales, un poco por encima de la unión dorso palmar para mantenerse a distancia de los ejes vasculonerviosos"
    },
    {
      "step": "10. ",
      "description":
          "También deben respetar las comisuras digitales, que a menudo no están afectadas por la quemadura"
    },
    {
      "step": "11. ",
      "description":
          "Las incisiones abren la epidermis y la dermis a nivel de las zonas quemadas y, en ocasiones, la fascia superficial, pero no las aponeurosis musculares"
    },
    {
      "step": "12. ",
      "description":
          "La hemostasia debe efectuarse de forma minuciosa, por electrocoagulación y ligadura vascular"
    },
    {
      "step": "13. ",
      "description":
          "Se cubren las incisiones en forma laxa con compresa estéril impregnada con un antibiótico tópico apropiado"
    },
    // Treatment for skin grafting
    {
      "step": "1. ",
      "description":
          "Se reseca la piel quemada en finas capas sucesivas, en sentido paralelo a la superficie cutánea"
    },
    {
      "step": "2. ",
      "description":
          "Disección fina, con tijera o bisturí de hoja, para separar los tejidos quemados."
    },
    {
      "step": "3. ",
      "description":
          "La escisión se lleva a cabo de forma progresiva, plano por plano, hasta alcanzar los tejidos sanos subyacentes, que se reconocen por la hemorragia uniforme"
    },
  ];

  List<Map<String, dynamic>> treatments2 = [
    // Treatment for lower limb fasciotomy
    {
      "step": "1. ",
      "description":
          "Asepsia con clorhexidina                                                      "
    },
    {
      "step": "2. ",
      "description":
          "Se recomienda anestesia general                                               "
    },
    {
      "step": "3. ",
      "description":
          "Las incisiones siguen los bordes interno y externo del miembro inferior, en el eje del muslo y de la pierna."
    },
    {
      "step": "4. ",
      "description":
          "La hemostasia debe efectuarse de forma minuciosa, por electrocoagulación y ligadura vascular"
    },
    {
      "step": "5. ",
      "description":
          "El principal riesgo es el sangrado de una rama de la vena safena.                      "
    },
    {
      "step": "6. ",
      "description":
          "El desbridamiento de la fosa poplítea es transversal por encima del cayado de la safena externa, que puede causar serias dificultades de hemostasia."
    },
    {
      "step": "7. ",
      "description":
          "El otro peligro anatómico es el tronco del nervio ciático poplíteo externo cuando envuelve la cabeza del peroné."
    },
    {
      "step": "8. ",
      "description":
          "El desbridamiento en el tobillo es transversal, respetando los vasos y los tendones por debajo del ligamento anular del tarso y el surco retro maleolar."
    },
    {
      "step": "9. ",
      "description":
          "Las incisiones de la cara dorsal del pie son radiales.                                  "
    },
    {
      "step": "10. ",
      "description":
          "Se cubren las incisiones en forma laxa con compresa estéril impregnada con un antibiótico tópico apropiado"
    },

    // Treatment for skin grafting
    {
      "step": "1. ",
      "description":
          "Asepsia con clorhexidina del sitio donde se va a tomar el autoinjerto y de la zona a injertar"
    },
    {
      "step": "2. ",
      "description":
          "Anestesia general                                                          "
    },
    {
      "step": "3. ",
      "description":
          "Se hace la elección del sitio donante, las zonas dadoras para los autoinjertos son los muslos, las piernas, los brazos y la espalda"
    },
    {
      "step": "4. ",
      "description":
          "Se lubrica el área donante, se tensa la piel y se pasa el dermatomo                                "
    },
    {
      "step": "5. ",
      "description":
          "Se toma la piel extraída con adson sin garra y se hala, se secciona con tijeras de Metzembaum"
    },
    {
      "step": "6. ",
      "description":
          "Se conserva el injerto en solución salina                                "
    },
    {
      "step": "7. ",
      "description":
          "Se cubre el sitio donante con gasa o compresa impregnada de solución salina"
    },
    {
      "step": "8. ",
      "description":
          "Se realiza desbridamiento del sitio receptor, se mide el tamaño del injerto que se necesita"
    },
    {
      "step": "9. ",
      "description":
          "Se coloca el injerto y si se desea de fija con Polipropileno 5/0 3/8 13 mm P-3 o Polipropileno 4/0 3/8 20mm SC-20"
    },
    {
      "step": "10. ",
      "description":
          "La zona donante se deja vendada con nitrofurazona u otro apósito hemostático"
    },
    {
      "step": "11. ",
      "description":
          "Se realiza vendaje con vendas de algodón                            "
    }
  ];

  List<Map<String, dynamic>> treatments3 = [
    {
      "step": "1. ",
      "description":
          "Asepsia con clorhexidina                                      ",
    },
    {
      "step": "2. ",
      "description":
          "Se recomienda anestesia general, aunque las incisiones se hagan a través de los tejidos necrosados y, por tanto, insensibles.",
    },
    {
      "title": "3. ",
      "description":
          "Las incisiones deben respetar los vasos subclavios y axilares. Siguen las líneas axilares anteriores derecha e izquierda, desde 1 cm por debajo de la clavícula hasta el borde costal, rodeando el pezón. Si es necesario, se completan con incisiones paralelas y una incisión horizontal por debajo del borde costal.",
    },
    {
      "step": "4. ",
      "description":
          "Las incisiones deben abrirse los tegumentos quemados sólo a nivel de las escaras, sin extenderse hasta la piel sana y las quemaduras superficiales. En profundidad se limitan al plano del tejido adiposo subcutáneo",
    },
    {
      "step": "5. ",
      "description":
          "La hemostasia debe efectuarse de forma minuciosa, por electrocoagulación y ligadura vascular",
    },
    {
      "step": "6. ",
      "description":
          "Se cubren las incisiones en forma laxa con compresa estéril impregnada con un antibiótico tópico apropiado",
    },
  ];

  List<Map<String, dynamic>> treatments4 = [
    {
      "step": "1. ",
      "description":
          "Asepsia con clorhexidina, no aplicar en ojos, oídos, e interior de la boca",
    },
    {
      "step": "2. ",
      "description":
          "Se necesita aplicar anestesia general ya que se va a trabajar en la zona facial",
    },
    {
      "step": "3. ",
      "description":
          "La incisión debe hacerse con hojas de bisturí finas con una técnica cuidadosa, conservando los elementos constitutivos de la estética facial",
    },
    {
      "step": "4. ",
      "description":
          "La escisión no debe ser demasiado precoz para no sacrificar inútilmente los tejidos que puedan presentar una cicatrización espontánea",
    },
    {
      "step": "5. ",
      "description":
          "Las incisiones se cubren con compresas estériles impregnadas con un antibiótico tópico, cuidando los ojos, nariz y boca.",
    },
    {
      "step": "1. ",
      "description":
          "Asepsia con clorhexidina del sitio donde se va a tomar el autoinjerto y de la zona a injertar",
    },
    {
      "step": "2. ",
      "description":
          "Anestesia general                                                                        ",
    },
    {
      "step": "3. ",
      "description":
          "Elección del sitio donante: Idealmente, esta piel se obtiene del cuero cabelludo, cuyo color es de forma natural muy parecido al de la piel facial y para injertos gruesos las regiones supraclaviculares. La utilización de injertos de piel de otros sitios donantes (muslos, abdomen) debe evitarse siempre que sea posible; si se emplean, provocan un efecto de parche antiestético, debido a la coloración más amarillenta o parda de la piel situada debajo del tórax.",
    },
    {
      "step": "4. ",
      "description":
          "Se lubrica el área donante, se tensa la piel y se pasa el dermatomo",
    },
    {
      "step": "5. ",
      "description":
          "Se toma la piel extraída con adson sin garra y se hala, se secciona con tijeras de Metzembaum",
    },
    {
      "step": "6. ",
      "description":
          "Nota: Los injertos mallados están absolutamente prohibidos en la cara, porque el aspecto mallado persiste después de cicatrización. Se debe utilizar una piel no mallada, apenas perforada con un trocar o con una hoja de bisturí del n.° 11. (5)",
    },
    {
      "step": "7. ",
      "description":
          "Se conserva el injerto en solución salina                                              ",
    },
    {
      "step": "8. ",
      "description":
          "Se cubre el sitio donante con gasa o compresa impregnada de solución salina",
    },
    {
      "step": "9. ",
      "description":
          "Se realiza desbridamiento del sitio receptor respetando las unidades estéticas",
    },
    {
      "step": "10. ",
      "description":
          "Se coloca el injerto y si se desea se fija con Polipropileno o monocryl.",
    },
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
                  TreatmentsTitleText(),
                  // TreatmentsTasks(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Tratamiento quirúrgico de pacientes quemados en extremidades superiores",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Escarotomías y desbridamiento:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TreatmentsTasks(
                    title: treatments1[0]["step"],
                    description: treatments1[0]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[1]["step"].toString(),
                    description: treatments1[1]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[2]["step"].toString(),
                    description: treatments1[2]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[3]["step"].toString(),
                    description: treatments1[3]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[4]["step"].toString(),
                    description: treatments1[4]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[5]["step"].toString(),
                    description: treatments1[5]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[6]["step"].toString(),
                    description: treatments1[6]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[7]["step"].toString(),
                    description: treatments1[7]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[8]["step"].toString(),
                    description: treatments1[8]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[9]["step"].toString(),
                    description: treatments1[9]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[10]["step"].toString(),
                    description: treatments1[10]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[11]["step"].toString(),
                    description: treatments1[11]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[12]["step"].toString(),
                    description: treatments1[12]["description"],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Desbridamiento:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  TreatmentsTasks(
                    title: treatments1[13]["step"].toString(),
                    description: treatments1[13]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[14]["step"].toString(),
                    description: treatments1[14]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments1[15]["step"].toString(),
                    description: treatments1[15]["description"],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child: Image.asset('assets/images/1.jpeg', width: 350),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child: Image.asset('assets/images/2.jpeg', width: 350),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Tratamiento quirúrgico de pacientes quemados en extremidades inferiores",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Escarotomías y desbridamiento: ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TreatmentsTasks(
                    title: treatments2[0]["step"],
                    description: treatments2[0]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[1]["step"],
                    description: treatments2[1]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[2]["step"],
                    description: treatments2[2]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[3]["step"],
                    description: treatments2[3]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[4]["step"],
                    description: treatments2[4]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[5]["step"],
                    description: treatments2[5]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[6]["step"],
                    description: treatments2[6]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[7]["step"],
                    description: treatments2[7]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[8]["step"],
                    description: treatments2[8]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[9]["step"],
                    description: treatments2[9]["description"],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Injertos: ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TreatmentsTasks(
                    title: treatments2[10]["step"],
                    description: treatments2[10]["description"],
                  ),

                  TreatmentsTasks(
                    title: treatments2[11]["step"],
                    description: treatments2[11]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[12]["step"],
                    description: treatments2[12]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[13]["step"],
                    description: treatments2[13]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[14]["step"],
                    description: treatments2[14]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[15]["step"],
                    description: treatments2[15]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[16]["step"],
                    description: treatments2[16]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[17]["step"],
                    description: treatments2[17]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[18]["step"],
                    description: treatments2[18]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[19]["step"],
                    description: treatments2[19]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments2[20]["step"],
                    description: treatments2[20]["description"],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Tratamiento quirúrgico de pacientes quemados en tórax",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "El objetivo del tratamiento quirúrgico de las secuelas por quemaduras torácicas es, por una parte, en todos los pacientes, restaurar una cobertura cutánea flexible y funcional y, por otra parte, recuperar la estética de la región mamaria en las mujeres adultas y permitir el crecimiento mamario en las niñas.",
                      style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.5)
                              : Colors.black.withOpacity(0.3)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Escarotomías y desbridamiento: ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TreatmentsTasks(
                    title: treatments3[0]["step"],
                    description: treatments3[0]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments3[1]["step"],
                    description: treatments3[1]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments3[2]["step"],
                    description: treatments3[2]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments3[3]["step"],
                    description: treatments3[3]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments3[4]["step"],
                    description: treatments3[4]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments3[5]["step"],
                    description: treatments3[5]["description"],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Tratamiento quirúrgico de pacientes quemados en zona facial",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Es fundamental preservar desde el estadio agudo todos los elementos constitutivos de la estética facial: piel lisa y de color homogéneo, relieves y contornos armoniosos y simétricos.",
                      style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.5)
                              : Colors.black.withOpacity(0.3)),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Escarotomías y desbridamiento: ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  TreatmentsTasks(
                    title: treatments4[0]["step"],
                    description: treatments4[0]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[1]["step"],
                    description: treatments4[1]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[2]["step"],
                    description: treatments4[2]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[3]["step"],
                    description: treatments4[3]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[4]["step"],
                    description: treatments4[4]["description"],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 15.0, bottom: 20.0),
                    child: Text(
                      "Injerto: ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TreatmentsTasks(
                    title: treatments4[5]["step"],
                    description: treatments4[5]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[6]["step"],
                    description: treatments4[6]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[7]["step"],
                    description: treatments4[7]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[8]["step"],
                    description: treatments4[8]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[9]["step"],
                    description: treatments4[9]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[10]["step"],
                    description: treatments4[10]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[11]["step"],
                    description: treatments4[11]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[12]["step"],
                    description: treatments4[12]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[13]["step"],
                    description: treatments4[13]["description"],
                  ),
                  TreatmentsTasks(
                    title: treatments4[14]["step"],
                    description: treatments4[14]["description"],
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
