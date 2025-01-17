import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/counter/counter_state.dart';
import 'package:flutter_riverpod_example/riverpod/passenger/passenger_provider.dart';
import 'package:flutter_riverpod_example/riverpod/passenger/passenger_state.dart';
import 'package:flutter_riverpod_example/riverpod/passenger_list/passenger_list_provider.dart';
import 'package:flutter_riverpod_example/riverpod/passenger_list/passenger_list_state.dart';

//Observer for all Provider
class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    //Observer based on Run Time Type
    //It will observe all Providers, Global and Scoped
    switch (provider.runtimeType) {
      case NotifierProvider<PassengerListProvider, PassengerListState>:
        final previousStateValue = previousValue as PassengerListState;
        final newStateValue = newValue as PassengerListState;
        log('****************** Passenger List ******************');
        log('Previous List length": ${previousStateValue.passengersList?.length}');
        log('New List length": ${newStateValue.passengersList?.length}');
        log('****************** ////////////// ******************');
        break;

      case NotifierProvider<PassengerProvider, PassengerState>:
        final previousStateValue = previousValue as PassengerState;
        final newStateValue = newValue as PassengerState;
        log('****************** Passenger ******************');
        log('Previous List length": ${previousStateValue.passengersList?.length}');
        log('New List length": ${newStateValue.passengersList?.length}');
        log('Previous LoaderState": ${previousStateValue.loaderState}');
        log('New LoaderState": ${newStateValue.loaderState}');
        log('****************** ////////////// ******************');
        break;
    }

    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}

//Observer for Global Counter Provider
//*Note It won't log scoped Providers
class CounterProviderObserver extends ProviderObserver {
  final NotifierProvider providerToObserve;

  CounterProviderObserver(this.providerToObserve);

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    if (provider == providerToObserve) {
      final previousStateValue = previousValue as CounterState;
      final newStateValue = newValue as CounterState;
      log('****************** Global Counter ******************');
      log('New Counter value: ${newStateValue.counter}');
      log('Previous Counter value: ${previousStateValue.counter}');
      log('****************** ////////////// ******************');
    }
  }
}
