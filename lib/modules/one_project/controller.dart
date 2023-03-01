import 'dart:convert';

import 'package:get/get.dart';

import '../../apis/projects_api.dart';

class ManageOneProjectController extends GetxController {
  ProjectsApi projectsApi = ProjectsApi();
  var isLoading = true.obs;
  var noInternet = false.obs;
  var project = [].obs;
  Future getProject(String id) async {
    isLoading.value = true;
    var response = await projectsApi.getOneProject(id);
    if (response != null) {
      var jsonResponse = jsonDecode(response);
      if (jsonResponse[0]['id'] == 'x') {
        noInternet.value = true;
      } else {
        noInternet.value = false;
        project.value = jsonResponse;
      }
      isLoading.value = false;
    }
  }
}
