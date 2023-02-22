import 'package:get/get.dart';
import 'package:project_management_system/modules/login_page/login_page.dart';
import 'package:project_management_system/modules/splash_page/splash_page.dart';

import '../modules/splash_page/splash_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splashpage,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.loginpage,
        page: () => const LoginPage(),
        binding: SplashBinding()),
  ];
}
