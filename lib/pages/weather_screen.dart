import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_app/controller/weather.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  TextField(
                    cursorColor: Colors.white,
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: 'Enter city name',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          weatherController.fetchWeather(cityController.text);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    weatherController.weather.value.cityName,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    weatherController.weather.value.description,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Image.asset(
                    width: 100,
                    height: 100,
                    'lib/assets/fav.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${weatherController.weather.value.temperature}°C',
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  SizedBox(height: 55),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage("lib/assets/sun.png"),
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'SUNRISE',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '7:00',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image(
                            image: AssetImage("lib/assets/wind.png"),
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Wind',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '15.3 km/h',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image(
                              image: AssetImage("lib/assets/temp.png"),
                              height: 50,
                              width: 50,
                              color: Colors.white),
                          Text(
                            'Temprature',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '23',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
