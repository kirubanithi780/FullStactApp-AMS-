import 'dart:convert';
import 'package:asset_mng_sys/model/loginmodel.dart';
import 'package:http/http.dart' as http;

class Loginservice {
  Future<bool> validateUser(LoginModel log) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/admin/app/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(log.toJson()),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as bool;
      } else {
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}