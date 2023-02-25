import 'package:get/get.dart';
import 'package:project_management_system/modules/login_page/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
