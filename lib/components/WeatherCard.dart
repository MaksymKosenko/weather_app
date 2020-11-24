import 'package:flutter/material.dart';
import 'package:weather_test/components/MoreInfoScreen.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final String temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;
  final String min;
  final String max;
  final String feelstemp;
  final String pressure;
  final String wind_speed;

  const WeatherCard(
      {Key key,
      this.title,
      this.temperature,
      this.iconCode,
      this.temperatureFontSize = 32,
      this.iconScale = 2,
      this.feelstemp,
      this.max,
      this.min,
      this.pressure,
      this.wind_speed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdditionalInfo() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MoreInfoScreen(
                title: this.title,
                temperature: this.temperature,
                iconCode: this.iconCode,
                iconScale: this.iconScale,
                feelstemp: this.feelstemp,
                max: this.max,
                min: this.min,
                pressure: this.pressure,
                wind_speed: this.wind_speed)),
      );
    }

    return GestureDetector(
      onTap: AdditionalInfo,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(this.title),
                Image.network(
                    "http://openweathermap.org/img/wn/${this.iconCode}@2x.png",
                    scale: this.iconScale),
                Text(
                  '${this.temperature}°',
                  style: TextStyle(
                      fontSize: this.temperatureFontSize,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
