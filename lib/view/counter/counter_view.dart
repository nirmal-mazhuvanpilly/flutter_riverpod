import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_provider.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_state.dart';
import 'package:flutter_riverpod_example/riverpod/global_providers.dart';
import 'package:flutter_riverpod_example/view/counter/counter_scoped_view.dart';
import 'package:tuple/tuple.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});

  final counterProvider =
      NotifierProvider<CounterProvider, CounterState>(CounterProvider.new);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer(builder: (context, ref, child) {
                    log("Counter  rebuilds");
                    final value = ref.watch(
                        counterGlobalProvider.select((value) => value.counter));
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    );
                  }),
                  Consumer(builder: (context, ref, child) {
                    log("Row  rebuilds");
                    final value = ref.read(counterGlobalProvider.notifier);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              value.decrementCounter();
                            },
                            child: const Text("-")),
                        TextButton(
                            onPressed: () {
                              value.incrementCounter();
                            },
                            child: const Text("+")),
                      ],
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer(builder: (context, ref, child) {
                        log("Counter One rebuilds");
                        final value = ref.watch(counterProvider.select(
                            (value) =>
                                Tuple2(value.counterOne, value.colorOne)));
                        return Text(
                          value.item1.toString(),
                          style: TextStyle(
                              color: (value.item2 ?? false)
                                  ? Colors.red
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                      Consumer(builder: (context, ref, child) {
                        log("Row One rebuilds");
                        final value = ref.read(counterProvider.notifier);
                        return Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      value.decrementCounterOne();
                                    },
                                    child: const Text("-")),
                                TextButton(
                                    onPressed: () {
                                      value.incrementCounterOne();
                                    },
                                    child: const Text("+")),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  value.changeColorOne();
                                },
                                child: const Text("Change Color")),
                          ],
                        );
                      }),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CounterScopedView(
                                      counterProvider: counterProvider,
                                      selectedCounter: 1,
                                    )));
                          },
                          child: const Text("Next Page")),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer(builder: (context, ref, child) {
                        log("Counter Two rebuilds");

                        final value = ref.watch(counterProvider.select(
                            (value) =>
                                Tuple2(value.counterTwo, value.colorTwo)));
                        return Text(
                          value.item1.toString(),
                          style: TextStyle(
                              color: (value.item2 ?? false)
                                  ? Colors.red
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                      Consumer(builder: (context, ref, child) {
                        log("Row Two rebuilds");
                        final value = ref.read(counterProvider.notifier);
                        return Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      value.decrementCounterTwo();
                                    },
                                    child: const Text("-")),
                                TextButton(
                                    onPressed: () {
                                      value.incrementCounterTwo();
                                    },
                                    child: const Text("+")),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  value.changeColorTwo();
                                },
                                child: const Text("Change Color")),
                          ],
                        );
                      }),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CounterScopedView(
                                      counterProvider: counterProvider,
                                      selectedCounter: 2,
                                    )));
                          },
                          child: const Text("Next Page")),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer(builder: (context, ref, child) {
                        log("Counter Three rebuilds");
                        final value = ref.watch(counterProvider.select(
                            (value) =>
                                Tuple2(value.counterThree, value.colorThree)));

                        return Text(
                          value.item1.toString(),
                          style: TextStyle(
                              color: (value.item2 ?? false)
                                  ? Colors.red
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                      Consumer(builder: (context, ref, child) {
                        log("Row Three rebuilds");
                        final value = ref.read(counterProvider.notifier);
                        return Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      value.decrementCounterThree();
                                    },
                                    child: const Text("-")),
                                TextButton(
                                    onPressed: () {
                                      value.incrementCounterThree();
                                    },
                                    child: const Text("+")),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  value.changeColorThree();
                                },
                                child: const Text("Change Color")),
                          ],
                        );
                      }),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CounterScopedView(
                                      counterProvider: counterProvider,
                                      selectedCounter: 3,
                                    )));
                          },
                          child: const Text("Next Page")),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CounterView()));
                },
                child: const Text("Next Page")),
          ],
        ),
      ),
    );
  }
}
