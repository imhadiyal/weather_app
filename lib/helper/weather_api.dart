import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/modals/weather_modals.dart';

import '../modals/city_modals.dart';

class Helper {
  Helper._();
  static final Helper helper = Helper._();
  final String _api = "4146cadf56519a782b2b86acf3f4bbb4";

  final String _weather = 'https://api.openweathermap.org';

  List<City> allWeatherCurrent = [];
  Future<List<City>> initdata({required String city}) async {
    List<City> allcity = [];
    String api = '$_weather/geo/1.0/direct?q=$city&limit=5&appid=$_api';
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      allcity = data.map((e) => City.fromJson(e)).toList();
    }
    return allcity;
  }

  Future<CityWeatherModal> cityWeatherApi({required City city}) async {
    CityWeatherModal cityWeather = CityWeatherModal.fromJson({});
    String searchCityApi =
        '$_weather/data/2.5/weather?lat=${city.lat}&lon=${city.lon}&appid=$_api';
    http.Response response = await http.get(Uri.parse(searchCityApi));

    if (response.statusCode == 200) {
      Map cityWeatherMap = jsonDecode(response.body);
      cityWeather =
          CityWeatherModal.fromJson(cityWeatherMap as Map<String, dynamic>);
    }
    return cityWeather;
  }
}
