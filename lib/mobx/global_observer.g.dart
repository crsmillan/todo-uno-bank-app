// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_observer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalStore on GlobalStoreBase, Store {
  final _$currentPositionAtom = Atom(name: 'GlobalStoreBase.currentPosition');

  @override
  Position? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$currentPlacemarkAtom = Atom(name: 'GlobalStoreBase.currentPlacemark');

  @override
  Placemark? get currentPlacemark {
    _$currentPlacemarkAtom.reportRead();
    return super.currentPlacemark;
  }

  @override
  set currentPlacemark(Placemark? value) {
    _$currentPlacemarkAtom.reportWrite(value, super.currentPlacemark, () {
      super.currentPlacemark = value;
    });
  }

  final _$currentWeatherAtom = Atom(name: 'GlobalStoreBase.currentWeather');

  @override
  Weather? get currentWeather {
    _$currentWeatherAtom.reportRead();
    return super.currentWeather;
  }

  @override
  set currentWeather(Weather? value) {
    _$currentWeatherAtom.reportWrite(value, super.currentWeather, () {
      super.currentWeather = value;
    });
  }

  final _$userAccountsAtom = Atom(name: 'GlobalStoreBase.userAccounts');

  @override
  List<Account> get userAccounts {
    _$userAccountsAtom.reportRead();
    return super.userAccounts;
  }

  @override
  set userAccounts(List<Account> value) {
    _$userAccountsAtom.reportWrite(value, super.userAccounts, () {
      super.userAccounts = value;
    });
  }

  final _$fakeTransactionsAtom = Atom(name: 'GlobalStoreBase.fakeTransactions');

  @override
  List<TransactionModel> get fakeTransactions {
    _$fakeTransactionsAtom.reportRead();
    return super.fakeTransactions;
  }

  @override
  set fakeTransactions(List<TransactionModel> value) {
    _$fakeTransactionsAtom.reportWrite(value, super.fakeTransactions, () {
      super.fakeTransactions = value;
    });
  }

  final _$userAtom = Atom(name: 'GlobalStoreBase.user');

  @override
  String? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$passwordAtom = Atom(name: 'GlobalStoreBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$loggedAtom = Atom(name: 'GlobalStoreBase.logged');

  @override
  bool get logged {
    _$loggedAtom.reportRead();
    return super.logged;
  }

  @override
  set logged(bool value) {
    _$loggedAtom.reportWrite(value, super.logged, () {
      super.logged = value;
    });
  }

  final _$newTransactionAtom = Atom(name: 'GlobalStoreBase.newTransaction');

  @override
  Transaction? get newTransaction {
    _$newTransactionAtom.reportRead();
    return super.newTransaction;
  }

  @override
  set newTransaction(Transaction? value) {
    _$newTransactionAtom.reportWrite(value, super.newTransaction, () {
      super.newTransaction = value;
    });
  }

  final _$originAccountSelectedAtom =
      Atom(name: 'GlobalStoreBase.originAccountSelected');

  @override
  Account? get originAccountSelected {
    _$originAccountSelectedAtom.reportRead();
    return super.originAccountSelected;
  }

  @override
  set originAccountSelected(Account? value) {
    _$originAccountSelectedAtom.reportWrite(value, super.originAccountSelected,
        () {
      super.originAccountSelected = value;
    });
  }

  final _$currencySelectedAtom = Atom(name: 'GlobalStoreBase.currencySelected');

  @override
  String get currencySelected {
    _$currencySelectedAtom.reportRead();
    return super.currencySelected;
  }

  @override
  set currencySelected(String value) {
    _$currencySelectedAtom.reportWrite(value, super.currencySelected, () {
      super.currencySelected = value;
    });
  }

  final _$amountSelectedAtom = Atom(name: 'GlobalStoreBase.amountSelected');

  @override
  double get amountSelected {
    _$amountSelectedAtom.reportRead();
    return super.amountSelected;
  }

  @override
  set amountSelected(double value) {
    _$amountSelectedAtom.reportWrite(value, super.amountSelected, () {
      super.amountSelected = value;
    });
  }

  final _$GlobalStoreBaseActionController =
      ActionController(name: 'GlobalStoreBase');

  @override
  void setCurrentPosition(Position position) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setCurrentPosition');
    try {
      return super.setCurrentPosition(position);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPlacemark(Placemark placemark) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setCurrentPlacemark');
    try {
      return super.setCurrentPlacemark(placemark);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentWeather(Weather weather) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setCurrentWeather');
    try {
      return super.setCurrentWeather(weather);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserAccounts(List<Account> accounts) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setUserAccounts');
    try {
      return super.setUserAccounts(accounts);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOriginAccountSelected(Account origin) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setOriginAccountSelected');
    try {
      return super.setOriginAccountSelected(origin);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrencySelected(String selected) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setCurrencySelected');
    try {
      return super.setCurrencySelected(selected);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmountSelected(double selected) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setAmountSelected');
    try {
      return super.setAmountSelected(selected);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewFakeTransaction(TransactionModel transaction) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.addNewFakeTransaction');
    try {
      return super.addNewFakeTransaction(transaction);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(String _user) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setUser');
    try {
      return super.setUser(_user);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String _password) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setPassword');
    try {
      return super.setPassword(_password);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login() {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.login');
    try {
      return super.login();
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPosition: ${currentPosition},
currentPlacemark: ${currentPlacemark},
currentWeather: ${currentWeather},
userAccounts: ${userAccounts},
fakeTransactions: ${fakeTransactions},
user: ${user},
password: ${password},
logged: ${logged},
newTransaction: ${newTransaction},
originAccountSelected: ${originAccountSelected},
currencySelected: ${currencySelected},
amountSelected: ${amountSelected}
    ''';
  }
}
