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
import 'package:proyectoaula/screens/home/components/tasks/tasks.dart';
import 'package:proyectoaula/screens/home/components/title-text.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
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
                children: [HomeNavbar(), HomeTitleText(), HomeTasks()],
              ),
            )),
          ),
        );
      },
    );
  }
}
