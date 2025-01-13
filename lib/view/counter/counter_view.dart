import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_provider.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_state.dart';
import 'package:flutter_riverpod_example/riverpod/global_providers.dart';
import 'package:flutter_riverpod_example/view/counter/counter_scoped_view.dart';
import 'package:tuple/tuple.dart';

class CounterView extends ConsumerWidget {
  CounterView({super.key});

  final counterProvider =
      NotifierProvider<CounterProvider, CounterState>(CounterProvider.new);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("***************#########Rebuilds Build Method#########***************");
    final readGlobalReference = ref.read(counterGlobalProvider.notifier);
    final readLocalReference = ref.read(counterProvider.notifier);
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
                    log("Counter rebuilds");
                    final value = ref.watch(
                        counterGlobalProvider.select((value) => value.counter));
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    );
                  }),
                  Builder(builder: (context) {
                    log("Counter Button rebuilds");
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              readGlobalReference.decrementCounter();
                            },
                            child: const Text("-")),
                        TextButton(
                            onPressed: () {
                              readGlobalReference.incrementCounter();
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
                      Builder(builder: (context) {
                        log("Counter One Button rebuilds");
                        return Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      readLocalReference.decrementCounterOne();
                                    },
                                    child: const Text("-")),
                                TextButton(
                                    onPressed: () {
                                      readLocalReference.incrementCounterOne();
                                    },
                                    child: const Text("+")),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  readLocalReference.changeColorOne();
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
                      Builder(builder: (context) {
                        log("Counter Two Button rebuilds");
                        return Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      readLocalReference.decrementCounterTwo();
                                    },
                                    child: const Text("-")),
                                TextButton(
                                    onPressed: () {
                                      readLocalReference.incrementCounterTwo();
                                    },
                                    child: const Text("+")),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  readLocalReference.changeColorTwo();
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
                      Builder(builder: (context) {
                        log("Counter Three Button rebuilds");
                        return Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      readLocalReference
                                          .decrementCounterThree();
                                    },
                                    child: const Text("-")),
                                TextButton(
                                    onPressed: () {
                                      readLocalReference
                                          .incrementCounterThree();
                                    },
                                    child: const Text("+")),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  readLocalReference.changeColorThree();
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
