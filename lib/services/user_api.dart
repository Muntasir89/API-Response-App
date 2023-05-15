import 'dart:convert';
import 'package:api_response/model/user_loacation.dart';
import 'package:api_response/model/user_name.dart';
import 'package:api_response/model/users.dart';
import 'package:http/http.dart' as http;

import '../model/user_dob.dart';
class UserApi{
    static Future<List<User>> fetchUsers() async {
      print('fetchUsers called');
      final url = 'https://randomuser.me/api/?results=100';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final results = json['results'] as List<dynamic>;
      final users = results.map((e){
          return User.fromMap(e);
      }).toList();
      print('fetchUsers completed');
      return users;
    }
}