import 'weather_conditon.dart';

class Current {
  double? tempC;
  Condition? condition;
  double? windKph;

  Current({
    this.tempC,
    this.condition,
    this.windKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: (json["temp_c"] as num?)?.toDouble(),
        condition: Condition.fromJson(json["condition"]),
        windKph: (json["wind_kph"] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp_c": tempC,
        "condition": condition?.toJson(),
        "wind_kph": windKph,
      };
}
