import 'package:bankapp/domain/models/account_model.dart';
import 'package:bankapp/domain/models/transaction_model.dart';
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

  @observable
  List<Account> userAccounts = <Account>[];

  @observable
  List<TransactionModel> fakeTransactions = <TransactionModel>[
    TransactionModel(
      id: 1,
      amount: 30.0,
      originAccount: 45678,
      destinyAccount: 43212,
      currency: Currency.USD,
      transactionType: TransanctionType.INCOME,
      dateTime: DateTime.fromMillisecondsSinceEpoch(1628366456000),
    ),
    TransactionModel(
      id: 2,
      amount: 452.0,
      originAccount: 45678,
      destinyAccount: 0,
      currency: Currency.USD,
      transactionType: TransanctionType.WITHDRAW,
      dateTime: DateTime.fromMillisecondsSinceEpoch(1628374556000),
    ),
    TransactionModel(
      id: 3,
      amount: 863.0,
      originAccount: 45678,
      destinyAccount: 43212,
      currency: Currency.USD,
      transactionType: TransanctionType.TRANSFER,
      dateTime: DateTime.fromMillisecondsSinceEpoch(1628374556000),
    ),
    TransactionModel(
      id: 4,
      amount: 54.0,
      originAccount: 45678,
      destinyAccount: 4321,
      currency: Currency.USD,
      transactionType: TransanctionType.INCOME,
      dateTime: DateTime.fromMillisecondsSinceEpoch(1629552176000),
    ),
    TransactionModel(
      id: 5,
      amount: 189.0,
      originAccount: 45678,
      destinyAccount: 4321,
      currency: Currency.USD,
      transactionType: TransanctionType.TRANSFER,
      dateTime: DateTime.fromMillisecondsSinceEpoch(1629552276000),
    )
  ];

  // ··················· ACTIONS ·······················

  @action
  void setCurrentPosition(Position position) => currentPosition = position;

  @action
  void setCurrentPlacemark(Placemark placemark) => currentPlacemark = placemark;

  @action
  void setCurrentWeather(Weather weather) => currentWeather = weather;

  @action
  void setUserAccounts(List<Account> accounts) {
    userAccounts.clear();
    userAccounts = accounts;
  }
}
