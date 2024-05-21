/*
  بتول أكرم سلوم
*/
class Utils {
  static String convert(
    Map exchangeRates,
    String amount,
    String currencyBase,
    String currencyFinal,
  ) {
    double usdAmount = double.parse(amount) / exchangeRates[currencyBase];
    String output =
        (usdAmount * exchangeRates[currencyFinal]).toStringAsFixed(2);
    return output;
  }

  static String convertMetal({
    required Map exchangeRates,
    required double amount,
    required String currencyBase,
    required String currencyFinal,
    required double priceKarat,
  }) {
    double usdAmount = amount / exchangeRates[currencyBase];
    String output = (usdAmount * exchangeRates[currencyFinal] * priceKarat)
        .toStringAsFixed(2);
    return output;
  }
}
