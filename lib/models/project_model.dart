// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Projects {
  final int? id;
  final String title, projectId, description;
  final List<String>? images;
  final List<String> tasks;
  final double progress;
  final List<String>? projectMaterial;
  final bool? isCompleted;
  final String supervisor;
  final String location;
  Projects({
    this.id,
    required this.title,
    required this.projectId,
    required this.description,
    required this.progress,
    required this.tasks,
    required this.supervisor,
    required this.location,
    this.projectMaterial,
    this.images,
    this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tile': title,
      'projectId': projectId,
      'description': description,
      'images': images,
      'tasks': tasks,
      'progress': progress,
      'projectMaterial': projectMaterial,
      'isCompleted': isCompleted,
      'supervisor': supervisor,
      'location': location,
    };
  }

  factory Projects.fromMap(Map<String, dynamic> json) {
    return Projects(
      title: json['title'],
      projectId: json['projectId'],
      description: json['description'],
      progress: json['progress'],
      tasks: json['tasks'],
      supervisor: json['supervisor'],
      location: json['location '],
      images: json['images'],
      projectMaterial: json['projectMaterial'],
      isCompleted: json['isCompleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Projects.fromJson(String source) =>
      Projects.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<Projects> demoProjects = [
  Projects(
      id: 1,
      projectId: "NDMFMDNFDNDFKKKDF",
      images: [
        "assets/images/project1.png",
        "assets/images/project2.png",
        "assets/images/project3.png",
        "assets/images/project4.png",
      ],
      title: "Project 00001",
      location: "Buriyankulu",
      progress: 64.99,
      description: description,
      isCompleted: false,
      tasks: ["Build blocks", "Trench cleaning"],
      projectMaterial: [],
      supervisor: 'Ezekiel Nassary'),
  Projects(
      id: 2,
      projectId: "23HHSDSKKDS-DSDDSD",
      images: [
        "assets/images/project1.png",
        "assets/images/project2.png",
      ],
      title: "Project 00002",
      location: "Tabora",
      progress: 23.00,
      description: 'Our main project this year',
      isCompleted: false,
      tasks: ["Build HOUSE", "Trench cleaning"],
      projectMaterial: [],
      supervisor: 'Daniel N'),
  Projects(
      id: 3,
      projectId: "734DJFJDMMFFMMDMF",
      images: [
        "assets/images/project3.png",
        "assets/images/project4.png",
      ],
      title: "Project 00003",
      location: "Kahama",
      progress: 100,
      description: description,
      isCompleted: true,
      tasks: [
        "Build blocks and making clear routes for people to pass",
        "Trench cleaning"
      ],
      projectMaterial: ["Axe", "Hoe", "Panga"],
      supervisor: 'Daniel Nassary'),
];

const String description =
    "project description will appear here jajsjakskasskjdashdasadshsdaj sdhasdsajdsahhjsad dsbddbdd";
