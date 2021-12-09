import 'package:bankapp/mobx/helper.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Geolocalizator {
  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    Store.global.setCurrentPosition(position);
    return position;
  }

  Future<Placemark> getCityByPosition() async {
    await getPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      Store.global.currentPosition!.latitude,
      Store.global.currentPosition!.longitude,
    );

    if (placemarks.isEmpty) {
      throw Exception('No Placemarks received');
    }

    Placemark placemark = placemarks.first;
    Store.global.setCurrentPlacemark(placemark);
    return placemark;
  }
}
