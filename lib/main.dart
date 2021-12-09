import 'package:bankapp/components/appBar.dart';
import 'package:bankapp/components/weather.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BankApp());
}

class BankApp extends StatelessWidget {
  const BankApp({Key? key}) : super(key: key);

  static const String appName = 'BankApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponet(title: BankApp.appName),
      body: Column(
        children: const [
          WeatherComponent(),
        ],
      ),
    );
  }
}
