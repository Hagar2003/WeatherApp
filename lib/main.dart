import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child:const CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch:getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel.weatherState)),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}


MaterialColor getWeatherColor(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.lightBlue;
    case 'patchy rain possible':
      return Colors.lightGreen;
    case 'patchy snow possible':
      return Colors.blue;
    case 'patchy sleet possible':
      return Colors.purple;
    case 'patchy freezing drizzle possible':
      return Colors.yellow;
    case 'thundery outbreaks possible':
      return Colors.blue;
    case 'blowing snow':
      return Colors.white;
    case 'blizzard':
      return Colors.white;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
      return Colors.yellow;
    case 'light drizzle':
      return Colors.yellow;
    case 'freezing drizzle':
      return Colors.yellow;
    case 'heavy freezing drizzle':
      return Colors.orange;
    case 'patchy light rain':
      return Colors.green;
    case 'light rain':
      return Colors.green;
    case 'moderate rain at times':
      return Colors.green;
    case 'moderate rain':
      return Colors.green;
    case 'heavy rain at times':
      return Colors.green;
    case 'heavy rain':
      return Colors.green;
    case 'light freezing rain':
      return Colors.lightBlue;
    case 'moderate or heavy freezing rain':
      return Colors.blue;
    case 'light sleet':
      return Colors.blue;
    case 'moderate or heavy sleet':
      return Colors.blue;
    case 'patchy light snow':
      return Colors.blue;
    case 'light snow':
      return Colors.blue;
    case 'patchy moderate snow':
      return Colors.blue;
    case 'moderate snow':
      return Colors.blue;
    case 'patchy heavy snow':
      return Colors.blue;
    case 'heavy snow':
      return Colors.blue;
    case 'ice pellets':
      return Colors.lightBlue;
    case 'light rain shower':
      return Colors.green;
    case 'moderate or heavy rain shower':
      return Colors.green;
    case 'torrential rain shower':
      return Colors.green;
    case 'light sleet showers':
      return Colors.blue;
    case 'moderate or heavy sleet showers':
      return Colors.blue;
    case 'light snow showers':
      return Colors.blue;
    case 'moderate or heavy snow showers':
      return Colors.blue;
    case 'light showers of ice pellets':
      return Colors.lightBlue;
    case 'moderate or heavy showers of ice pellets':
      return Colors.blue;
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy light snow with thunder':
      return Colors.blue;
    case 'moderate or heavy snow with thunder':
      return Colors.blue;
    default:
      return Colors.black;
  }
}


