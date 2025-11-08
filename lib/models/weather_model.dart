import 'dart:ui';

import 'package:weather_app/models/theme_model.dart';

class WeatherModel {
  String name;
  String country;
  String condition;
  double avgtemp;
  double maxtemp;
  double minTemp;
  double pressure;
  int humidity;
  String sunrise;
  double feelslike;

  WeatherModel({
    required this.name,
    required this.country,
    required this.avgtemp,
    required this.maxtemp,
    required this.minTemp,
    required this.pressure,
    required this.humidity,
    required this.sunrise,
    required this.feelslike,
    required this.condition,
  });

  factory WeatherModel.fromJson(dynamic data) {
    try {
  var jsonData = data['forecast']['forecastday'][0];
  
  return WeatherModel(
    name: data['location']['name'],
    country: data['location']['country'],
    condition: data['current']['condition']['text'],
    avgtemp: jsonData['day']['avgtemp_c'],
    minTemp: jsonData['day']['mintemp_c'],
    maxtemp: jsonData['day']['maxtemp_c'],
    pressure: jsonData['hour'][0]['pressure_mb'],
    humidity: jsonData['hour'][0]['humidity'],
    sunrise: data['forecast']['forecastday'][1]['astro']['sunrise'],
    feelslike: data['current']['feelslike_c'],
  );
}  catch (e) {
  return WeatherModel(
    name: "Unknown",
    country: "Unknown",
    condition: "Unknown",
    avgtemp: 0,
    minTemp: 0,
    maxtemp: 0,
    pressure: 0,
    humidity: 0,
    sunrise: "Unknown",
    feelslike: 0,
  );
}
  }

  ThemeModel? getTheme() {
    if (condition == "Sunny" || condition == "Clear") {
      return ThemeModel(
        image: "assets/images/icons8-sun-100.png",
        color: Color(0xff4C9BFF),
      );
    } else if (condition == "Partly cloudy") {
      return ThemeModel(
        image: "assets/images/icons8-partly-cloudy-day-100.png",
        color: Color(0xff5D7CA4),
      );
    } else if (condition == "Mist" ||
        condition == "Overcast" ||
        condition == "Cloudy") {
      return ThemeModel(
        image: "assets/images/icons8-clouds-100.png",
        color: Color(0xff5C6F88),
      );
    } else if (condition == "Fog" || condition == "Freezing fog") {
      return ThemeModel(
        image: "assets/images/icons8-haze-100.png",
        color: Color(0xff347192),
      );
    } else if (condition == "Patchy rain possible" ||
        condition == "Patchy light rain" ||
        condition == "Light rain" ||
        condition == "Patchy freezing drizzle possible" ||
        condition == "Light rain shower") {
      return ThemeModel(
        image: "assets/images/icons8-rain-100.png",
        color: Color(0xff477E9D),
      );
    } else if (condition == "Moderate rain at times" ||
        condition == "Moderate rain" ||
        condition == "Heavy rain at times" ||
        condition == "Heavy rain" ||
        condition == "Light freezing rain" ||
        condition == "Moderate or heavy freezing rain" ||
        condition == "Torrential rain shower" ||
        condition == "Moderate or heavy rain shower") {
      return ThemeModel(
        image: "assets/images/icons8-heavy-rain-100.png",
        color: Color(0xff325878),
      );
    } else if (condition == "Patchy snow possible" ||
        condition == "Blowing snow" ||
        condition == "Patchy light snow") {
      return ThemeModel(
        image: "assets/images/icons8-snow-100.png",
        color: Color(0xff4A6D83),
      );
    } else if (condition == "Patchy sleet possible" ||
        condition == "Light sleet" ||
        condition == "Moderate or heavy sleet" ||
        condition == "Moderate or heavy sleet showers" ||
        condition == "Light sleet showers") {
      return ThemeModel(
        image: "assets/images/icons8-sleet-100.png",
        color: Color(0xff4A6D83),
      );
    } else if (condition == "Heavy freezing drizzle" ||
        condition == "Heavy freezing drizzle" ||
        condition == "Light drizzle" ||
        condition == "Light drizzle" ||
        condition == "Patchy light drizzle") {
      return ThemeModel(
        image: "assets/images/icons8-light-rain-96.png",
        color: Color(0xff325878),
      );
    } else if (condition == "Blizzard") {
      return ThemeModel(
        image: "assets/images/icons8-blizzard-100.png",
        color: Color(0xff477E9D),
      );
    } else if (condition == "Ice pellets" ||
        condition == "Light showers of ice pellets" ||
        condition == "Moderate or heavy showers of ice pellets") {
      return ThemeModel(
        image: "assets/images/icons8-ice-pellets-100.png",
        color: Color(0xff617D8F),
      );
    } else if (condition == "Thundery outbreaks possible") {
      return ThemeModel(
        image: "assets/images/icons8-cloud-lightning-100.png",
        color: Color(0xff513F38),
      );
    } else if (condition == "Moderate or heavy rain with thunder" ||
        condition == "Patchy light rain with thunder") {
      return ThemeModel(
        image: "assets/images/icons8-storm-100.png",
        color: Color(0xff5E5A58),
      );
    } else if (condition == "Moderate or heavy snow with thunder" ||
        condition == "Patchy light snow with thunder") {
      return ThemeModel(
        image: "assets/images/icons8-snow-with-thunder-100.png",
        color: Color(0xff5C6F88),
      );
    }else{
      return ThemeModel(
        image: "assets/images/icons8-rain-100.png",
        color: Color(0xff5C6F88),
      );
    }
  }
}
