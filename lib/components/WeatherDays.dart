import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_test/models/DailyWeather.dart';

import 'WeatherCard.dart';
class DailyWeather extends StatelessWidget {
  final List<Daily> dailyWeather;
  const DailyWeather({Key key, this.dailyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dailyWeather.length,
            itemBuilder: (context, i) {
              var day;
              if(dailyWeather[i].dt.weekday == 1)
                 day = "Mon";
              if(dailyWeather[i].dt.weekday == 2)
                day = "Tue";
              if(dailyWeather[i].dt.weekday == 3)
                day = "Wed";
              if(dailyWeather[i].dt.weekday == 4)
                day = "Thu";
              if(dailyWeather[i].dt.weekday == 5)
                day = "Fri";
              if(dailyWeather[i].dt.weekday == 6)
                day = "Sat";
              if(dailyWeather[i].dt.weekday == 7)
                day ="Sun";
              return WeatherCard(
                title:
                '${day}, ${dailyWeather[i].dt.day}',
                 temperature: '${dailyWeather[i].min - 273} - ${dailyWeather[i].max - 273}',

                iconCode: dailyWeather[i].iconCode,
                temperatureFontSize: 20,
                min: '${dailyWeather[i].min-273}',
                max: '${dailyWeather[i].max-273}',
                feelstemp: '${dailyWeather[i].feelstemp -273}' ,
                pressure: '${dailyWeather[i].pressure}',
                wind_speed: '${dailyWeather[i].wind_speed}',
              );
            }));
  }
}
