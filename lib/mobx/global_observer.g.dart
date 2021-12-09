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
  String toString() {
    return '''
currentPosition: ${currentPosition},
currentPlacemark: ${currentPlacemark},
currentWeather: ${currentWeather}
    ''';
  }
}
