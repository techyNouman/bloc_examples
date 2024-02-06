part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool isEnableOrDisable;
  double sliderValue;

  SwitchState({this.isEnableOrDisable = false,
  this.sliderValue = 1});

  SwitchState copyWith({bool? isEnableOrDisable,
  double? sliderValue}){
    return SwitchState(
      isEnableOrDisable: isEnableOrDisable ?? this.isEnableOrDisable,
        sliderValue: sliderValue ?? this.sliderValue
    );
  }

  @override
  List<Object> get props => [isEnableOrDisable, sliderValue];
}

