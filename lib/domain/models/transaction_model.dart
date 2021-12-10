// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:bankapp/domain/models/account_model.dart';

enum TransanctionType { INCOME, WITHDRAW, TRANSFER }

abstract class Transaction implements TransactionModel {}

class TransactionModel {
  final int id;
  final double amount;
  final Currency currency;
  final int originAccount;
  final int destinyAccount;
  final DateTime dateTime;
  final TransanctionType transactionType;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.currency,
    required this.originAccount,
    required this.destinyAccount,
    required this.dateTime,
    required this.transactionType,
  });

  TransactionModel copyWith({
    int? id,
    double? amount,
    Currency? currency,
    int? originAccount,
    int? destinyAccount,
    DateTime? dateTime,
    TransanctionType? transactionType,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      originAccount: originAccount ?? this.originAccount,
      destinyAccount: destinyAccount ?? this.destinyAccount,
      dateTime: dateTime ?? this.dateTime,
      transactionType: transactionType ?? this.transactionType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'currency': currency,
      'originAccount': originAccount,
      'destinyAccount': destinyAccount,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'transactionType': transactionType,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id']?.toInt() ?? 0,
      amount: map['amount']?.toDouble() ?? 0.0,
      currency: map['currency'],
      originAccount: map['originAccount']?.toInt() ?? 0,
      destinyAccount: map['destinyAccount']?.toInt() ?? 0,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      transactionType: map['transactionType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(id: $id, amount: $amount, currency: $currency, originAccount: $originAccount, destinyAccount: $destinyAccount, dateTime: $dateTime, transactionType: $transactionType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.id == id &&
        other.amount == amount &&
        other.currency == currency &&
        other.originAccount == originAccount &&
        other.destinyAccount == destinyAccount &&
        other.dateTime == dateTime &&
        other.transactionType == transactionType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        currency.hashCode ^
        originAccount.hashCode ^
        destinyAccount.hashCode ^
        dateTime.hashCode ^
        transactionType.hashCode;
  }
}
