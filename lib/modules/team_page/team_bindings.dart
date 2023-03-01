import 'package:get/get.dart';
import 'package:project_management_system/modules/team_page/team_controller.dart';

class TeamBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamController>(() => TeamController());
  }
}
