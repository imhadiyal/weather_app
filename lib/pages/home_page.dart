import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weather_app/controller/weather_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController weatherController = WeatherController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: ListView.builder(
        itemCount: weatherController.allweather.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Obx(
              () {
                return Text(
                  weatherController.allweather[index].location.name.toString(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
