// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:project_management_system/modules/components/iconbutton_counter.dart';
import 'package:project_management_system/modules/components/loading_widget.dart';
import 'package:project_management_system/modules/components/no_internet.dart';
import 'package:project_management_system/modules/team_page/team_controller.dart';
import 'package:project_management_system/themes/color_scheme.dart';
import 'package:project_management_system/utils/constants.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final controller = Get.find<TeamController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const loading_container()
          : controller.noInternet.value
              ? NoInternet(press: () {
                  controller.getAllMembers();
                })
              : Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Team Members',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Flexible(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.members.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Column(
                                  children: [
                                    ListTile(
                                      leading: CircularProfileAvatar(
                                        '',
                                        child: Image(
                                            image: NetworkImage(imageBaseUrl +
                                                controller.members[index]
                                                    ['image'])),
                                        borderColor: ThemeColor.primaryGrey,
                                        borderWidth: 3,
                                        elevation: 5,
                                        radius: 30,
                                      ),
                                      title: Container(
                                        child: Text(
                                          controller.members[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      subtitle: Container(
                                        child: Text(
                                          controller.members[index]['phone'],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      trailing: IconBtnWithCounter(
                                          svgSrc:
                                              "assets/icons/Chat bubble Icon.svg",
                                          press: () {},
                                          numOfitem: 3,
                                          color: ThemeColor.primaryBlue),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    )
                                  ],
                                )),
                      ),
                    ],
                  ),
                ),
    );
  }
}
