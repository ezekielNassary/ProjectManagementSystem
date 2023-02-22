import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  Future initalizingApp() async {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Get.toNamed(AppRoutes.loginpage);
    });
  }
}
