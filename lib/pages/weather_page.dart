import 'package:flutter/material.dart';
import 'package:weather_app/component/search.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4C9BFF),
      body: Column(
        children: [
          Search(),
          Text(
            "Darayya , Syria",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          Image.asset(
            'assets/images/icons8-sun-100.png',
            fit: BoxFit.contain,
            height: 188,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '12',
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
          ),
          Text(
            "clear 27°/9°",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24,
              color: const Color.fromARGB(204, 255, 255, 255),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              children: [
                Spacer(flex: 1,),
                info(
                  'Real Feel',
                  '22°',
                  'assets/images/icons8-thermometer-100.png',
                ),
                Spacer(flex: 1,),
                info(
                  'Humidity',
                  '28%',
                  'assets/images/icons8-humidity-100.png',
                ),
                Spacer(flex: 1,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              children: [
                Spacer(flex: 1,),
                info(
                  'Sunrise',
                  '06:46',
                  'assets/images/icons8-sunrise-100.png',
                ),
                Spacer(flex: 1,),
                info(
                  'Pressure',
                  '1016',
                  'assets/images/icons8-pressure-gauge-100.png',
                ),
                Spacer(flex: 1,),
              ],
            ),
          ),
        ],
      ),
    );
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
