class Daily {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final String daily;
  final DateTime dt;
  final String iconCode;
  final int feelstemp;
  final int min;
  final int max;
  final int pressure;
  final int wind_speed;

  Daily(
      {this.iconCode,
      this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.daily,
      this.dt,
      this.min,
      this.max,
      this.pressure,
      this.wind_speed,
      this.feelstemp});

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      iconCode: json['weather'][0]['icon'],
      daily: json['daily'],
      lat: json['lat'],
      lon: json['lon'],
      dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      min: double.parse(json['temp']['min'].toString()).toInt(),
      max: double.parse(json['temp']['max'].toString()).toInt(),
      feelstemp: double.parse(json['feels_like']['day'].toString()).toInt(),
      pressure: double.parse(json['pressure'].toString()).toInt(),
      wind_speed: double.parse(json['wind_speed'].toString()).toInt(),
    );
  }
}
