// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/cubit/state_change_cubit.dart';

/*
  يمان عبد الجبار ابو خليل
*/
class RareItems extends StatelessWidget {
  final double width;
  final bool showGradient;
  final String a;
  RareItems({
    super.key,
    required this.showGradient,
    required this.width,
    required this.a,
  });

  String name = 'Gold';
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
                  Colors.black,
                  Colors.blue,
                  Color.fromARGB(255, 9, 59, 100),
                ],
                begin: Alignment.topLeft,
              )
            : null,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<String>(
        dropdownColor: const Color.fromARGB(255, 80, 78, 66),
        borderRadius: BorderRadius.circular(15),
        isExpanded: true,
        underline: Container(),
        alignment: Alignment.center,
        value: a,
        onChanged: (String? newValue) =>
            context.read<StateChangeCubit>().changeName(newValue!),
        items: <String>[
          'Gold',
          'Silver',
          'Platinum',
          'Palladium',
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
