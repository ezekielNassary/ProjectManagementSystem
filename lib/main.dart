import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/splash_page/splash_binding.dart';
import 'modules/splash_page/splash_page.dart';
import 'routes/app_pages.dart';
import 'themes/color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Management System',
      theme: ThemeColor().themeData,
      home: const SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
