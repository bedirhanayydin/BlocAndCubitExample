// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final List<Weather> weather;

  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && listEquals(o.weather, weather);
  }

  @override
  int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);
}
