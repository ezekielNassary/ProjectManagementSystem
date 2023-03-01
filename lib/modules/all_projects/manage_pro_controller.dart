import 'dart:convert';

import 'package:get/get.dart';

import '../../apis/projects_api.dart';

class ManageProjectController extends GetxController {
  ProjectsApi projectsApi = ProjectsApi();
  var projects = [].obs;
  var isLoading = true.obs;
  var noInternet = false.obs;
  @override
  void onInit() {
    fetchProjects();
    super.onInit();
  }

  Future fetchProjects() async {
    noInternet.value = false;
    isLoading.value = true;
    var response = await projectsApi.getAllProjects();
    if (response != null) {
      var jsonResponse = jsonDecode(response);
      if (jsonResponse[0]['id'] == 'x') {
        noInternet.value = true;
      } else {
        noInternet.value = false;
        projects.value = jsonResponse;
      }
      isLoading.value = false;
    }
  }
}
