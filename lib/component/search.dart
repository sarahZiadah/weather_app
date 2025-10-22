import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

class Search extends StatelessWidget {
  Search();

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 78),
          decoration: BoxDecoration(
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
                onChanged: (data){
                  cityName=data;
                },
                onSubmitted: (data){
                  cityName=data;
                  WeatherService.getWeather(cityName:cityName!);
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
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              WeatherService.getWeather(cityName:cityName!);
            },
            icon: Icon(Icons.search, color: Color(0xff8C8B8B)),
            
          ),
        ),
      ],
    );
  }
}
