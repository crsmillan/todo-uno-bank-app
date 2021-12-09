
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/weather.dart';
part 'global_observer.g.dart';

class GlobalStore = GlobalStoreBase with _$GlobalStore;

abstract class GlobalStoreBase with Store {

  // ··················· OBSERVABLES ···················
  @observable
  Position? currentPosition;

  @observable
  Placemark? currentPlacemark;

  @observable
  Weather? currentWeather;


  // ··················· ACTIONS ·······················

  @action
  void setCurrentPosition(Position position) => currentPosition = position;

  @action
  void setCurrentPlacemark(Placemark placemark) => currentPlacemark = placemark;
  
  @action
  void setCurrentWeather(Weather weather) => currentWeather = weather;
}