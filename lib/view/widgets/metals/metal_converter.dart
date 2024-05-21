import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/cubit/currency_cubit.dart';
import 'package:homework/data/cubit/metals_cubit.dart';
import 'package:homework/data/cubit/state_change_cubit.dart';
import 'package:homework/utils/utils.dart';
import 'package:homework/view/widgets/currency/dropdown_row.dart';
import 'package:homework/view/widgets/metals/grams_textfield.dart';
import 'package:homework/view/widgets/metals/metal_dropdown.dart';
import 'package:homework/view/widgets/metals/rare_items.dart';

class MetalConverter extends StatefulWidget {
  final Map currencies;
  const MetalConverter({
    super.key,
    required this.currencies,
  });

  @override
  State<MetalConverter> createState() => _MetalConverterState();
}

/*
  رودينة نعمان سلطان
*/

class _MetalConverterState extends State<MetalConverter> {
  String dropdownValue2 = 'PKR';
  String price = 'price_gram_10k';
  void setPrice(String p) {
    setState(() {
      price = p;
    });
  }

  final GlobalKey<FormFieldState> formFieldKey = GlobalKey();
  String conversion = '';

  double getName(String name, String karat) {
    var sample = 'XAU';
    switch (name) {
      case "Gold":
        sample = 'XAU';
      case "Silver":
        sample = 'XAG';
      case "Platinum":
        sample = 'XPT';
      case "Palladium":
        sample = 'XPD';
    }

    final item = context
        .read<MetalsCubit>()
        .allMetals
        .firstWhere((element) => element.symbol == sample);
    switch (karat) {
      case "Price gram (10k)":
        return item.price_gram_10k;
      case "Price gram (14k)":
        return item.price_gram_14k;
      case "Price gram (16k)":
        return item.price_gram_16k;
      case "Price gram (18k)":
        return item.price_gram_18k;
      case "Price gram (20k)":
        return item.price_gram_20k;
      case "Price gram (21k)":
        return item.price_gram_21k;
      case "Price gram (22k)":
        return item.price_gram_22k;
      case "Price gram (24k)":
        return item.price_gram_24k;
    }
    return 0.0;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndConvert({
    // required String gramP,
    required String name,
    required String karat,
  }) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    double thisGramsAmount =
        double.parse(context.read<StateChangeCubit>().gramsAmount);
    final cList = context.read<CurrencyCubit>().ratesModel.rates;
    final temp = getName(name, karat);
    final k = Utils.convertMetal(
      amount: thisGramsAmount,
      currencyBase: 'USD',
      currencyFinal: dropdownValue2,
      exchangeRates: cList,
      priceKarat: temp,
    );
    String result =
        "$thisGramsAmount $name $karat in USD = $k in $dropdownValue2";
    setState(() {
      conversion = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Convert & Calculate :',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: GramsTextField(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocBuilder<StateChangeCubit, String>(
                    builder: (context, state) {
                      return RareItems(
                        a: context.read<StateChangeCubit>().name,
                        showGradient: false,
                        width: 150,
                      );
                    },
                  ),
                  BlocBuilder<StateChangeCubit, String>(
                    builder: (context, state) {
                      return MetalDropDown(
                        a: context.read<StateChangeCubit>().p,
                        showGradient: false,
                        width: 180,
                      );
                    },
                  ),
                ],
              ),
              DropdownRow(
                label: 'To:',
                value: dropdownValue2,
                currencies: widget.currencies,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue2 = newValue!;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _validateAndConvert(
                        name: context.read<StateChangeCubit>().name,
                        karat: context.read<StateChangeCubit>().p,
                      );
                    },
                    child: const Text(
                      'Convert',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: Center(
                  child: Text(
                    conversion,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
