import 'package:bankapp/mobx/helper.dart';
import 'package:bankapp/utils/fake_data.dart';
import 'package:bankapp/utils/geolocalizator_api.dart';
import 'package:bankapp/utils/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:weather/weather.dart';

class WeatherComponent extends StatefulWidget {
  const WeatherComponent({Key? key}) : super(key: key);

  @override
  _WeatherComponentState createState() => _WeatherComponentState();
}

class _WeatherComponentState extends State<WeatherComponent> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    await Geolocalizator().getCityByPosition();
    await WeatherApi.getWeatherOfCurrentPosition();
    FakeData().createFakeAccounts();
  }

  Observer displayWheaterIcon() {
    return Observer(
      builder: (context) {
        if (Store.global.currentWeather == null) {
          return Container();
        }

        String? wIcon = Store.global.currentWeather?.weatherIcon;
        String url = 'http://openweathermap.org/img/wn/$wIcon.png';
        return Image.network(url, width: 22.0);
      },
    );
  }

  Observer displayCityName() {
    return Observer(
      builder: (context) {
        String city = Store.global.currentPlacemark?.locality ?? '...';
        String area =
            Store.global.currentPlacemark?.administrativeArea ?? '';
        String cp = Store.global.currentPlacemark?.postalCode ?? '';
        return Text('$city, $area $cp', style: const TextStyle(color: Colors.white));
      },
    );
  }

  Observer displayTemperature() {
    return Observer(
      builder: (context) {
        Temperature? temp = Store.global.currentWeather?.temperature;
        int? celsious = temp?.celsius?.round();
        return Text('$celsious ºC', style: const TextStyle(color: Colors.white));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          displayWheaterIcon(),
          displayCityName(),
          displayTemperature()
        ],
      ),
    );
  }
}
