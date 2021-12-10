import 'package:bankapp/components/account_card.dart';
import 'package:bankapp/components/app_bar.dart';
import 'package:bankapp/components/section.dart';
import 'package:bankapp/components/transactions_list.dart';
import 'package:bankapp/domain/models/account_model.dart';
import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  final Account account;
  const AccountDetailsPage({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponet(title: 'Account Details'),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: AccountCard(account: account),
          ),
          const AppSectionTitle(title: 'Transactions'),

          TransactionList(account: account)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.attach_money),
        heroTag: 'New Transaction',
        onPressed: () {},
      ),
    );
  }
}
