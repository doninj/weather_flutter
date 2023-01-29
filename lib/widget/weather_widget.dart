import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:weather_app/widget/widgetGlass/humidity_widget.dart';
import 'package:weather_app/widget/widgetGlass/meteo_forecast_widget.dart';
import 'package:weather_app/widget/widgetGlass/rain_widget.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key, required this.weather, required this.fiveDaysForecast}) : super(key: key);
  final weather;
  final fiveDaysForecast;
  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  String cityName = 'Lyon';
  List<Weather> weatherList = [];
  var weatherByname;
  Widget _tempFeel() {
    return GlassContainer.clearGlass(
      borderRadius: BorderRadius.circular(10),
      alignment: Alignment.center,
      borderColor: Colors.transparent,
      height: 180,
      blur: 30,
      width: 190,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Pluie',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          weatherByname.rainLastHour != null
              ? Text(
                  '${weatherByname.rainLastHour} mm',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Flexible(
                  child: Center(
                    child: Text(
                      '0 mm',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('mm de pluies sur les 3 dernières heures',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cloud.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            '${widget.weather.areaName}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${widget.weather.temperature?.celsius?.toStringAsFixed(0)}°',
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 60,
                                color: Colors.white),
                          ),
                          Text(
                            '${widget.weather.weatherDescription.toLowerCase()}',
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                ),
                                Text(
                                  '${widget.weather.tempMax?.celsius?.toStringAsFixed(0)}°',
                                  style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    '${widget.weather.tempMin?.celsius?.toStringAsFixed(0)}°',
                                    style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              WeatherForecastWidget(weatherFiveForecast: widget.fiveDaysForecast),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [HumidityWidget(humidity: widget.weather.humidity),
                                    RainWidget(rainLastHour: widget.weather.rainLastHour)],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlassContainer.frostedGlass(
                                      borderRadius: BorderRadius.circular(10),
                                      alignment: Alignment.center,
                                      borderColor: Colors.transparent,
                                      height: 180,
                                      blur: 30,
                                      width: 190,
                                      child: const Text('test'),
                                    ),
                                    GlassContainer.clearGlass(
                                      borderRadius: BorderRadius.circular(10),
                                      alignment: Alignment.center,
                                      borderColor: Colors.transparent,
                                      height: 180,
                                      blur: 30,
                                      width: 190,
                                      child: const Text('test'),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlassContainer.clearGlass(
                                      borderRadius: BorderRadius.circular(10),
                                      alignment: Alignment.center,
                                      borderColor: Colors.transparent,
                                      height: 180,
                                      blur: 30,
                                      width: 190,
                                      child: const Text('test'),
                                    ),
                                    GlassContainer.clearGlass(
                                      borderRadius: BorderRadius.circular(10),
                                      alignment: Alignment.center,
                                      borderColor: Colors.transparent,
                                      height: 180,
                                      blur: 30,
                                      width: 190,
                                      child: const Text('test'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
