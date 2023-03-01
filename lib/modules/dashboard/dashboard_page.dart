import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_management_system/modules/one_project/details_page.dart';
import 'package:project_management_system/themes/color_scheme.dart';
import 'package:project_management_system/utils/constants.dart';

import '../../models/project_model.dart';
import '../../routes/app_routes.dart';
import '../components/iconbutton_counter.dart';
import '../components/no_internet.dart';
import '../one_project/components/project_card.dart';
import '../components/section_title.dart';
import 'dashboard_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final dashboardcontroller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final f = DateFormat('yyyy-MM-dd');
    var datetime = f.format(DateTime.now());

    return Obx(() => dashboardcontroller.noInternet.value
        ? NoInternet(
            press: () {
              dashboardcontroller.allProjects();
            },
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[100]),
                          child: TextField(
                            onChanged: (value) => print(value),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 14),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "Search project ID",
                                prefixIcon: Icon(Icons.search)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      IconBtnWithCounter(
                        svgSrc: "assets/icons/Settings.svg",
                        press: () async {
                          print('object');
                          await dashboardcontroller.allProjects();
                        },
                        color: Colors.red,
                      ),
                      IconBtnWithCounter(
                        svgSrc: "assets/icons/Bell.svg",
                        numOfitem: 3,
                        press: () {},
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SectionTitle(
                    title: 'In Progress Projects',
                    press: () {},
                  ),
                  dashboardcontroller.isLoading.value
                      ? const loadingWidget()
                      : Row(
                          children: [
                            Flexible(
                                child: SizedBox(
                              height: 250,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      dashboardcontroller.projects.length,
                                  itemBuilder: (context, index) =>
                                      !dashboardcontroller.projects[index]
                                              ['isCompleted']
                                          ? projectsCategory(
                                              status: dashboardcontroller
                                                      .projects[index]
                                                  ['isCompleted'],
                                              dashboardcontroller:
                                                  dashboardcontroller,
                                              index: index)
                                          : Container()),
                            ))
                          ],
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  SectionTitle(
                    title: 'Completed Projects',
                    press: () {},
                  ),
                  dashboardcontroller.isLoading.value
                      ? const loadingWidget()
                      : Row(
                          children: [
                            Flexible(
                                child: SizedBox(
                              height: 250,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      dashboardcontroller.projects.length,
                                  itemBuilder: (context, index) =>
                                      dashboardcontroller.projects[index]
                                              ['isCompleted']
                                          ? projectsCategory(
                                              status:
                                                  dashboardcontroller
                                                          .projects[index]
                                                      ['isCompleted'],
                                              dashboardcontroller:
                                                  dashboardcontroller,
                                              index: index)
                                          : Container()),
                            ))
                          ],
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ));
  }
}

class loadingWidget extends StatelessWidget {
  const loadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 250,
      child: SpinKitThreeBounce(
        color: ThemeColor.primaryBlue,
        size: 20,
      ),
    ));
  }
}

class projectsCategory extends StatelessWidget {
  const projectsCategory(
      {super.key,
      required this.dashboardcontroller,
      required this.index,
      required this.status});

  final DashboardController dashboardcontroller;
  final int index;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(AppRoutes.detailspage,
            arguments: [dashboardcontroller.projects[index]['id'].toString()]);
      },
      child: Card(
        color: status
            ? ThemeColor.primaryGreen
            : ThemeColor.primaryBlue.withOpacity(0.4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageBaseUrl +
                          dashboardcontroller.projects[index]['images'][0]))),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    dashboardcontroller.projects[index]['title']
                        .toString()
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, color: ThemeColor.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${dashboardcontroller.projects[index]['progress']}%',
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
