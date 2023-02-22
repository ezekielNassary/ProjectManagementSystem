import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:project_management_system/modules/splash_page/splash_controller.dart';

import '../../themes/color_scheme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashcontroller = Get.find<SplashController>();
  @override
  void initState() {
    splashcontroller.initalizingApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'BARRICK',
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 20,
                  color: ThemeColor.primaryBlue),
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitThreeInOut(
              color: ThemeColor.primaryBlue,
            )
          ],
        ),
      ),
    );
  }
}
