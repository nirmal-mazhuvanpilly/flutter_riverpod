import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_provider.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_state.dart';

final counterGlobalProvider =
    StateNotifierProvider<CounterProvider, CounterState>((ref) {
  return CounterProvider();
});
