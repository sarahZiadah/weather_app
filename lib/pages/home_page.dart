import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/nothing_page.dart';
import 'package:weather_app/pages/weather_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  WeatherModel? weather;

  void updateWeather(WeatherModel newWeather) {
    setState(() {
      weather = newWeather;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return weather==null ? NothingPage(onSearch: updateWeather)
    : WeatherPage();
  }
}