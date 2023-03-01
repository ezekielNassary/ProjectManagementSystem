// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectsModel {
  ProjectsModel({required this.name, required this.supervisor, this.id});
  final String name;
  final String supervisor;
  final int? id;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'supervisor': supervisor,
      'id': id,
    };
  }

  factory ProjectsModel.fromMap(Map<String, dynamic> map) {
    return ProjectsModel(
      name: map['name'] as String,
      supervisor: map['supervisor'] as String,
      id: map['id'] as int?,
    );
  }
}
