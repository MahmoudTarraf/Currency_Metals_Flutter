part of 'metals_cubit.dart';

abstract class MetalsState extends Equatable {
  const MetalsState();

  @override
  List<Object?> get props => [];
}

class MetalsInitial extends MetalsState {}

class MetalsReady extends MetalsState {}

/*
  محمود مازن طراف
*/
class MetalsFetchingSuccessfully extends MetalsState {
  final List<Metal> metals;

  const MetalsFetchingSuccessfully({
    required this.metals,
  });
}

class MetalsFetchingUnSuccessfully extends MetalsState {
  final String errorExp;

  const MetalsFetchingUnSuccessfully({required this.errorExp});
}
