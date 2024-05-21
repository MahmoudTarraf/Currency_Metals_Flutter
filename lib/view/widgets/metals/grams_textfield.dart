// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/data/cubit/state_change_cubit.dart';

/*
  رودينة نعمان سلطان
*/
class GramsTextField extends StatelessWidget {
  GramsTextField({
    super.key,
  });
  String _gramsTextField = '';
  Widget _enterGramsTextField(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 350,

        // padding: const EdgeInsets.all(5),
        child: TextFormField(
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Grams must\'nt be empty!';
            }
            return null;
          },
          onSaved: (value) {
            _gramsTextField = value as String;
            context.read<StateChangeCubit>().setGramsAAmount(_gramsTextField);
          },
          decoration: const InputDecoration(
            icon: Icon(
              Icons.numbers,
              color: Colors.amber,
            ),
            hintText: 'Enter Grams Amount',
            hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _enterGramsTextField(context);
  }
}
