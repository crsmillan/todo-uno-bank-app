// ignore_for_file: prefer_const_constructors

import 'package:bankapp/domain/models/account_model.dart';
import 'package:bankapp/domain/models/transaction_model.dart';
import 'package:bankapp/mobx/helper.dart';
import 'package:bankapp/utils/general.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final Account account;
  const TransactionList({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CircleAvatar leading(Icon icon) {
      return CircleAvatar(child: icon);
    }

    return Expanded(
      child: ListView.builder(
        itemCount: Store.global.fakeTransactions.length,
        itemBuilder: (BuildContext context, int index) {
          TransactionModel transaction = Store.global.fakeTransactions[index];
          String _type;
          Icon _icon;
          String _currency =
              CurrencyFormater.getCurrency(account.currency);

          switch (transaction.transactionType) {
            case TransanctionType.TRANSFER:
              _type = 'Transfer';
              _icon = Icon(Icons.chevron_right);
              break;
            case TransanctionType.WITHDRAW:
              _type = 'Withdraw';
              _icon = Icon(Icons.arrow_downward);
              break;
            case TransanctionType.INCOME:
              _type = 'Income';
              _icon = Icon(Icons.arrow_upward);
              break;
            default:
              _type = 'Unknown';
              _icon = Icon(Icons.arrow_upward);
              break;
          }

          return ListTile(
            leading: leading(_icon),
            title: Text(_type),
            subtitle: Text(transaction.dateTime.toIso8601String()),
            trailing: Text('\$ ${transaction.amount} ' + _currency),
            onTap: (){},
          );
        },
      ),
    );
  }
}
