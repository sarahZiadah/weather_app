import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';

void main() {
  runApp( WeatherApp());
}

class WeatherApp extends StatelessWidget {
   WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

