import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proyectoaula/constants/routes.dart';
import 'package:proyectoaula/controllers/home/home-controller.dart';
import 'package:proyectoaula/screens/home/components/drawer/items/item.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeDrawerItem(
            title: "Inicio",
            icon: FontAwesomeIcons.home,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, home_route);
            }),
        HomeDrawerItem(
            title: "anatomía de la piel",
            icon: FontAwesomeIcons.prayingHands,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, anatomy_route);
            }),
        HomeDrawerItem(
            title: "Generalidades quemaduras",
            icon: FontAwesomeIcons.plusCircle,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, burns_route);
            }),
        HomeDrawerItem(
            title: "Cicatrización",
            icon: FontAwesomeIcons.plusCircle,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, cicatrization_route);
            }),
        HomeDrawerItem(
            title: "Tipos de injerto de piel",
            icon: FontAwesomeIcons.handSparkles,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, grafttypes_route);
            }),
        // HomeDrawerItem(
        //     title: "Delete all tasks",
        //     icon: FontAwesomeIcons.solidTrashAlt,
        //     onTap: () async {
        //       Get.find<HomeController>().advancedDrawerController.hideDrawer();
        //       await Future.delayed(Duration(milliseconds: 420));
        //       showDialog(
        //         context: context,
        //         builder: (context) {
        //           return RemoveAllTasksDialog();
        //         },
        //       );
        //     }),
        HomeDrawerItem(
            title: "Insumos e instrumental",
            icon: FontAwesomeIcons.crutch,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, supplies_route);
            }),
        // HomeDrawerItem(
        //     title: "Support",
        //     icon: FontAwesomeIcons.handHoldingHeart,
        //     onTap: () {
        //       _launchInBrowser('https://github.com/ErfanRht/');
        //     }),
        HomeDrawerItem(
            title: "Tratamientos quirúrgicos",
            icon: FontAwesomeIcons.handHoldingHeart,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              Navigator.pushNamed(context, treatments_route);
            }),
        HomeDrawerItem(
            title: "Salir",
            icon: FontAwesomeIcons.signOutAlt,
            onTap: () async {
              Get.find<HomeController>().advancedDrawerController.hideDrawer();
              await Future.delayed(Duration(milliseconds: 420));
              SystemNavigator.pop();
            }),
      ],
    );
  }

  DrawerItem(String s, IconData checkDouble, Future<Null> Function() param2) {}
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
