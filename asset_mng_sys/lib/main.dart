import 'package:asset_mng_sys/screens/home.dart';
import 'package:asset_mng_sys/screens/issuereportpage.dart';
import 'package:asset_mng_sys/screens/login.dart';
import 'package:asset_mng_sys/screens/requestassetpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: "/login",
      routes: {
        "/login":(context)=>login(),
        "/home":(context)=>Home(mail: '',),
        "/requestassetpage":(context)=>RequestAssetPage(userId: 0),
        "/issuereportpage":(context)=>IssueReportPage()
      },
      debugShowCheckedModeBanner: false,
      home: login()
    );
  }
}
