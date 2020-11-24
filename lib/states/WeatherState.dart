import 'package:weather_test/models/Weather.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_test/models/DailyWeather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> hourlyWeather;
  final List<Daily> dailyWeather;

  const WeatherLoadSuccess(
      {@required this.weather, @required this.hourlyWeather, @required this.dailyWeather})
      : assert(weather != null);

  @override
  List<Object> get props => [weather, hourlyWeather, dailyWeather];
}

class WeatherLoadFailure extends WeatherState {}
