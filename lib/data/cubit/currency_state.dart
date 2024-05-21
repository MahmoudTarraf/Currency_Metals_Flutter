// ignore_for_file: must_be_immutable

part of 'currency_cubit.dart';

/*
  هيا سمير شويط
*/
sealed class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyReady extends CurrencyState {}

final class CurrencyFetchingSuccessfully extends CurrencyState {
  final RatesModel ratesModel;
  final Map currenciesModel;
  const CurrencyFetchingSuccessfully(
      {required this.currenciesModel, required this.ratesModel});
}

final class CurrencyFetchingUnSuccessfully extends CurrencyState {
  final String errorExp;

  const CurrencyFetchingUnSuccessfully({required this.errorExp});
}
