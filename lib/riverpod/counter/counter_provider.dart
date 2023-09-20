import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_state.dart';

class CounterProvider extends StateNotifier<CounterState> {
  CounterProvider()
      : super(const CounterState(
            counter: 0, counterOne: 0, counterTwo: 0, counterThree: 0));

  void incrementCounter() {
    int value = state.counter ?? 0;
    state = state.copyWith(counter: value + 1);
  }

  void decrementCounter() {
    int value = state.counter ?? 0;
    state = state.copyWith(counter: value - 1);
  }

  void incrementCounterOne() {
    int value = state.counterOne ?? 0;
    state = state.copyWith(counterOne: value + 1);
  }

  void decrementCounterOne() {
    int value = state.counterOne ?? 0;
    state = state.copyWith(counterOne: value - 1);
  }

  void incrementCounterTwo() {
    int value = state.counterTwo ?? 0;
    state = state.copyWith(counterTwo: value + 1);
  }

  void decrementCounterTwo() {
    int value = state.counterTwo ?? 0;
    state = state.copyWith(counterTwo: value - 1);
  }

  void incrementCounterThree() {
    int value = state.counterThree ?? 0;
    state = state.copyWith(counterThree: value + 1);
  }

  void decrementCounterThree() {
    int value = state.counterThree ?? 0;
    state = state.copyWith(counterThree: value - 1);
  }
}
