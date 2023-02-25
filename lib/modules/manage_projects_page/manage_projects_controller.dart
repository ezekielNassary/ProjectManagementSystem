import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_system/themes/color_scheme.dart';
import '../../models/project_model.dart';
import '../../routes/app_routes.dart';
import '../components/iconbutton_counter.dart';
import '../components/section_title.dart';
import '../dashboard/components/details_screen.dart';
import 'manage_pro_controller.dart';

class ManageProjects extends StatefulWidget {
  const ManageProjects({super.key});

  @override
  State<ManageProjects> createState() => _ManageProjectsState();
}

class _ManageProjectsState extends State<ManageProjects> {
  final managecontroller = Get.find<ManageProjectController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => managecontroller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  SectionTitle(
                    title: "Registered Projects",
                    press: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // managecontroller.length.value == 0
                  //     ? Container(
                  //         child: Text('No project registered so far'),
                  //       )
                  //     : Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //            ...List.generate(
                  //               managecontroller.projects.length,
                  //               (index) {
                  //                 return GestureDetector(
                  //                   onTap: () async {
                  //                     await Get.to(DetailsScreen(
                  //                       projects: managecontroller.projects[index],
                  //                     ));
                  //                   },
                  //                   child: Column(
                  //                     children: [
                  //                       Container(
                  //                         padding: const EdgeInsets.symmetric(
                  //                             vertical: 20, horizontal: 20),
                  //                         width: double.infinity,
                  //                         alignment: Alignment.centerLeft,
                  //                         decoration: BoxDecoration(
                  //                             color: ThemeColor.primaryBlue
                  //                                 .withOpacity(0.1)),
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.start,
                  //                           crossAxisAlignment:
                  //                               CrossAxisAlignment.start,
                  //                           children: [
                  //                             Container(
                  //                               width: 60,
                  //                               height: 60,
                  //                               padding: const EdgeInsets.all(5),
                  //                               decoration: BoxDecoration(
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(10),
                  //                                   border: Border.all(
                  //                                       color:
                  //                                           ThemeColor.primaryBlue),
                  //                                   image: DecorationImage(
                  //                                       image: AssetImage(
                  //                                         managecontroller
                  //                                             .projects[index]
                  //                                             .images![0],
                  //                                       ),
                  //                                       fit: BoxFit.fill)),
                  //                               alignment: Alignment.center,
                  //                             ),
                  //                             const SizedBox(
                  //                               width: 6,
                  //                             ),
                  //                             Column(
                  //                               mainAxisAlignment:
                  //                                   MainAxisAlignment.start,
                  //                               crossAxisAlignment:
                  //                                   CrossAxisAlignment.start,
                  //                               children: [
                  //                                 Text(
                  //                                   managecontroller
                  //                                       .projects[index].title,
                  //                                   style: Theme.of(context)
                  //                                       .textTheme
                  //                                       .labelSmall!
                  //                                       .copyWith(
                  //                                           overflow: TextOverflow
                  //                                               .ellipsis),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 5,
                  //                                 ),
                  //                                 Text(
                  //                                   managecontroller
                  //                                       .projects[index].location,
                  //                                   style: Theme.of(context)
                  //                                       .textTheme
                  //                                       .labelSmall!
                  //                                       .copyWith(
                  //                                           overflow: TextOverflow
                  //                                               .ellipsis),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 5,
                  //                                 ),
                  //                                 Text(
                  //                                   "Supervisor: ${managecontroller.projects[index].supervisor}",
                  //                                   style: Theme.of(context)
                  //                                       .textTheme
                  //                                       .labelSmall!
                  //                                       .copyWith(
                  //                                           overflow: TextOverflow
                  //                                               .ellipsis),
                  //                                 ),
                  //                                 const SizedBox(
                  //                                   height: 5,
                  //                                 ),
                  //                                 Text(
                  //                                   "Progress: ${managecontroller.projects[index].progress} %",
                  //                                   style: Theme.of(context)
                  //                                       .textTheme
                  //                                       .labelSmall!
                  //                                       .copyWith(
                  //                                           overflow: TextOverflow
                  //                                               .ellipsis),
                  //                                 ),
                  //                               ],
                  //                             )
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       const SizedBox(
                  //                         height: 30,
                  //                       )
                  //                     ],
                  //                   ),
                  //                 );
                  //                 // here by default width and height is 0
                  //               },
                  //             )
                  //           ])
                ],
              ),
            ),
          ));
  }
}
