import 'dart:convert';

import 'package:http/http.dart' as http;
class WeatherService {
  static const baseURL='http://api.weatherapi.com/v1';
  static const String apiKey='a76e3c7004b848b5a6d192140251710';
  static getWeather({required String cityName})async{
    Uri url=Uri.parse('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=3');
    http.Response response= await http.get(url);
    Map<String , dynamic> data=jsonDecode(response.body);
    print( data);
  }
}