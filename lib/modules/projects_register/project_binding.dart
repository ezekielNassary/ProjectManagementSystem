import 'package:get/get.dart';
import 'package:project_management_system/modules/projects_register/project_controller.dart';

class NewProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewProjectController>(() => NewProjectController());
  }
}
