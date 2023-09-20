import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_provider.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_state.dart';

class CounterScopedView extends StatelessWidget {
  final StateNotifierProvider<CounterProvider, CounterState> counterProvider;
  final int? selectedCounter;
  const CounterScopedView(
      {super.key,
      required this.counterProvider,
      required this.selectedCounter});

  int? selectedValue(CounterState state) {
    switch (selectedCounter) {
      case 1:
        return state.counterOne;
      case 2:
        return state.counterTwo;
      case 3:
        return state.counterThree;
      default:
        return state.counter;
    }
  }

  void selectedIncrementMethod(WidgetRef ref) {
    final value = ref.read(counterProvider.notifier);
    switch (selectedCounter) {
      case 1:
        value.incrementCounterOne();
        break;
      case 2:
        value.incrementCounterTwo();
        break;
      case 3:
        value.incrementCounterThree();
        break;
    }
  }

  void selectedDecrementMethod(WidgetRef ref) {
    final value = ref.read(counterProvider.notifier);
    switch (selectedCounter) {
      case 1:
        value.decrementCounterOne();
        break;
      case 2:
        value.decrementCounterTwo();
        break;
      case 3:
        value.decrementCounterThree();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, child) {
                log("Scoped View rebuilds");
                final value = ref.watch(
                    counterProvider.select((value) => selectedValue(value)));
                return Text(
                  value.toString(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                );
              }),
              Consumer(builder: (context, ref, child) {
                log("Scoped Row rebuilds");

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          selectedDecrementMethod(ref);
                        },
                        child: const Text("-")),
                    TextButton(
                        onPressed: () {
                          selectedIncrementMethod(ref);
                        },
                        child: const Text("+")),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
