import 'package:bloc/bloc.dart';
import 'package:bloc_sample_project/data/repository/cats_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../data/model/weather.dart';
import '../data/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FakeWeatherRepository _weatherRepository;
  WeatherBloc(this._weatherRepository) : super(const WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeather) {
        try {
          emit(const WeatherLoading());
          Future.delayed(const Duration(milliseconds: 440));
          final response = await _weatherRepository.fetchWeather(event.cityName);
          emit(WeatherLoaded(response));
        } on NetworkError catch (e) {
          emit(WeatherError(e.message));
        }
      }
    });
  }
}
