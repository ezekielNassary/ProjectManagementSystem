import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:project_management_system/modules/components/no_internet.dart';
import 'package:project_management_system/modules/one_project/components/project_description.dart';
import 'package:project_management_system/themes/color_scheme.dart';

import '../components/loading_widget.dart';
import 'controller.dart';
import 'components/projects_images.dart';
import '../components/top_rounded_container.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final controller = Get.find<ManageOneProjectController>();
  dynamic argumentData = Get.arguments;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.getProject(argumentData[0]);
    return Scaffold(
        backgroundColor: const Color(0xFFF5F6F9),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: ThemeColor.primaryBlue),
          backgroundColor: const Color(0xFFF5F6F9),
          elevation: 0,
        ),
        body: Obx(() => controller.isLoading.value
            ? const loading_container()
            : controller.noInternet.value
                ? NoInternet(press: () {
                    controller.getProject(argumentData[0]);
                  })
                : ListView(
                    children: [
                      ProjectImages(project: controller.project),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ProjectDescription(
                              project: controller.project,
                              pressOnSeeMore: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  )));
  }
}
