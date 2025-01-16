import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/main.dart';
import 'package:flutter_riverpod_example/model/passengers/passengers_model.dart';
import 'package:flutter_riverpod_example/riverpod/global_providers.dart';
import 'package:flutter_riverpod_example/riverpod/passenger/passenger_state.dart';
import 'package:flutter_riverpod_example/services/api_services.dart';
import 'package:flutter_riverpod_example/services/dependency_injection.dart';

class PassengerProvider extends Notifier<PassengerState> {
  late final BaseServices _apiServices;
  int pageCount = 1;
  int? totalPageCount;

  void getCounterStateDetails() {
    providerContainer.read(counterGlobalProvider.notifier).incrementCounter();
    log(providerContainer.read(counterGlobalProvider).counter.toString());
  }

  void getPassengers({bool enableLoaderState = true, int? page}) async {
    getCounterStateDetails(); // Increment state of counter everytime API hits. Just for testing
    state = state.copyWith(
        loaderState: LoaderState.loading, enableLoaderState: enableLoaderState);
    try {
      final model = await _apiServices.getPassengers(page: page);
      final currentData = state.passengersList;
      if (currentData == null || (currentData.isEmpty)) {
        state = state.copyWith(
            passengersList: model?.data,
            loaderState: LoaderState.loaded,
            enableLoaderState: enableLoaderState);
      } else {
        final List<PassengerData> passengers = [
          ...currentData,
          ...model?.data ?? []
        ];
        state = state.copyWith(
            passengersList: passengers,
            loaderState: LoaderState.loaded,
            enableLoaderState: enableLoaderState);
      }
      pageCount = pageCount + 1;
      totalPageCount = model?.totalPages;
    } catch (e) {
      state = state.copyWith(
          error: e.toString(),
          loaderState: LoaderState.error,
          enableLoaderState: enableLoaderState);
    }
  }

  @override
  PassengerState build() {
    _apiServices = ref.read(baseServicesProvider);
    return const PassengerState(
        loaderState: LoaderState.loaded, enableLoaderState: true);
  }
}
