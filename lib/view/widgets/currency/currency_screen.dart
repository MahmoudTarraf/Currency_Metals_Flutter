import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/cubit/currency_cubit.dart';
import 'package:homework/view/widgets/currency/conversion_card.dart';

/*
  عمار حسن حسن
*/
class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.read<CurrencyCubit>().fetchData(),
          child: const Icon(
            Icons.currency_exchange,
          ),
        ),
        title: const Text('Currency Convertor'),
      ),
      body: BlocBuilder<CurrencyCubit, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyReady) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          } else if (state is CurrencyFetchingSuccessfully) {
            return ConversionCard(
              rates: state.ratesModel,
              currencies: state.currenciesModel,
            );
          } else if (state is CurrencyFetchingUnSuccessfully) {
            return Center(
              child: Text(
                state.errorExp,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.amber,
                ),
              ),
            );
          }
          return const Text("Unrecognized state yet!");
        },
      ),
    );
  }
}
