import 'package:get/state_manager.dart';

class Controller extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
    update();
  }
  void decrement() {
    counter--;
    update();
  }
}