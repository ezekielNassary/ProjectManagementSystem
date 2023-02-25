import 'package:flutter/material.dart';
import 'package:project_management_system/themes/color_scheme.dart';
import '../../../models/project_model.dart';
import '../../../utils/constants.dart';

class ProjectImages extends StatefulWidget {
  const ProjectImages({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Projects project;

  @override
  _ProjectImagesState createState() => _ProjectImagesState();
}

class _ProjectImagesState extends State<ProjectImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.project.id.toString(),
              child: Image.asset(widget.project.images![selectedImage]),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.project.images!.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: ThemeColor.primaryBlue
                  .withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.project.images![index]),
      ),
    );
  }
}
