import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

import 'chat_controller.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
