import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/screens/home/animations.dart';

class AnatomyTasks extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return GetBuilder<HomeAnimationsController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _.tasksTitleOpacity,
                    child: Text(
                      "1. Regular la temperatura corporal.",
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
                ),

                // Padding(
                //   padding: const EdgeInsets.only(right: 25.0),
                //   child: AnimatedOpacity(
                //       duration: _animationDuration,
                //       opacity: _.tasksTitleOpacity,
                //       child: IconButton(
                //           icon: Icon(FontAwesomeIcons.checkDouble,
                //               size: 22.5,
                //               color: _isDark
                //                   ? kBackgroundColor.withOpacity(0.5)
                //                   : Colors.black.withOpacity(0.3)),
                //           onPressed: () async {
                //             await Future.delayed(Duration(milliseconds: 111));
                //             doneAllTasks();
                //           })),
                // ),
              ],
            ),
            SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(top: 25.0, left: -25.0),
            //   child: AnimatedOpacity(
            //     duration: _animationDuration,
            //     opacity: _.tasksTitleOpacity,
            //     child: Text(
            //       "2. Detectar las sensaciones cutáneas..",
            //       style: TextStyle(
            //           fontSize: 18.5,
            //           fontWeight: FontWeight.bold,
            //           color: _isDark
            //               ? kBackgroundColor.withOpacity(0.5)
            //               : Colors.black.withOpacity(0.3)),
            //       maxLines: 3,
            //       // overflow: TextOverflow.ellipsis,
            //     ),
            //   ),
            // ),
            // HomeTasksItems()
          ],
        ),
      );
    });
  }
}
