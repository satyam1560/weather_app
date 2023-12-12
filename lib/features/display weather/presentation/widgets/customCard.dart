import 'package:flutter/material.dart';
import 'package:weather_application/features/display%20weather/data/models/current_weather.dart';

class CustomCard extends StatelessWidget {
  final Current? currentstate;
  final String? cityName;

  const CustomCard(
      {Key? key, required this.currentstate, required this.cityName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'City: $cityName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Temperature: ${currentstate?.tempC}°C',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Condition: ${currentstate?.condition?.text}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Wind Speed: ${currentstate?.windKph} kph',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
