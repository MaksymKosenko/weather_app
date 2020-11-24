import 'package:flutter/material.dart';

class MoreInfoScreen extends StatelessWidget {
  final String title;
  final String temperature;
  final String iconCode;
  final double iconScale;
  final String min;
  final String max;
  final String feelstemp;
  final String pressure;
  final String wind_speed;

  MoreInfoScreen({String title, String temperature,String iconCode, double iconScale,double lat, double lon,
  String min, String max, String feelstemp, String pressure, String wind_speed}):title=title,temperature=temperature,
  iconCode = iconCode, iconScale = iconScale,min = min, max = max, feelstemp = feelstemp, pressure = pressure, wind_speed = wind_speed;
  @override
  Widget build(BuildContext context) {
    go_back(){
      Navigator.pop(context);
    }
    return Material(
      child: GestureDetector(
          onTap: go_back,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 150,),
                Text(title,style: TextStyle(color: Colors.black,fontSize: 32),),
                Image.network("http://openweathermap.org/img/wn/${this.iconCode}@2x.png", scale: 0.5),
                Text('$temperature°',style: TextStyle(color: Colors.black,fontSize: 32),),
                Spacer(),
                Text('min temp:$min°, max temp: $max°',style: TextStyle(color: Colors.black,fontSize: 16)),
                Text('feels like: $feelstemp°',style: TextStyle(color: Colors.black,fontSize: 16)),
                Spacer(),
                Text('wind speed - $wind_speed m/s, pressure - $pressure mb',style: TextStyle(color: Colors.black,fontSize: 16)),
                Spacer()
              ],
            ),)),
    );
  }
}
