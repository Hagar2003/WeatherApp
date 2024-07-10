import 'dart:math';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b383b019ce0241b3bb6210430240207';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String name}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?k=$apiKey&q=$name&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage = e.response?.data['error']['message'] ??
          'oops there was an error ,try later';
      throw Exception(errormessage);
    } catch (e) {
      log(e.toString() as num);
      throw Exception(('oops an error occure'));
    }
  }
}
