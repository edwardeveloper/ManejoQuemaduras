import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/screens/loading/animations.dart';

class LoadingLogo extends StatelessWidget {
  bool isDark;
  LoadingLogo({this.isDark});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingAnimationsController>(builder: (_) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _.logoOpacity,
            duration: _.animationSpeed,
            child: AnimatedPadding(
              duration: _.animationSpeed,
              padding: _.logoTextpadding,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          AnimatedOpacity(
            opacity: _.textOpacity,
            duration: _.animationSpeed,
            child: Text(
              "Manejo de quemaduras",
              style: GoogleFonts.ubuntu(
                  color: isDark ? Colors.white : kSecondaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
          )
        ],
      );
    });
  }
}
