import 'package:get/get.dart';
import 'package:weather_app/helper/weather_api.dart';

import '../modals/city_modals.dart';
import '../modals/weather_modals.dart';

class WeatherController extends GetxController {
  WeatherController() {
    initdata();
  }
  RxList<City> allweather = <City>[].obs;
  RxList<CityWeather> cityWeather = <CityWeather>[].obs;
  RxBool isLogin = true.obs;

  Future<void> initdata({String city = 'Surat'}) async {
    allweather(await Helper.helper.initdata(city: city));
    if (city == "Surat") {
      getCityWeather(
          city: City(
              name: "Surat",
              lat: 21.2094892,
              lon: 21.2094892,
              country: "IN",
              state: "Gujarat"));
    }
    isLogin(false);
  }

  Future<void> getCityWeather({required City city}) async {
    cityWeather[0] = await Helper.helper.cityWeatherApi(city: city);
  }
}
