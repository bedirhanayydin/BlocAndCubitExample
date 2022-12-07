// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final String cityName;

  GetWeather(this.cityName);
}
