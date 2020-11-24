class Weather {
  final String cityName;
  final int temperature;
  final String iconCode;
  final String description;
  final DateTime time;
  final int feelstemp;
  final int min;
  final int max;
  final int pressure;
  final int wind_speed;

  Weather(
      {this.cityName,
      this.temperature,
      this.iconCode,
      this.description,
      this.time,
      this.feelstemp,
      this.min,
      this.max,
      this.pressure,
      this.wind_speed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        temperature: double.parse(json['main']['temp'].toString()).toInt(),
        iconCode: json['weather'][0]['icon'],
        description: json['weather'][0]['main'],
        time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        feelstemp: double.parse(json['main']['feels_like'].toString()).toInt(),
        min: double.parse(json['main']['temp_min'].toString()).toInt(),
        max: double.parse(json['main']['temp_max'].toString()).toInt(),
        pressure: double.parse(json['main']['pressure'].toString()).toInt(),
        wind_speed: double.parse(json['wind']['speed'].toString()).toInt(),
    );
  }

}
