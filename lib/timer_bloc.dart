import 'dart:async';

import 'package:cubitbloc/ticker.dart';
import 'package:cubitbloc/timer_event.dart';
import 'package:cubitbloc/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int _duration = 60;
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
    : _ticker = ticker,
      super(TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerTicked>(_onTicked);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emitter) {
    emitter(TimerRunInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((durationValue) => add(TimerTicked(duration: durationValue)));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emitter) {
    emitter(event.duration > 0 ? TimerRunInProgress(event.duration) : TimerRunComplete());
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emitter) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emitter(TimerRunPause(state.duration));
    }
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emitter) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emitter(TimerRunInProgress(state.duration));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emitter) {
    _tickerSubscription?.cancel();
    emitter(const TimerInitial(_duration));
  }
}
