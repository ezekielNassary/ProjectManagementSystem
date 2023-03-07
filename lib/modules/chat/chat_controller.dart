import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';

import '../../apis/projects_api.dart';
import 'data.dart';

class ChatController extends GetxController {
  ProjectsApi api = ProjectsApi();
  //List<ChatMessage> chatmessages = [];
  List<ChatMessage> chatmessages = [];
  bool isLoading = true;
  @override
  void onInit() {
    getmessages();
    super.onInit();
  }

  Future getmessages() async {
    chatmessages = basicSample;
    // var response = await api.getChats();
    // if (response != null) {
    //   var jsonResponse = await jsonDecode(response);
    //   print(jsonResponse);
    //   for (var k in jsonResponse) {
    //     print(k);
    //     chatmessages.add(ChatMessage.fromJson(k));
    //   }
    //   isLoading = false;
    //   update();
    //   print(chatmessages);
    // }
  }
}
