import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_management_system/themes/color_scheme.dart';

import '../../models/project_model.dart';
import '../components/iconbutton_counter.dart';
import 'components/project_card.dart';
import '../components/section_title.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final f = DateFormat('yyyy-MM-dd');
    var datetime = f.format(DateTime.now());
    return SingleChildScrollView(
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
                  press: () {},
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    demoProjects.length,
                    (index) {
                      if (!demoProjects[index].isCompleted!) {
                        return ProjectsCard(projects: demoProjects[index]);
                      }
                      return const SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SectionTitle(
              title: 'Completed Projects',
              press: () {},
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    demoProjects.length,
                    (index) {
                      if (demoProjects[index].isCompleted!) {
                        return ProjectsCard(projects: demoProjects[index]);
                      }
                      return const SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SectionTitle(
              title: 'Cancelled Projects',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
