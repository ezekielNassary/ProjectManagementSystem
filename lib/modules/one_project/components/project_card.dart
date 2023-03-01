// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:project_management_system/routes/app_routes.dart';
// import 'package:project_management_system/themes/color_scheme.dart';

// import '../../../models/project_model.dart';
// import 'details_screen.dart';

// class ProjectsCard extends StatelessWidget {
//   const ProjectsCard({
//     Key? key,
//     this.width = 140,
//     this.aspectRetio = 1.02,
//     required this.projects,
//   }) : super(key: key);

//   final double width, aspectRetio;
//   final Projects projects;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 20),
//       child: SizedBox(
//         width: width,
//         child: GestureDetector(
//           onTap: () {
//             Get.to(DetailsScreen(
//               projects: projects,
//             ));
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             decoration: BoxDecoration(
//               color: ThemeColor.primaryBlue.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AspectRatio(
//                   aspectRatio: 1.02,
//                   child: Container(
//                     padding: EdgeInsets.all(5),
//                     child: Hero(
//                       tag: projects.projectId.toString().toUpperCase(),
//                       child: Image.asset(projects.images![0]),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   projects.title,
//                   style: TextStyle(color: Colors.black),
//                   maxLines: 2,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "${projects.progress}%",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: projects.progress > 45.0
//                             ? Colors.green
//                             : Color.fromARGB(255, 255, 89, 0),
//                       ),
//                     ),
//                     InkWell(
//                       borderRadius: BorderRadius.circular(50),
//                       onTap: () {},
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         height: 28,
//                         width: 28,
//                         decoration: BoxDecoration(
//                           color: ThemeColor.primaryBlue.withOpacity(0.2),
//                           shape: BoxShape.circle,
//                         ),
//                         child: projects.isCompleted!
//                             ? SvgPicture.asset(
//                                 "assets/icons/Success.svg",
//                                 color: ThemeColor.primaryGreen,
//                               )
//                             : SvgPicture.asset(
//                                 "assets/icons/Phone.svg",
//                                 color: ThemeColor.primaryDarkGrey,
//                               ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
