import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherComponent extends StatefulWidget {
  const WeatherComponent({Key? key}) : super(key: key);

  @override
  _WeatherComponentState createState() => _WeatherComponentState();
}

class _WeatherComponentState extends State<WeatherComponent> {
  @override
  void initState() {
    Geolocalizator().getCityByPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(Icons.wb_sunny),
          Text('Leon, Gto, CP.37549'),
          Text('4ºC/22ªC')
        ],
      ),
    );
  }
}

class Geolocalizator {
  Future<Position> _getPosition() async {
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

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<Placemark> getCityByPosition() async {
    Position position = await _getPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isEmpty) {
      throw Exception('No Placemarks received');
    }

    Placemark placemark = placemarks.first;
    log(placemark.toString());
    return placemark;
  }
}
