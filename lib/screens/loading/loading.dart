import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/constants/routes.dart';
import 'package:proyectoaula/models/set-system-overlay-style.dart';
import 'package:proyectoaula/constants/types.dart';
import 'package:proyectoaula/screens/loading/animations.dart';
import 'package:proyectoaula/screens/loading/components/logo.dart';
import 'package:proyectoaula/screens/loading/components/spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LoadingAnimationsController loadingAnimationsController =
      Get.put(LoadingAnimationsController());
  String nextRoute;
  bool isFirstEnter;
  bool _isDark;
  @override
  void initState() {
    super.initState();
    nextRoute = home_route;
    isFirstEnter = true;
    startLoadingAnimations();
    pass();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    _isDark
        ? setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.DARK)
        : setSystemUIOverlayStyle(
            systemUIOverlayStyle: SystemUIOverlayStyle.LIGHT);
    return Scaffold(
      backgroundColor: _isDark ? kDarkBackgroundColor : kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            LoadingLogo(
              isDark: _isDark,
            ),
            SizedBox(),
            LoadingSpinkit(
              isDark: _isDark,
            ),
          ],
        ),
      ),
    );
  }

  pass() async {
    await Future.delayed(loadingAnimationsController.allAnimationTimes);
    Navigator.pushReplacementNamed(context, home_route);
  }
}
