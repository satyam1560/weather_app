// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

import 'current_weather.dart';
import 'weather_location.dart';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({
    this.location,
    this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location:
            // json["location"] == null
            //     ? null
            // :
            Location.fromJson(json["location"]),
        current:
            // json["current"] == null ? null :
            Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
      };
}
