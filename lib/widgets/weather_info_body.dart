import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key,
  }) : super(key: key);
  //final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            'updated at ${weatherModel.date.hour}: ${weatherModel.date.minute}',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https:${weatherModel.image.toString()}",
              ),
              Text(
                weatherModel.temp as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'MinTemp :${weatherModel.minTemp.round() as String}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'MaxTemp :${weatherModel.maxTemp.round() as String}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            weatherModel.weatherState,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}

DateTime stringToDateTime(String value) {
  return DateTime.parse(value);
}
