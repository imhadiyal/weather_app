class Routes {
  Routes._();
  static final Routes routes = Routes._();

  String splash = '/';

  String weather_screen = 'weather_screen';`
  String add = 'add';
  Map<String, WidgetBuilder> get allRoutes => {
        '/': (context) => const SplashScreen(),
    'weather_screen': (context) => const WeatherScreen(),
      };
}
