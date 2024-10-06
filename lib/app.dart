import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/detailpage.dart';
import 'package:weather_app/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
    );
  }
}
