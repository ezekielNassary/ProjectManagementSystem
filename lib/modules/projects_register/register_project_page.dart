import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_management_system/themes/color_scheme.dart';

import '../../utils/constants.dart';
import '../components/default_button.dart';
import '../components/iconbutton_counter.dart';

class NewProject extends StatefulWidget {
  const NewProject({super.key});

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  List<String> tasks = [];
  String task = "";
  Future addtoTask() async {
    setState(() {
      // tasks = tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: AppBar(
        backgroundColor: ThemeColor.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ThemeColor.primaryBlue),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Form(
            child: Column(
              children: [
                projectTitle(),
                const SizedBox(
                  height: 30,
                ),
                projectSupervisor(),
                const SizedBox(
                  height: 30,
                ),
                projectId(),
                const SizedBox(
                  height: 30,
                ),
                projectDescription(),
                const SizedBox(
                  height: 30,
                ),
                projectLocation(),
                const SizedBox(
                  height: 30,
                ),
                projectTasks(),
                const SizedBox(
                  height: 30,
                ),
                projectMaterials(),
                const SizedBox(
                  height: 30,
                ),
                DefaultButton(
                  text: "Submit",
                  press: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField projectTitle() {
    return TextFormField(
      onSaved: (newValue) => null,
      onChanged: (value) {
        if (value.isNotEmpty) {}
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter project name";
        }
      },
      decoration: InputDecoration(
        labelText: "Project Title",
        hintText: "Enter project title",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.abc),
        border: outlineInputBorder(),
      ),
    );
  }

  TextFormField projectId() {
    return TextFormField(
      onSaved: (newValue) => null,
      onChanged: (value) {
        if (value.isNotEmpty) {}
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter project ID";
        }
      },
      decoration: InputDecoration(
        enabled: false,
        labelText: "Project ID",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.lock),
        border: outlineInputBorder(),
      ),
    );
  }

  TextFormField projectDescription() {
    return TextFormField(
      maxLines: 5,
      onSaved: (newValue) => null,
      onChanged: (value) {
        if (value.isNotEmpty) {}
      },
      decoration: InputDecoration(
        labelText: "Project Description",
        hintText: "Enter project descriptions",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: outlineInputBorder(),
      ),
    );
  }

  TextFormField projectLocation() {
    return TextFormField(
      onSaved: (newValue) => null,
      onChanged: (value) {
        if (value.isNotEmpty) {}
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter project location";
        }
      },
      decoration: InputDecoration(
        labelText: " Location",
        hintText: "Enter location",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.location_pin),
        border: outlineInputBorder(),
      ),
    );
  }

  TextFormField projectSupervisor() {
    return TextFormField(
      onSaved: (newValue) => null,
      onChanged: (value) {
        if (value.isNotEmpty) {}
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter project supervisor name";
        }
      },
      decoration: InputDecoration(
        labelText: " Supervisor Name",
        hintText: "Enter supervisor name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.person),
        border: outlineInputBorder(),
      ),
    );
  }

  Widget projectTasks() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: TextFormField(
              maxLines: 2,
              onSaved: (newValue) => null,
              onChanged: (value) {
                if (value.isNotEmpty) {}
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a task name";
                }
              },
              decoration: const InputDecoration(
                labelText: "Task name",
                hintText: "Enter task name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
    );
  }

  Widget projectMaterials() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: TextFormField(
              maxLines: 2,
              onSaved: (newValue) => null,
              onChanged: (value) {
                if (value.isNotEmpty) {}
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a material";
                }
              },
              decoration: const InputDecoration(
                labelText: "Material name",
                hintText: "Enter material name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
