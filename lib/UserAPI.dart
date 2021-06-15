import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class UserData {
  Map<String, dynamic> userData;

  UserData({this.userData});

  factory UserData.createData(Map<String, dynamic> object) {
    return UserData(userData: object);
  }

  static Future<List<Map<String, dynamic>>> connectToAPI() async {
    String urlAPI = 'jsonplaceholder.typicode.com';
    var apiResult = await http.get(Uri.https(urlAPI, '/users'));
    var jsonObject = json.decode(apiResult.body);
    var data = jsonObject;
    List<Map<String, dynamic>> listData = [];
    for (int i = 0; i < data.length; i++) {
      listData.add(data[i]);
    }
    return listData;
  }

  static Future<List<Map<String, dynamic>>> connectToAPIDetails(
      String dest) async {
    String urlAPI = 'jsonplaceholder.typicode.com';
    var destination = '/users' + dest;
    var apiResult = await http.get(Uri.https(urlAPI, destination));
    var jsonObject = json.decode(apiResult.body);
    var data = jsonObject;
    List<Map<String, dynamic>> listData = [];
    for (int i = 0; i < data.length; i++) {
      listData.add(data[i]);
    }
    return listData;
  }
}
