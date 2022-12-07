import 'package:bloc_sample_project/data/model/weather.dart';

abstract class WeatherRepository {
  Future<List<Weather>> fetchWeather(String cityName);
}

class FakeWeatherRepository extends WeatherRepository {
  @override
  Future<List<Weather>> fetchWeather(String cityName) {
    return Future.delayed(
      const Duration(milliseconds: 400),
      () {
        return [Weather(cityName: cityName, temperatureCelcius: 555555)];
      },
    );
  }
}

class NetworkException implements Exception {}
