import 'package:intl/intl.dart';

class FormatRupiah{
  static String convertToIdr(dynamic number){
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2
    );
    return currencyFormatter.format(number);
  }
}