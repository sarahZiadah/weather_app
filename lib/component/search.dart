import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

WeatherModel? weather;
class Search extends StatelessWidget {
  Search({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 78, bottom: 35),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(65, 0, 0, 0),
                  offset: Offset(1, 5),
                  blurRadius: 7,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            width: 260,
            height: 42,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.5),
                child: TextField(
                  onChanged: (data) {
                    cityName = data;
                  },
                  onSubmitted: (data) async {
                    cityName = data;
                    weather = await WeatherService.getWeather(
                      cityName: cityName!,
                    );
                    Provider.of<WeatherProvider?>(
                      context,
                      listen: false,
                    )?.setWeather(weather);
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "search",
                    hintStyle: TextStyle(color: Color(0xff8C8B8B)),
                  ),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 28),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(108, 0, 0, 0),
                  offset: Offset(0, 5),
                  blurRadius: 15,
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () async {
                  weather = await WeatherService.getWeather(
                    cityName: cityName!,
                  );
                  Provider.of<WeatherProvider?>(
                    context,
                    listen: false,
                  )?.setWeather(weather);
                },
                icon: Icon(Icons.search, color: Color(0xff8C8B8B)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
