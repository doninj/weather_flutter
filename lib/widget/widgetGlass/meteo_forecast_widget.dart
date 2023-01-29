import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({Key? key, required this.weatherFiveForecast}) : super(key: key);
  final List<Weather> weatherFiveForecast;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      borderRadius: BorderRadius.circular(10),
      alignment: Alignment.center,
      borderColor: Colors.transparent,
      height: 130,
      blur: 30,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: (Wrap(
          children: [
            for (var fiveDay in weatherFiveForecast)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    fiveDay.date != null
                        ? Text(
                      '${DateFormat.H().format(fiveDay.date as DateTime)} h',
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          color: Colors.white),
                    )
                        : Container(),
                    Image.network(
                      'https://openweathermap.org/img/w/${fiveDay.weatherIcon}.png',
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      '${fiveDay.temperature?.celsius?.toStringAsFixed(0)}°',
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
          ],
        )),
      ),
    );
  }
}