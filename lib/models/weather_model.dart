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
  }

  @override
  String toString() {
    return super.toString();
  }
}
