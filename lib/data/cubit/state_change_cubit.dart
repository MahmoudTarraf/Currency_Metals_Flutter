import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'state_change_state.dart';

/*
  محمد علي صبيح
*/
class StateChangeCubit extends Cubit<String> {
  StateChangeCubit() : super('');
  String p = 'Price gram (10k)';
  String name = 'Gold';
  String gramsAmount = '0.0';
  void change(String val) {
    p = val;

    emit(p);
  }

  void changeName(String val) {
    name = val;

    emit(name);
  }

  void setGramsAAmount(String amount) {
    gramsAmount = amount;
    emit(gramsAmount);
  }
}
