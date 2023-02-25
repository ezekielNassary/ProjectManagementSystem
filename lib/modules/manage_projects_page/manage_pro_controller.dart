import 'package:get/get.dart';

import '../../apis/projects_api.dart';
import '../../models/project_model.dart';

class ManageProjectController extends GetxController {
  ProjectsApi projectsApi = ProjectsApi();
  List<Projects> projects = [];
  var length = 0.obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchProjects();
    super.onInit();
  }

  void fetchProjects() async {
    var response = await projectsApi.getAllProjects();
    if (response != null) {
      print(response['result']);
      response['result'].forEach((data) {
        projects.add(Projects.fromMap(data));
      });
      length.value = projects.length;
      isLoading.value = false;
    }
  }
}
