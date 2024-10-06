import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/weather_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Search Page'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
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
                        flex: 15,
                        child: ListView.builder(
                          itemCount: controller.allweather.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(controller.allweather[index].name),
                              subtitle: Text(
                                  '${controller.allweather[index].state.replaceFirst(
                                controller.allweather[index].state[0]
                                    .toUpperCase(),
                                controller.allweather[index].state[0]
                                    .toUpperCase(),
                              )} ${controller.allweather[index].country.replaceFirst(
                                controller.allweather[index].country[0]
                                    .toUpperCase(),
                                controller.allweather[index].country[0]
                                    .toUpperCase(),
                              )}'),
                              onTap: () async {
                                await controller.getCityWeather(
                                  city: controller.allweather[index],
                                );
                                Get.back();
                              },
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            )),
      ),
    );
  }
}
