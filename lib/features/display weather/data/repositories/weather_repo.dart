import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/current_weather.dart';

class WeatherRepo {
  final String apiKey = 'b8bb538cd2784bd987d103859231212';

  Future<Current> getWeather({required String cityName}) async {
    final String url =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName&aqi=no';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Current weatherData = Current.fromJson(data['current']);
      // print('Weather data for $cityName: $weatherData');
      return weatherData;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
