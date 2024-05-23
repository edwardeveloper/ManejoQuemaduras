import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/constants/routes.dart';
import 'package:proyectoaula/constants/task-colors.dart';
import 'package:proyectoaula/constants/types.dart';
import 'package:proyectoaula/models/set-system-overlay-style.dart';
import 'package:proyectoaula/screens/new-task/animations.dart';
import 'package:proyectoaula/screens/new-task/components/button.dart';
import 'package:proyectoaula/screens/new-task/components/close.dart';
import 'package:proyectoaula/controllers/new-task/newtask-controller.dart';
import 'package:proyectoaula/screens/new-task/components/setup.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskController newTaskController = Get.put(NewTaskController());
  NewTaskAnimationsController newTaskAnimationsController = Get.put(
    NewTaskAnimationsController(),
  );
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
    startAnimations();
    return WillPopScope(
      onWillPop: () async {
        return await closePage(context);
      },
      child: Scaffold(
        backgroundColor: _isDark ? kDarkBackgroundColor2 : Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [NewTaskCloseButton(), NewTaskSetup(), NewTaskButton()],
          ),
        ),
      ),
    );
  }

  Future closePage(BuildContext context) async {
    await Get.find<NewTaskController>()
        .updateNewTask(newColor: color1, newColorNum: 0, newText: "");
    await Get.find<NewTaskAnimationsController>().updateAnimations(
        newAddButtonOpacity: 0,
        newBox1Opacity: 0,
        newBox2Opacity: 0,
        newCloseButtonOpacity: 0,
        newTextFieldOpacity: 0);
    Navigator.pushNamed(context, home_route);
    return null;
  }
}
