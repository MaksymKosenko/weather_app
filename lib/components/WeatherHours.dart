import 'package:weather_test/models/Weather.dart';
import 'package:flutter/widgets.dart';

import 'WeatherCard.dart';

class HourlyWeather extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const HourlyWeather({Key key, this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyWeather.length,
            itemBuilder: (context, i) {
              return WeatherCard(
                title:
                    '${hourlyWeather[i].time.hour}:${hourlyWeather[i].time.minute}0',
                temperature: '${hourlyWeather[i].temperature.toInt()}',
                iconCode: hourlyWeather[i].iconCode,
                temperatureFontSize: 20,
                min: '${hourlyWeather[i].min}',
                max: '${hourlyWeather[i].max}',
                feelstemp: '${hourlyWeather[i].feelstemp}' ,
                pressure: '${hourlyWeather[i].pressure}',
                wind_speed: '${hourlyWeather[i].wind_speed}',
              );
            }));
  }
}
