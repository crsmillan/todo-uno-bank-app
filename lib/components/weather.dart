import 'package:flutter/material.dart';

class WeatherComponent extends StatefulWidget {
  const WeatherComponent({Key? key}) : super(key: key);

  @override
  _WeatherComponentState createState() => _WeatherComponentState();
}

class _WeatherComponentState extends State<WeatherComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Icon(Icons.wb_sunny),
            Text('Leon, Gto, CP.37549'),
            Text('4ºC/22ªC')
          ],
        ),
      ),
    );
  }
}

class Geolocalizator {
 
  
}
