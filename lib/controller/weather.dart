import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../modals/weather.dart';

class WeatherController extends GetxController {
  var isLoading = true.obs;
  var weather =
      WeatherModel(cityName: "", temperature: 0, description: "", icon: "").obs;

  Future<void> fetchWeather(String cityName) async {
    final apiKey = '4146cadf56519a782b2b86acf3f4bbb4';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey';

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        weather.value = WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar('Error', 'City not found');
      }
    } finally {
      isLoading(false);
    }
  }
}
