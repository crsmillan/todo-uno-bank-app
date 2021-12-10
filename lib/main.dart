import 'package:bankapp/components/account_carousel_slider.dart';
import 'package:bankapp/components/app_bar.dart';
import 'package:bankapp/components/section.dart';
import 'package:bankapp/components/weather.dart';
import 'package:bankapp/domain/models/account_model.dart';
import 'package:bankapp/mobx/helper.dart';
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

  yield(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppSectionTitle(title: 'Cuentas'),
          AccountCarouselSlider()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponet(title: BankApp.appName),
      body: Column(
        children: [
          const WeatherComponent(),
          yield(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          List<Account> accounts = <Account>[
            Account(
              accountType: AccountType.Corriente,
              id: 234567890,
              balance: 456.087,
              currency: Currency.USD
            ),
            Account(
              accountType: AccountType.Ahorro,
              id: 367890,
              balance: 28456.087,
              currency: Currency.MXN
            ),
          ];
          Store.global.setUserAccounts(accounts);
        },
      ),
    );
  }
}
