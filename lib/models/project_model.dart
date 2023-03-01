// ignore_for_file: public_member_api_docs, sort_constructors_first

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
  final String supervisorContact;
  Projects({
    this.id,
    required this.title,
    required this.projectId,
    required this.description,
    required this.progress,
    required this.tasks,
    required this.supervisor,
    required this.location,
    required this.supervisorContact,
    this.projectMaterial,
    this.images,
    this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'projectId': projectId,
      'description': description,
      'images': images,
      'tasks': tasks,
      'progress': progress,
      'projectMaterial': projectMaterial,
      'isCompleted': isCompleted,
      'supervisor': supervisor,
      'supervisorContact': supervisorContact,
      'location': location,
    };
  }

  factory Projects.fromMap(Map<String, dynamic> json) {
    return Projects(
        id: json['id'] as int,
        title: json['title'] as String,
        projectId: json['projectId'] as String,
        description: json['description'] as String,
        images: json['images'] as List<String>,
        tasks: json['tasks'] as List<String>,
        progress: json['progress'] as double,
        projectMaterial: json['projectMaterial'] as List<String>,
        isCompleted: json['isCompleted'] as bool,
        supervisor: json['supervisor'] as String,
        location: json['location '] as String,
        supervisorContact: json['supervisorContact'] as String);
  }
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
      supervisor: 'Ezekiel Nassary',
      supervisorContact: '0788776699'),
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
      supervisor: 'Daniel N',
      supervisorContact: '0788776699'),
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
      supervisor: 'Daniel Nassary',
      supervisorContact: '0788776699'),
];

const String description =
    "project description will appear here jajsjakskasskjdashdasadshsdaj sdhasdsajdsahhjsad dsbddbdd";
