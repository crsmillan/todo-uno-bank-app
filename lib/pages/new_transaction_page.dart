import 'dart:io';
import 'dart:math';
import 'package:bankapp/components/app_bar.dart';
import 'package:bankapp/domain/models/account_model.dart';
import 'package:bankapp/domain/models/transaction_model.dart';
import 'package:bankapp/mobx/helper.dart';
import 'package:bankapp/pages/account_details.dart';
import 'package:bankapp/utils/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({Key? key}) : super(key: key);

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  int _index = 0;

  int getRandormNumber() {
    Random rng = Random();
    return rng.nextInt(1000);
  }

  void createNewTransaction(BuildContext context) {
    final TransactionModel transaction = TransactionModel(
      id: getRandormNumber(),
      amount: Store.global.amountSelected,
      currency: CurrencyFormater.setCurrency(Store.global.currencySelected),
      originAccount: Store.global.originAccountSelected!.id,
      destinyAccount: Store.global.originAccountSelected!.id,
      transactionType: TransanctionType.TRANSFER,
      dateTime: DateTime.now(),
    );

    Store.global.addNewFakeTransaction(transaction);
    displayQR(context, transaction);
  }

  Future<String> createNSaveQR(TransactionModel transaction) async {
    ByteData? qrBytes = await QrPainter(
      data: transaction.toString(),
      color: Colors.black,
      emptyColor: Colors.white,
      version: QrVersions.auto,
    ).toImageData(878);

    final buffer = qrBytes!.buffer;

    // getting a directory path for saving
    final Directory path = await getApplicationDocumentsDirectory();
    final String fpath =
        join(path.path, "transaction_${transaction.dateTime.toString()}.jpeg");

    //save the orignal image
    File(fpath).writeAsBytes(
        buffer.asUint8List(qrBytes.offsetInBytes, qrBytes.lengthInBytes));

    return fpath;
  }

  void displayQR(BuildContext context, TransactionModel transaction) {
    QrImage qr = QrImage(
      data: transaction.toString(),
      version: QrVersions.auto,
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Transaction Created', textAlign: TextAlign.center),
          content: SizedBox(
            width: 300,
            height: 300,
            child: Center(
              child: qr,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  List<String> paths = <String>[];
                  String qr = await createNSaveQR(transaction);
                  paths.add(qr);
                  Share.shareFiles(paths);
                },
                child: const Text('Share')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => AccountDetailsPage(
                        account: Store.global.originAccountSelected!,
                      ),
                    ),
                  );
                  cleanVariables();
                },
                child: const Text('Confirm')),
          ],
        );
      },
    );
  }

  void cleanVariables() {
    // Store.global.setOriginAccountSelected()
  }

  @override
  Widget build(BuildContext context) {
    onStepCancel() {
      if (_index != 0) {
        setState(() => _index -= 1);
      }
    }

    onStepContinue() {
      if (_index < _Stepper()._steps.length) {
        switch (_index) {
          case 0:
            if (Store.global.originAccountSelected != null) {
              setState(() => _index += 1);
            }
            break;
          case 1:
            if (Store.global.amountSelected > 0.0) {
              setState(() => _index += 1);
            }

            break;
          case 2:
            createNewTransaction(context);
            break;
          default:
        }
      }
    }

    return Scaffold(
      appBar: const AppBarComponet(title: 'New Transaction'),
      body: Observer(
        builder: (context) {
          return Stepper(
            currentStep: _index,
            steps: _Stepper()._steps,
            onStepContinue: () => onStepContinue(),
            onStepCancel: () => onStepCancel(),
          );
        },
      ),
    );
  }
}

class _Stepper {
  final List<Step> _steps = <Step>[
    Step(
      title: const Text('Select origin account'),
      content: Column(
        children: <Widget>[
          const Text(''),
          Observer(builder: (context) {
            if (Store.global.userAccounts.isNotEmpty) {
              return DropdownButton<dynamic>(
                hint: Observer(builder: (context) {
                  return Text(
                      Store.global.originAccountSelected?.id.toString() ?? '');
                }),
                items: Store.global.userAccounts
                    .map<DropdownMenuItem>((Account account) {
                  return DropdownMenuItem<Account>(
                    value: account,
                    child: Text(
                        '${CurrencyFormater.getCurrency(account.currency)} ·s \$ ${account.balance}'),
                  );
                }).toList(),
                onChanged: (value) {
                  Store.global.setOriginAccountSelected(value);
                },
              );
            }

            return const CircularProgressIndicator();
          })
        ],
      ),
    ),
    Step(
      title: const Text('Select amount & currency'),
      content: Observer(
        builder: (context) {
          return Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.40,
                padding: const EdgeInsets.only(right: 10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (String? val) {
                    Store.global
                        .setAmountSelected(double.tryParse(val!) ?? 0.0);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Amount',
                  ),
                ),
              ),
              DropdownButton<String?>(
                hint: Observer(builder: (_) {
                  return Text(
                    Store.global.currencySelected,
                  );
                }),
                items: ['USD', 'COP'].map((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (String? value) {
                  Store.global.setCurrencySelected(value!);
                },
              )
            ],
          );
        },
      ),
    ),
    Step(
      title: const Text('Confirmar y generar QR'),
      content: Observer(
        builder: (context) {
          if (Store.global.originAccountSelected != null) {
            return Column(
              children: [
                Row(
                  children: [
                    const Text('Account: '),
                    Text(Store.global.originAccountSelected?.id.toString() ??
                        ''),
                  ],
                ),
                Row(
                  children: [
                    const Text('Balance: '),
                    Text(Store.global.originAccountSelected?.balance
                            .toString() ??
                        'err'),
                    Text(' ' +
                        CurrencyFormater.getCurrency(
                            Store.global.originAccountSelected!.currency)),
                  ],
                ),
                Row(
                  children: [
                    const Text('Amount: '),
                    Text(Store.global.amountSelected.toString()),
                    Text(' ${Store.global.currencySelected}'),
                  ],
                ),
              ],
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    ),
  ];
}
