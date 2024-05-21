import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homework/model/metal_model.dart';

part 'metals_state.dart';

/*
  محمود مازن طراف
*/
class MetalsCubit extends Cubit<MetalsState> {
  MetalsCubit() : super(MetalsInitial());
  List<Metal> allMetals = [];
  Future<List<Metal>> fetchMetalPrices() async {
    List<Metal> theseMetals = [];
    final metals = ['XAU', 'XAG', 'XPT', 'XPD']; // List of metal symbols
    emit(MetalsReady());
    theseMetals = await Future.wait(
        metals.map((metal) => _fetchMetalPrice(metal)).toList());
    allMetals = theseMetals;

    emit(
      MetalsFetchingSuccessfully(
        metals: theseMetals,
      ),
    );

    return theseMetals;
  }

  Future<Metal> _fetchMetalPrice(String symbol) async {
    final url = Uri.parse('https://www.goldapi.io/api/$symbol/USD');
    final response = await http
        .get(url, headers: {'x-access-token': 'goldapi-5k6nslwgndg2v-io'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Metal(
        symbol: symbol,
        price_gram_10k: data['price_gram_10k'],
        price_gram_14k: data['price_gram_14k'],
        price_gram_16k: data['price_gram_16k'],
        price_gram_18k: data['price_gram_18k'],
        price_gram_20k: data['price_gram_20k'],
        price_gram_21k: data['price_gram_21k'],
        price_gram_22k: data['price_gram_22k'],
        price_gram_24k: data['price_gram_24k'],
      );
    } else {
      emit(
        MetalsFetchingUnSuccessfully(
          errorExp: response.reasonPhrase.toString(),
        ),
      );
      throw Exception(
          'Failed to fetch price for $symbol (code: ${response.statusCode})');
    }
  }
}
