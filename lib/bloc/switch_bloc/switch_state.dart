part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool isEnableOrDisable;

  SwitchState({this.isEnableOrDisable = false});

  SwitchState copyWith({bool? isEnableOrDisable}){
    return SwitchState(
      isEnableOrDisable: isEnableOrDisable ?? this.isEnableOrDisable
    );
  }

  @override
  List<Object> get props => [];
}

