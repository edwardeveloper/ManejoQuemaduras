import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proyectoaula/constants/colors.dart';
import 'package:proyectoaula/models/tasks.dart';
import 'package:proyectoaula/screens/home/animations.dart';
import 'package:proyectoaula/screens/home/components/tasks/items.dart';

class HomeTasks extends StatelessWidget {
  Duration _animationDuration = Duration(milliseconds: 500);
  bool _isDark;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _isDark = brightnessValue == Brightness.dark;
    return GetBuilder<HomeAnimationsController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(top: 25, bottom: 25),
                //   child: Image.asset('assets/images/mano.jpg', width: 350),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 30.0),
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _.tasksTitleOpacity,
                    child: Text(
                      "Este trabajo de grado pretende diseñar una aplicación dirigida a la atención del paciente quirúrgico quemado. Dentro del deber ser del instrumentador quirúrgico, se resalta la responsabilidad con el paciente y la sociedad teniendo en cuenta que la educación en el ámbito asistencial - quirúrgico debe ser aún más riguroso, y sobre todo cuando hablamos de pacientes quemados y su atención oportuna, la educación ha transcendido en distintos aspectos como es el uso de las tecnologías como herramienta de aprendizaje es así como estudiantes y futuros profesionales en salud debe ser importante estar al ritmo de las tecnologías y la educación implementando recursos digitales en los métodos de aprendizaje.",
                      style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: _isDark
                              ? kBackgroundColor.withOpacity(0.5)
                              : Colors.black.withOpacity(0.3)),
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
            SizedBox(
              height: 20,
            ),
            // HomeTasksItems()
          ],
        ),
      );
    });
  }
}
