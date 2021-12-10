// ignore_for_file: constant_identifier_names

import 'dart:convert';

enum AccountType {
  Corriente,
  Ahorro
}
enum Currency {
  USD, MXN
}

class Account {

  final AccountType accountType;
  final int id;
  final double balance;
  final Currency currency;

  Account({
    required this.accountType,
    required this.id,
    required this.balance,
    required this.currency,
  });

  Account copyWith({
    AccountType? accountType,
    int? id,
    double? balance,
    Currency? currency,
  }) {
    return Account(
      accountType: accountType ?? this.accountType,
      id: id ?? this.id,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accountType': accountType.toMap(),
      'id': id,
      'balance': balance,
      'currency': currency.toMap(),
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountType: AccountType.fromMap(map['accountType']),
      id: map['id']?.toInt() ?? 0,
      balance: map['balance']?.toDouble() ?? 0.0,
      currency: Currency.fromMap(map['currency']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Account(accountType: $accountType, id: $id, balance: $balance, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Account &&
      other.accountType == accountType &&
      other.id == id &&
      other.balance == balance &&
      other.currency == currency;
  }

  @override
  int get hashCode {
    return accountType.hashCode ^
      id.hashCode ^
      balance.hashCode ^
      currency.hashCode;
  }
}
