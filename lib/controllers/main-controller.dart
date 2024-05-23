import 'package:get/get.dart';

class MainController extends GetxController {
  bool isFirstEnter = false;

  List tasks = [];

  updateMainStete({bool newFirstEnterStatus}) {
    isFirstEnter =
        newFirstEnterStatus != null ? newFirstEnterStatus : isFirstEnter;
    update();
  }
}
