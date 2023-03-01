// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_management_system/themes/color_scheme.dart';

import '../../../models/project_model.dart';

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    Key? key,
    required this.project,
    this.pressOnSeeMore,
  }) : super(key: key);

  final List<dynamic> project;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Project Title: ",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  project[0]['title'],
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              project[0]['isCompleted']!
                  ? Text(
                      "Completed",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.italic,
                          color: ThemeColor.primaryGrey),
                    )
                  : Text(
                      "InProgress",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.italic,
                          color: ThemeColor.primaryGrey),
                    )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Progress',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              Expanded(child: Container()),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: 100,
                  decoration: BoxDecoration(
                    color: project[0]['isCompleted']!
                        ? Color.fromARGB(255, 98, 190, 7)
                        : Color.fromARGB(255, 64, 92, 176),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    '${project[0]['progress'].toStringAsFixed(1)} %',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColor.white),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Tasks asigned ",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                      project[0]['tasks'].length,
                      (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 1}. ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Text(
                                  project[0]['tasks'][index],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                            ],
                          )),
                ]),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Project Descriptions",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 64,
            ),
            child: Text(
              project[0]['description'],
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Project Materials",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: project[0]['projectMaterial']!.isEmpty
                ? Container(
                    height: 30,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'No material given',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        ...List.generate(
                            project[0]['projectMaterial']!.length,
                            (index) => Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${index + 1}. ',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        project[0]['projectMaterial']![index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                  ],
                                )),
                      ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Supervisor: ${project[0]['supervisor']}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 220,
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  const Text(
                    "See More Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: ThemeColor.primaryBlue,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
