import 'package:get/get.dart';
import 'package:project_management_system/modules/manage_projects_page/manage_pro_controller.dart';

class ManageProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageProjectController>(() => ManageProjectController());
  }
}
