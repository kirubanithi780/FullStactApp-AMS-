import 'dart:convert';

import 'package:asset_mng_sys/model/user.dart';
import 'package:http/http.dart' as http;

class UserService{
  Future<User> addUser(User user) async{
    final response=await http.post(Uri.parse('http://localhost:8080/user/signup'),headers: {"Content-Type": "application/json"},body: json.encode(user.toJson()),);
    return User.fromJson(jsonDecode(response.body));
  }
}