import 'package:bloc_sample_project/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/weather_repository.dart';

class BlocWeatherView extends StatefulWidget {
  const BlocWeatherView({super.key});

  @override
  State<BlocWeatherView> createState() => _BlocWeatherViewState();
}

class _BlocWeatherViewState extends State<BlocWeatherView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(FakeWeatherRepository()),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              Scaffold.of(context).showBottomSheet((context) => Text(state.message));
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: Column(
                  children: [
                    const Text('Initial'),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<WeatherBloc>().add(GetWeather('İstanbul'));
                      },
                      child: const Icon(Icons.read_more_outlined),
                    ),
                  ],
                ),
              );
            } else if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (state is WeatherLoaded) {
              return Text(state.weather[0].cityName);
            } else {
              final error = state as WeatherError;
              return Center(
                child: Text(error.message),
              );
            }
          },
        ),
      );
}
