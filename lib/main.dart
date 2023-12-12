import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/display weather/presentation/bloc/display_weather_bloc.dart';
import 'features/display weather/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayWeatherBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        home: HomePage(),
      ),
    );
  }
}
