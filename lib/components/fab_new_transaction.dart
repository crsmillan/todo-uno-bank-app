import 'package:bankapp/pages/new_transaction_page.dart';
import 'package:flutter/material.dart';

class FABNewTransaction extends StatelessWidget {
  const FABNewTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.attach_money),
      heroTag: 'New Transaction',
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NewTransactionPage(),
          ),
        );
      },
    );
  }
}
