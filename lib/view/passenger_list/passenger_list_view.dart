import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/passenger_list/passenger_list_provider.dart';
import 'package:flutter_riverpod_example/riverpod/passenger_list/passenger_list_state.dart';

class PassengerListView extends StatelessWidget {
  PassengerListView({super.key});

  final passengerListProvider =
      NotifierProvider<PassengerListProvider, PassengerListState>(
          PassengerListProvider.new);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Consumer(builder: (context, ref, child) {
            final value = ref.watch(
                passengerListProvider.select((value) => value.passengersList));
            return ListView.builder(
              itemCount: value?.length ?? 0,
              itemBuilder: (context, index) {
                final item = value?.elementAt(index);
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: Column(
                    children: [Text("ID : ${item?.id ?? ""}")],
                  ),
                );
              },
            );
          })),
          Consumer(builder: (context, ref, child) {
            final value = ref.read(passengerListProvider.notifier);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      value.addToList();
                    },
                    child: const Text("Add+")),
                TextButton(
                    onPressed: () {
                      value.removeFromList();
                    },
                    child: const Text("Remove-")),
              ],
            );
          })
        ],
      ),
    );
  }
}
