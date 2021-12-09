import 'package:bankapp/mobx/helper.dart';
import 'package:bankapp/utils/geolocalizator_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class WeatherApi {
  static const String _api = 'e494ef18562f1f68bea1fc3f6aca6182';
  static Future<Weather> getWeatherOfCurrentPosition() async {
    WeatherFactory wf = WeatherFactory(_api, language: Language.SPANISH);
    Position p = await Geolocalizator().getPosition();

    Weather _weather = await wf.currentWeatherByLocation(
      p.latitude,
      p.longitude,
    );

    Store.global.setCurrentWeather(_weather);
    return _weather;
  }
}
