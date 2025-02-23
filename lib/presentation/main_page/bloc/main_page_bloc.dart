import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageState.initial()) {
    on<MainPageEventOnIncreaseCounter>(_onIncreaseCounter);
    on<MainPageEventOnIncreaseSecondCounter>(_onIncreaseSecondCounter);
    on<MainPageEventOnText>(_onText);
  }

  FutureOr<void> _onIncreaseCounter(
      MainPageEventOnIncreaseCounter event, Emitter<MainPageState> emit) {
    int counter = state.counter;
    emit(state.copyWith(counter: counter + 1));
  }

  FutureOr<void> _onIncreaseSecondCounter(
      MainPageEventOnIncreaseSecondCounter event, Emitter<MainPageState> emit) {
    int counter = state.secondCounter;
    emit(state.copyWith(secondCounter: counter + 1));
  }

  FutureOr<void> _onText(
      MainPageEventOnText event, Emitter<MainPageState> emit) {
    
    emit(state.copyWith(text: event.text));
  }
}
