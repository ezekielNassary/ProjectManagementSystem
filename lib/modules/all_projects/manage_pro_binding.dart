import 'package:get/get.dart';
import 'package:project_management_system/modules/all_projects/manage_pro_controller.dart';

import '../one_project/controller.dart';

class ManageProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageProjectController>(() => ManageProjectController());
  }
}
