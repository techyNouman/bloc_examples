import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_examples/bloc/timer_bloc/ticker.dart';
import 'package:bloc_examples/bloc/timer_bloc/timer_event.dart';
import 'package:bloc_examples/bloc/timer_bloc/timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const _duration = 0;

  /// counting down from 30

  /// to listen to the ticker stream
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,

  /// we have to specify the initial stage
        super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    /// In case of there is an subscription exists, we have to cancel it
    _tickerSubscription?.cancel();

    /// triggers the TimerRunInProgress state
    emit(TimerRunInProgress(event.duration));

    /// makes the subscription listen to TimerTicked state
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTicked(duration)));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(event.duration > 0
        ? TimerRunInProgress(event.duration)

    /// triggers the TimerRunInProgress state
        : const TimerRunComplete());

    /// triggers TimerRunComplete state
  }

}