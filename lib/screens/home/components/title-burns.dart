import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/controllers/main-controller.dart';
import 'package:proyectoaula/screens/home/animations.dart';

// ignore: must_be_immutable
class BurnsTitleText extends StatelessWidget {
  MainController mainController = Get.put(MainController());
  Duration _animationDuration = Duration(milliseconds: 750);
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return GetBuilder<HomeAnimationsController>(builder: (_) {
      return AnimatedPadding(
        padding: _.titlePadding,
        duration: _animationDuration,
        child: AnimatedOpacity(
          opacity: _.titleOpacity,
          duration: _animationDuration,
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "Generalidades de \n quemaduras",
                  style: GoogleFonts.ubuntu(
                    fontSize: 35,
                    color: _isDark ? kBackgroundColor : Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
