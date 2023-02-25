import 'package:get/get.dart';

import 'signup_controller.dart';

class SiginUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SiginUpController>(() => SiginUpController());
  }
}
