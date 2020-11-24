import 'dart:convert';
import 'package:weather_test/models/Weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_test/models/DailyWeather.dart';


class WeatherService {
  static String _apiKey = "81959e7c4f50ffc4c6606decc446f6f8";

  static Future<Weather> fetchCurrentWeather({query, String lat = "", String lon =""}) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    print(url);
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static Future<List<Weather>> fetchHourlyWeather({String query, String lat = "", String lon =""}) async {
    var url = 'https://api.openweathermap.org/data/2.5/forecast?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    print(url);
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data = (jsonData['list'] as List<dynamic>)
          .map((item) {
            return Weather.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }

  /*
   static Future<List<Weather>> fetchDailyWeather({String query, String lat = "", String lon =""}) async {
    var url = 'https://api.openweathermap.org/data/2.5/forecast/daily?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    print(url);
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data = (jsonData['list'] as List<dynamic>)
          .map((item) {
            return Weather.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
   */

  static Future<List<Daily>> fetchDailyWeather({String query, String lat = "", String lon =""}) async {
    var url = 'https://api.openweathermap.org/data/2.5/onecall?q=$query&lat=$lat&lon=$lon&exclude=current,minutely,hourly,alerts&appid=$_apiKey';
    //'https://api.openweathermap.org/data/2.5/forecast/daily?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    print(url);
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

    List<Daily> data = (jsonData['daily'] as List<dynamic>)
      .map((item){
      return Daily.fromJson(item);
    }).toList();
return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
