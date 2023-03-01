import 'dart:convert';

import 'package:get/get.dart';

import '../../apis/projects_api.dart';

class TeamController extends GetxController {
  ProjectsApi projectsApi = ProjectsApi();
  var members = [].obs;
  var isLoading = true.obs;
  var noInternet = false.obs;

  @override
  void onInit() {
    getAllMembers();
    super.onInit();
  }

  Future getAllMembers() async {
    noInternet.value = false;
    isLoading.value = true;
    var response = await projectsApi.getAllMembers();
    if (response != null) {
      var jsonResponse = await jsonDecode(response);
      if (jsonResponse[0]['id'] == 'x') {
        noInternet.value = true;
      } else {
        members.value = jsonResponse;
        noInternet.value = false;
      }

      isLoading.value = false;
    }
  }
}
