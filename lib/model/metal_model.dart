// ignore_for_file: non_constant_identifier_names
/*
  بتول أكرم سلوم
*/
class Metal {
  final String symbol;
  final double price_gram_10k;
  final double price_gram_14k;
  final double price_gram_16k;
  final double price_gram_18k;
  final double price_gram_20k;
  final double price_gram_21k;
  final double price_gram_22k;
  final double price_gram_24k;

  Metal({
    required this.price_gram_10k,
    required this.price_gram_14k,
    required this.price_gram_16k,
    required this.price_gram_18k,
    required this.price_gram_20k,
    required this.price_gram_21k,
    required this.price_gram_22k,
    required this.price_gram_24k,
    required this.symbol,
  });

  @override
  String toString() => '$symbol: \$${price_gram_24k.toStringAsFixed(2)}';
}
