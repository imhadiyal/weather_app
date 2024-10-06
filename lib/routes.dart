import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_app/pages/detailpage.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:weather_app/pages/weather_screen.dart';

class Routes {
  static const String splash = '/';
  static const String weatherScreen = 'weather_page';
  static const String register = 'register';
  static const String dashboard = 'dashboard';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: weatherScreen, page: () => WeatherInfo()),
  ];
}
