import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
   on<EnableOrDisableNotification>(_enableOrDisableNotification);
   on<ScrollSlider>(_scrollSlider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchState> emit){
    emit(state.copyWith(isEnableOrDisable: !state.isEnableOrDisable));
  }
  void _scrollSlider(ScrollSlider event, Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
