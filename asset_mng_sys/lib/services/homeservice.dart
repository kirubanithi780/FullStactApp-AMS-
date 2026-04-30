import 'dart:convert';
import 'package:asset_mng_sys/model/issuereport.dart';
import 'package:asset_mng_sys/model/loginmodel.dart';
import 'package:asset_mng_sys/model/requestasset.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homeservice {
  static final Homeservice _instance = Homeservice._internal();

  factory Homeservice() {
    return _instance;
  }


  Homeservice._internal();

  
  String? userName;
  int? userId;

  Future<String> fetchUser(String email) async {
    try {
      final String url = 'http://localhost:8080/user/email/$email';
      
      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.body);
        String fetchedName = userData['userName'] ?? "Unknown User";
        this.userId=userData['userId'];
        this.userName = fetchedName;
        print("Fetched id: $userId");
        return fetchedName;
      } else {
        return "User not found";
      }
    } catch (e) {
      print("Error in fetchUser: $e");
      return "Error occurred";
    }
  }
  Future<dynamic> getAllProductsById(int id) async{
    try{
     final response= await http.get(Uri.parse("http://localhost:8080/assign/get/$id"));
     if(response.statusCode==200){
      return response.body;
     }
     
  }
  catch(e){
    print(e);
  }
  }
  Future<dynamic> requestAssets(Map<String,dynamic> req) async{
    final response=await http.post(Uri.parse("http://localhost:8080/request/asset"),headers: {"Content-Type": "application/json"},body: json.encode(req),);
    if(response.body=="success"){
      return true;
    }
    else{
      return false;
    }
  }
  Future<dynamic> reportIssue(Issuereport req) async{
    final response=await http.post(Uri.parse("http://localhost:8080/email/report"),headers: {"Content-Type": "application/json"},body: json.encode(req),);
    if(response.body=="reported"){
      print(response.body);
      return true;
    }
    else{
      return false;
    }
  }
}