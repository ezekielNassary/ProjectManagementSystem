import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_system/modules/chat/chat_controller.dart';
import 'package:project_management_system/modules/chat/samples/avatar.dart';
import 'package:project_management_system/modules/chat/samples/basic.dart';
import 'package:project_management_system/modules/chat/samples/media.dart';
import 'package:project_management_system/modules/chat/samples/mention.dart';
import 'package:project_management_system/modules/chat/samples/quick_replies_sample.dart';
import 'package:project_management_system/modules/chat/samples/send_on_enter.dart';
import 'package:project_management_system/modules/chat/samples/typing_users_sample.dart';
import 'package:project_management_system/themes/color_scheme.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

import 'data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void push(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ThemeColor.primaryBlue),
        elevation: 0,
        backgroundColor: ThemeColor.white,
        title: Text('Choose chat'),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => push(Basic()),
                child: const Text('Basic'),
              ),
              ElevatedButton(
                onPressed: () => push(Media()),
                child: const Text('Chat media'),
              ),
              ElevatedButton(
                onPressed: () => push(AvatarSample()),
                child: const Text('All user possibilities'),
              ),
              ElevatedButton(
                onPressed: () => push(QuickRepliesSample()),
                child: const Text('Quick replies'),
              ),
              ElevatedButton(
                onPressed: () => push(TypingUsersSample()),
                child: const Text('Typing users'),
              ),
              ElevatedButton(
                onPressed: () => push(SendOnEnter()),
                child: const Text('Send on enter'),
              ),
              ElevatedButton(
                onPressed: () => push(MentionSample()),
                child: const Text('Mention'),
              ),
            ],
          )),
    );
  }
  //  List<ChatMessage> messages = <ChatMessage>[
  //   ChatMessage(
  //     text: 'Hey!',
  //     user: user,
  //     createdAt: DateTime.now(),
  //   ),
  // ];
// DashChat(
//           currentUser: user,
//           messageOptions: const MessageOptions(
//               showTime: true,
//               showOtherUsersAvatar: true,
//               showOtherUsersName: true),
//           onSend: (ChatMessage m) {
//             setState(() {
//               messages.insert(0, m);
//             });
//           },
//           messages: messages,
//         ),

//ListView(
  //   children: <Widget>[
  //     getSenderView(
  //         ChatBubbleClipper1(type: BubbleType.sendBubble), context),
  //     getReceiverView(
  //         ChatBubbleClipper1(type: BubbleType.receiverBubble), context),
  //     const SizedBox(
  //       height: 30,
  //     ),
  //   ],
  // )
  getTitleText(String title) => Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      );
  getSenderView(CustomClipper clipper, BuildContext context) => ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.blue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ezekiel",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '12 Jan 2023, 12:33:45 ',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: ThemeColor.white),
                ),
              )
            ],
          ),
        ),
      );

  getReceiverView(CustomClipper clipper, BuildContext context) => ChatBubble(
        clipper: clipper,
        backGroundColor: Color(0xffE7E7ED),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Ezekiel",
                style: TextStyle(
                    color: ThemeColor.primaryBlack,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(color: ThemeColor.primaryBlack),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '12 Jan 2023, 12:33:45 ',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
        ),
      );
}
