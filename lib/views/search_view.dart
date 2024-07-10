//import 'dart:math';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search City')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: TextField(
          // onChanged: ( value) {
          //   log(value as num);
          // },
          onSubmitted: (v) async {
            var getWeatherCubit =BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(v: v, name: v);
          Navigator.pop(context);
          },
          decoration: InputDecoration(
            hintText: 'Enter city name',
            labelText: 'Search',
            contentPadding:
                const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17.0),
                borderSide: const BorderSide(color: Colors.green)),
            // enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(17.0),
            //     borderSide: const BorderSide(color: Colors.green)
            // ),
            // focusedBorder:  OutlineInputBorder(
            //   //  borderRadius: BorderRadius.circular(17.0),
            //     borderSide: const BorderSide(color: Color.fromARGB(255, 175, 76, 157))
            // ))
          ),
        )),
      ),
    );
  }
}


