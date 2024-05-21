// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/cubit/state_change_cubit.dart';

/*
  معاذ سليمان محسن
*/
class MetalDropDown extends StatelessWidget {
  final String a;
  final double width;
  final bool showGradient;
  const MetalDropDown({
    super.key,
    required this.showGradient,
    required this.width,
    required this.a,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 70,
      padding: const EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        gradient: showGradient
            ? const LinearGradient(
                colors: [
                  Colors.yellow,
                  Colors.black,
                  Colors.black12,
                ],
                begin: Alignment.topLeft,
              )
            : null,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<String>(
        dropdownColor: const Color.fromARGB(255, 88, 87, 74),
        borderRadius: BorderRadius.circular(15),
        isExpanded: true,
        underline: Container(),
        alignment: Alignment.center,
        value: a,
        onChanged: (String? newValue) =>
            context.read<StateChangeCubit>().change(newValue!),
        items: <String>[
          'Price gram (10k)',
          'Price gram (14k)',
          'Price gram (16k)',
          'Price gram (18k)',
          'Price gram (20k)',
          'Price gram (21k)',
          'Price gram (22k)',
          'Price gram (24k)',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
