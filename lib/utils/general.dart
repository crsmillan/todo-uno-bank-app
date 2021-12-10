import 'package:bankapp/domain/models/account_model.dart';
import 'package:intl/intl.dart';

class CurrencyFormater {
  static final f = NumberFormat("###,###.0#");

  static String getAccountType(AccountType accountType) {
    switch (accountType) {
      case AccountType.Corriente:
        return 'Cuenta Corriente';

      case AccountType.Ahorro:
        return 'Cuenta de Ahorro';

      default:
        return 'UNKNOWN';
    }
  }

  static String getCurrency(Currency currency) {
    switch (currency) {
      case Currency.USD:
        return 'USD';

      case Currency.MXN:
        return 'MXN';

      default:
        return 'UNKNOWN';
    }
  }
}
