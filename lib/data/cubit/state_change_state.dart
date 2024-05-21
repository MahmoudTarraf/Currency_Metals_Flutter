part of 'state_change_cubit.dart';

/*
  محمد علي صبيح
*/
sealed class StateChangeState extends Equatable {
  const StateChangeState();

  @override
  List<Object> get props => [];
}

final class StateChangeInitial extends StateChangeState {}
