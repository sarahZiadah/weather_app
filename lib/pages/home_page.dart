import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/nothing_page.dart';
import 'package:weather_app/pages/weather_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateWeather() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<WeatherProvider?>(context, listen: true)?.getWeather() ==
            null
        ? NothingPage()
        : WeatherPage();
  }
}
