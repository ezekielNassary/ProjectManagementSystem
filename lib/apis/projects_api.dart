import 'dart:convert';
import 'package:dio/dio.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class ProjectsApi {
  final dio = Dio();
  var internetError = [
    {'id': 'x'}
  ];

  Future<dynamic> getAllProjects() async {
    var url = Uri.parse(apiBaseUrl);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (error) {
      return jsonEncode(internetError);
    }
  }

  Future<dynamic> getOneProject(String id) async {
    var url = Uri.parse('$apiBaseUrl?id=$id');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (error) {
      return jsonEncode(internetError);
    }
  }

  Future<dynamic> getAllMembers() async {
    var url = Uri.parse('${apiBaseUrl}team.php');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (error) {
      return jsonEncode(internetError);
    }
  }
}
