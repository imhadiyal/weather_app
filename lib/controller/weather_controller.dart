import 'package:get/get.dart';
import 'package:weather_app/helper/weather_api.dart';

import '../modals/weather_modals.dart';

class WeatherController extends GetxController {
  WeatherController() {
    initdata();
  }
  RxList<Weather> allweather = <Weather>[].obs;
  RxBool isLogin = true.obs;

  Future<void> initdata() async {
    allweather((await Helper.helper.initdata()));
    isLogin(false);
  }
}
