import 'package:get/get.dart';
import 'package:project_management_system/modules/SiginUp/signup_page.dart';
import 'package:project_management_system/modules/dashboard/dashboard_binding.dart';
import 'package:project_management_system/modules/dashboard/dashboard_page.dart';
import 'package:project_management_system/modules/dashboard/components/details_screen.dart';
import 'package:project_management_system/modules/home_page/home_page.dart';
import 'package:project_management_system/modules/login_page/login_page.dart';
import 'package:project_management_system/modules/splash_page/splash_page.dart';

import '../modules/SiginUp/signup_bind.dart';
import '../modules/home_page/home_binding.dart';
import '../modules/login_page/login_binding.dart';
import '../modules/manage_projects_page/manage_pro_binding.dart';
import '../modules/manage_projects_page/manage_projects_controller.dart';
import '../modules/projects_register/project_binding.dart';
import '../modules/projects_register/register_project_page.dart';
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
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.signup,
        page: () => const SignUpPage(),
        binding: SiginUpBinding()),
    GetPage(
        name: AppRoutes.homepage,
        page: () => const HomePage(),
        bindings: [HomeBinding(), ManageProjectBinding()]),
    GetPage(
        name: AppRoutes.dashboardpage,
        page: () => const DashboardPage(),
        binding: DashboardBinding()),
    GetPage(
        name: AppRoutes.newproject,
        page: () => const NewProject(),
        binding: NewProjectBinding()),
  ];
}
