import 'package:flutter/material.dart';
import 'package:project_management_system/modules/dashboard/components/project_description.dart';

import '../../../models/project_model.dart';
import '../../components/custom_appbar.dart';
import '../../components/default_button.dart';
import 'projects_images.dart';
import '../../components/top_rounded_container.dart';

class DetailsScreen extends StatelessWidget {
  final Projects projects;
  DetailsScreen({
    required this.projects,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: projects.progress),
      ),
      body: ListView(
        children: [
          ProjectImages(project: projects),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProjectDescription(
                  project: projects,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      //  ColorDots(project: projects),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 40,
                            top: 15,
                          ),
                          child: DefaultButton(
                            text: "Call Engineer",
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
