import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:weather_app/modals/weather_modals.dart';

class Helper {
  Helper._();
  static final Helper helper = Helper._();
  String api =
      "http://api.weatherapi.com/v1/current.json?key=65578899c53c48b999f121435240206&q=surat";

  List<Weather> allWeatherLocation = [];
  List<Weather> allWeatherCurrent = [];
  Future<List<Weather>> initdata() async {
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body)['location'];
      List weather = data.entries.map((e) => e.value).toList();

      Logger().i(weather);
      allWeatherLocation = weather.map((e) => Weather.fromJson(e)).toList();
      // allWeatherLocation = weather.map((e) => Weather.fromJson(e)).toList();
    }
    return allWeatherLocation;
  }
}
