import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/widget/weather_widget.dart';

class MainWeatherWidget extends StatefulWidget {
  const MainWeatherWidget({Key? key}) : super(key: key);

  @override
  State<MainWeatherWidget> createState() => _MainWeatherWidgetState();
}

class _MainWeatherWidgetState extends State<MainWeatherWidget> {
  static const String apiKey = '27fa90cf6dd95057742ae427b6c83949';
  final WeatherFactory wf = WeatherFactory(apiKey, language: Language.FRENCH);
  List<Weather> weatherList = [];
  var fiveDaysWeather = [];
  List<String> nameOfCities = ['lyon', 'paris', 'marseille', 'toulouse'];
  Future<void> getWeather() async {
    for (var element in nameOfCities) {
      final List<Weather> fiveDay = await wf.fiveDayForecastByCityName(element);
      final Weather w = await wf.currentWeatherByCityName(element);
      setState(() {
        weatherList.add(w);
        fiveDaysWeather.add(fiveDay);
      });
    }
  }
  Future<void> init() async {
    await getWeather();
    print(weatherList);
  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherList!= null ? CarouselSlider(
        items: weatherList
            .map((e) =>
                WeatherWidget(weather: e, fiveDaysForecast: fiveDaysWeather[weatherList.indexOf(e)]))
            .toList(),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          initialPage: 0,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
      ) : const Center(child: CircularProgressIndicator()),
    );
  }
}
