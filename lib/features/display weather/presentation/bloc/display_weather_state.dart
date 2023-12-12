// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'display_weather_bloc.dart';

enum DisplayWeatherStatus { initial, loading, success, failed }

class DisplayWeatherState {
  DisplayWeatherStatus status;
  Current? currentstate;
  String? errorMessage;
  DisplayWeatherState({
    required this.status,
    this.currentstate,
    this.errorMessage,
  });

  DisplayWeatherState copyWith({
    DisplayWeatherStatus? status,
    Current? currentstate,
    String? errorMessage,
  }) {
    return DisplayWeatherState(
      status: status ?? this.status,
      currentstate: currentstate ?? this.currentstate,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory DisplayWeatherState.initial() =>
      DisplayWeatherState(status: DisplayWeatherStatus.initial);
}
