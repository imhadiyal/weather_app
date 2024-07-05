import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weather_app/pages/wether_page.dart';

import '../controller/weather_controller.dart';
import '../modals/city_modals.dart';
import 'detailpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController controller = Get.put(WeatherController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.to(() => const SearchPage());
            },
          ),
        ],
      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter City Name',
                ),
                onChanged: (value) {
                  controller.initdata(city: value);
                },
              ),
            ),
            controller.allweather.isNotEmpty
                ? Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const WetherPage());
                      },
                      child: ListView.builder(
                        itemCount: controller.allweather.length,
                        itemBuilder: (context, index) {
                          City city = controller.allweather[index];
                          return ListTile(
                            title: Text(city.name),
                            subtitle: Text("${city.state} ${city.country}"),
                            onTap: () {
                              controller.getCityWeather(city: city);
                            },
                          );
                        },
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        );
      }),
    );
  }
}
