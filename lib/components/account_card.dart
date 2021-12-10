import 'package:bankapp/domain/models/account_model.dart';
import 'package:bankapp/pages/account_details.dart';
import 'package:bankapp/utils/general.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final Account account;
  const AccountCard({Key? key, required this.account}) : super(key: key);

  void onCardTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AccountDetailsPage(
          account: account,
        ),
      ),
    );
  }

  /// The size of that widget is resposability of who contains
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => onCardTapped(context),
        child: Card(
          color: Colors.greenAccent,
          elevation: 8.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(CurrencyFormater.getAccountType(account.accountType)),
                    Text(account.id.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CurrencyFormater.f.format(account.balance),
                      style: const TextStyle(
                        fontSize: 38.0,
                      ),
                    ),
                    Text(CurrencyFormater.getCurrency(account.currency))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
