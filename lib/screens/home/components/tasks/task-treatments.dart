import 'package:flutter/material.dart';
import 'package:proyectoaula/constants/colors.dart';

// ignore: must_be_immutable
class TreatmentsTasks extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  bool _isDark;

  final String title;
  final String description;

  TreatmentsTasks({
    key,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
      child: Text.rich(
        TextSpan(
          text: title,
          style: TextStyle(
              fontSize: 18.5,
              fontWeight: FontWeight.bold,
              color: _isDark
                  ? kBackgroundColor.withOpacity(0.8)
                  : Colors.black.withOpacity(0.8)),
          children: <TextSpan>[
            TextSpan(
                text: description,
                style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                    color: _isDark
                        ? kBackgroundColor.withOpacity(0.5)
                        : Colors.black.withOpacity(0.3))),
          ],
        ),
      ),
    );
  }
}
