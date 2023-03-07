import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_system/modules/chat/chat_controller.dart';

import '../data.dart';

class Basic extends StatefulWidget {
  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  final controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.chatmessages[0].user.firstName.toString()),
        actions: [
          IconButton(
              onPressed: () {
                controller.getmessages();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: DashChat(
        currentUser: controller.chatmessages[0].user,
        onSend: (ChatMessage m) {
          setState(() {
            controller.chatmessages.insert(0, m);
          });
        },
        messages: controller.chatmessages,
        messageListOptions: MessageListOptions(
          onLoadEarlier: () async {
            await Future.delayed(const Duration(seconds: 3));
          },
        ),
      ),
    );
  }
}
