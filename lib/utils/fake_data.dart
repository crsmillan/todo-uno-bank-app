import 'package:bankapp/domain/models/account_model.dart';
import 'package:bankapp/mobx/helper.dart';

class FakeData {
  createFakeAccounts() {
    List<Account> accounts = <Account>[
      Account(
        accountType: AccountType.Corriente,
        id: 234567890,
        balance: 456.087,
        currency: Currency.USD,
      ),
      Account(
        accountType: AccountType.Ahorro,
        id: 367890,
        balance: 28456.087,
        currency: Currency.MXN,
      ),
      Account(
        accountType: AccountType.Ahorro,
        id: 367890,
        balance: 344326.38,
        currency: Currency.COP,
      ),
    ];
    Store.global.setUserAccounts(accounts);
  }
}
