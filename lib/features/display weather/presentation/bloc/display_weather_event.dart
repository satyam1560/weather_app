part of 'display_weather_bloc.dart';

abstract class DisplayWeatherEvent extends Equatable {
  const DisplayWeatherEvent();

  @override
  List<Object?> get props => [];
}

class DisplayWeather extends DisplayWeatherEvent {
  final String cityName;
  const DisplayWeather({required this.cityName});
  @override
  List<Object?> get props => [cityName];
}
