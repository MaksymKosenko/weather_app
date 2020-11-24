import 'package:weather_test/components/WeatherDays.dart';
import 'package:weather_test/components/WeatherHours.dart';
import 'package:weather_test/models/Weather.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_test/models/DailyWeather.dart';

import 'WeatherCard.dart';

class MainScreenWrapper extends StatelessWidget {
  final Weather weather;
  final List<Weather> hourlyWeather;
  final List<Daily> dailyWeather;
  final bool hours_or_days;

  const MainScreenWrapper(
      {Key key,
      this.weather,
      this.hourlyWeather,
      this.dailyWeather,
      this.hours_or_days})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 150, 185, 215),
      child: Column(children: [
        Text(
          weather.cityName,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text('${weather.description}'),
        Spacer(),
        WeatherCard(
            title: "Now",
            temperature: '${weather.temperature}',
            iconCode: weather.iconCode,
            temperatureFontSize: 64,
            iconScale: 1,
            min: '${weather.min}',
            max: '${weather.max}',
            feelstemp: '${weather.feelstemp}',
            pressure: '${weather.pressure}',
            wind_speed: '${weather.wind_speed}'),
        Spacer(),
        (hours_or_days
            ? HourlyWeather(hourlyWeather: this.hourlyWeather)
            : DailyWeather(dailyWeather: this.dailyWeather))
      ]),
    );
  }
}
