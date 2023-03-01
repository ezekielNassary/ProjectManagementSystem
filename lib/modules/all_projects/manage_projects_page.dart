import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:project_management_system/modules/components/loading_widget.dart';
import 'package:project_management_system/modules/components/no_internet.dart';
import 'package:project_management_system/themes/color_scheme.dart';
import 'package:project_management_system/utils/constants.dart';
import '../../routes/app_routes.dart';
import '../components/iconbutton_counter.dart';
import '../one_project/details_page.dart';
import 'manage_pro_controller.dart';
import 'package:http/http.dart' as http;

class ManageProjects extends StatefulWidget {
  const ManageProjects({super.key});

  @override
  State<ManageProjects> createState() => _ManageProjectsState();
}

class _ManageProjectsState extends State<ManageProjects> {
  final managecontroller = Get.find<ManageProjectController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: Obx(() => managecontroller.isLoading.value
          ? const loading_container()
          : managecontroller.noInternet.value
              ? NoInternet(press: () {
                  managecontroller.fetchProjects();
                })
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
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
                              width: 30,
                            ),
                            IconBtnWithCounter(
                              svgSrc: "assets/icons/Plus Icon.svg",
                              press: () {
                                Get.toNamed(AppRoutes.newproject);
                              },
                              color: ThemeColor.primaryBlue,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(
                                managecontroller.projects.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      await Get.to(const DetailsScreen(),
                                          arguments: [
                                            managecontroller.projects[index]
                                                    ['id']
                                                .toString()
                                          ]);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                          width: double.infinity,
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                              color: ThemeColor.primaryBlue
                                                  .withOpacity(0.1)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: ThemeColor
                                                            .primaryBlue),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          imageBaseUrl +
                                                              managecontroller
                                                                          .projects[
                                                                      index][
                                                                  'images']![0],
                                                        ),
                                                        fit: BoxFit.fill)),
                                                alignment: Alignment.center,
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    managecontroller
                                                        .projects[index]
                                                            ['title']
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                            fontSize: 14,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    managecontroller
                                                            .projects[index]
                                                        ['location'],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Supervisor: ${managecontroller.projects[index]['supervisor']}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Progress: ${managecontroller.projects[index]['progress']} %",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  );
                                  // here by default width and height is 0
                                },
                              )
                            ])
                      ],
                    ),
                  ),
                )),
    );
  }
}
