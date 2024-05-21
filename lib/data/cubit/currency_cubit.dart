import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homework/model/rates_model.dart';
import 'package:homework/model/currencies_model.dart';
import 'package:homework/res/app_url.dart';
import 'package:http/http.dart' as http;
part 'currency_state.dart';

/*
  هيا سمير شويط
*/
class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyInitial());
  late RatesModel ratesModel = RatesModel(
    disclaimer: '',
    license: '',
    timestamp: 0,
    base: '',
    rates: {},
  );
  Map currenciesModel = {};
  Future<void> fetchData() async {
    emit(CurrencyReady());
    try {
      await fetchRates();
      await fetchCurrencies();
      emit(
        CurrencyFetchingSuccessfully(
          currenciesModel: currenciesModel,
          ratesModel: ratesModel,
        ),
      );
    } catch (e) {
      emit(const CurrencyFetchingUnSuccessfully(
          errorExp: 'No Internet\n\nturn on Wi-Fi'));
    }
  }

  Future<void> fetchRates() async {
    var response = await http.get(Uri.parse(AppUrl.ratesUrl));
    final temp = ratesModelFromJson(response.body);
    ratesModel = temp;
  }

  Future<void> fetchCurrencies() async {
    var response = await http.get(Uri.parse(AppUrl.currenciesUrl));
    final temp2 = allCurrenciesFromJson(response.body);
    currenciesModel = temp2;
  }
}
