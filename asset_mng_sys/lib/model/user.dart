import 'dart:convert';

class User {
  final int? UserId;
  final String name;
  final String email;
  final String password;

  User({this.UserId, required this.name, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      UserId: json['id'],
      name: json['name'],
      email: json['contact'],
      password: json['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': UserId,
      'name': name,
      'email': email,
      'password':password,
    };
  }
}