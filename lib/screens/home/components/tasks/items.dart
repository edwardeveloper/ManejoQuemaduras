import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
// import 'package:circular_check_box/circular_check_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/controllers/main-controller.dart';
import 'package:proyectoaula/screens/home/animations.dart';
import 'package:proyectoaula/screens/home/components/tasks/item.dart';

class HomeTasksItems extends StatefulWidget {
  @override
  _HomeTasksItemsState createState() => _HomeTasksItemsState();
}

class _HomeTasksItemsState extends State<HomeTasksItems> {
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return GetBuilder<HomeAnimationsController>(builder: (__) {
      return GetBuilder<MainController>(
        builder: (_) {
          return AnimatedSwitcher(
              duration: Duration(milliseconds: 0),
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: _.tasks.length,
                itemBuilder: (context, index) {
                  return TasksItem(
                    index: index,
                  );
                },
              ));
        },
      );
    });
  }
}
