part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent{}

class ScrollSlider extends SwitchEvent{
  double sliderValue;

  ScrollSlider({required this.sliderValue});

  @override
  List<Object> get props => [sliderValue];

}


