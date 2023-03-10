import 'dart:convert';

import 'package:get/get.dart';

import '../../apis/projects_api.dart';

class DashboardController extends GetxController {
  ProjectsApi projectsApi = ProjectsApi();
  var projects = [].obs;
  var isLoading = true.obs;
  var noInternet = false.obs;
  @override
  void onInit() {
    allProjects();
    super.onInit();
  }

  Future allProjects() async {
    isLoading.value = true;
    noInternet.value = false;
    var response = await projectsApi.getAllProjects();
    if (response != null) {
      var jsonResponse = await jsonDecode(response);
      if (jsonResponse[0]['id'] == 'x') {
        noInternet.value = true;
      } else {
        projects.value = jsonResponse;
        noInternet.value = false;
      }

      isLoading.value = false;
    }
  }
}
