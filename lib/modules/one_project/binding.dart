import 'package:get/get.dart';

import 'controller.dart';

class OneProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageOneProjectController>(() => ManageOneProjectController());
  }
}
