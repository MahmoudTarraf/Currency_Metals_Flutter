// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/cubit/currency_cubit.dart';
import 'package:homework/data/cubit/metals_cubit.dart';
import 'package:homework/data/cubit/state_change_cubit.dart';
import 'package:homework/view/widgets/metals/metal_converter.dart';
import 'package:homework/view/widgets/metals/metal_dropdown.dart';
import 'package:homework/view/widgets/metals/metals_helper.dart';

/*
  عمار حسن حسن
*/
class MetalScreen extends StatelessWidget {
  const MetalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              context.read<MetalsCubit>().fetchMetalPrices();
            },
            child: const Icon(
              Icons.currency_exchange,
            )),
        title: const Text('Metals Convertor'),
      ),
      body: BlocBuilder<MetalsCubit, MetalsState>(
        builder: (context, state) {
          if (state is MetalsReady) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          } else if (state is MetalsFetchingSuccessfully) {
            final metals = state.metals;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Prices (Gram) :',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 24,
                        ),
                      ),
                      BlocBuilder<StateChangeCubit, String>(
                        builder: (context, state) {
                          return MetalDropDown(
                            a: context.read<StateChangeCubit>().p,
                            showGradient: true,
                            width: 180,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 350,
                    child: BlocBuilder<StateChangeCubit, String>(
                      builder: (context, state) {
                        return MetalHelper(
                          theseMetals: metals,
                          price: context.read<StateChangeCubit>().p,
                        );
                      },
                    ),
                  ),
                  const Divider(color: Colors.amber, height: 5),
                  MetalConverter(
                    currencies: context.read<CurrencyCubit>().currenciesModel,
                  ),
                ],
              ),
            );
          } else if (state is MetalsFetchingUnSuccessfully) {
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
