import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/component/search.dart';
import 'package:weather_app/models/theme_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/nothing_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weather = Provider.of<WeatherProvider>(context).getWeather();
    ThemeModel? theme=weather!.getTheme();
    return weather.name!="Unknown"? Scaffold(
      backgroundColor: theme!.color,
      body: ListView(
        children: [
          Search(),
          Text(
            "${weather.name} , ${weather.country}",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 32,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            theme.image,
            fit: BoxFit.contain,
            height: 188,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${weather.avgtemp.toInt()}',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextSpan(
                  text: '°',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextSpan(
                  text: ' c',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "${weather.condition} ${weather.maxtemp.toInt()}°/${weather.minTemp.toInt()}°",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24,
              color: const Color.fromARGB(204, 255, 255, 255),
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                Spacer(flex: 1),
                info(
                  'Real Feel',
                  '${weather.feelslike.toInt()}°',
                  'assets/images/icons8-thermometer-100.png',
                ),
                Spacer(flex: 1),
                info(
                  'Humidity',
                  '${weather.humidity}%',
                  'assets/images/icons8-humidity-100.png',
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                Spacer(flex: 1),
                info(
                  'Sunrise',
                  weather.sunrise,
                  'assets/images/icons8-sunrise-100.png',
                ),
                Spacer(flex: 1),
                info(
                  'Pressure',
                  "${weather.pressure.toInt()}",
                  'assets/images/icons8-pressure-gauge-100.png',
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    ):NothingPage();
  }

  Widget info(String name, String condition, String image) {
    return Container(
      width: 153,
      height: 152,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(40),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // السحر هون
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Colors.white.withAlpha(170),
                  ),
                ),
                Text(
                  condition,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(image, height: 55),
            ),
          ],
        ),
      ),
    );
  }
}
