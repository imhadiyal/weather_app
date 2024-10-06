import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:weather_app/pages/weather_screen.dart';
import 'package:weather_app/routes.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherInfo(),
    );
  }
}
