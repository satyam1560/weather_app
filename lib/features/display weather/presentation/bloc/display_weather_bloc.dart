import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/current_weather.dart';
import '../../data/repositories/weather_repo.dart';

part 'display_weather_event.dart';
part 'display_weather_state.dart';

class DisplayWeatherBloc
    extends Bloc<DisplayWeatherEvent, DisplayWeatherState> {
  DisplayWeatherBloc() : super(DisplayWeatherState.initial()) {
    on<DisplayWeather>((event, emit) async {
      WeatherRepo weatherRepo = WeatherRepo();
      emit(state.copyWith(status: DisplayWeatherStatus.loading));
      try {
        Current currCity =
            await weatherRepo.getWeather(cityName: event.cityName);
        emit(state.copyWith(
            status: DisplayWeatherStatus.success, currentstate: currCity));
      } catch (e) {
        emit(state.copyWith(
            status: DisplayWeatherStatus.failed, errorMessage: e.toString()));
      }
    });
  }
}
