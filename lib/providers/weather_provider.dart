import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weather;

  void setWeather(WeatherModel? weather) {
    _weather = weather;
    notifyListeners();
  }

  WeatherModel? getWeather() {
    return _weather;
  }
}
