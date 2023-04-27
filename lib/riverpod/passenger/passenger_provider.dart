import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/model/passengers/passengers_model.dart';
import 'package:flutter_riverpod_example/riverpod/passenger/passenger_state.dart';
import 'package:flutter_riverpod_example/services/api_services.dart';
import 'package:flutter_riverpod_example/services/service_locator.dart';

class PassengerProvider extends StateNotifier<PassengerState> {
  final _apiServices = getIt.get<ApiServices>();
  PassengerProvider()
      : super(const PassengerState(
            loaderState: LoaderState.loaded, enableLoaderState: true));

  PassengersModel? model;
  List<PassengerData>? data;
  int pageCount = 1;
  int? totalPageCount;

  void getPassengers({bool enableLoaderState = true, int? page}) async {
    state = PassengerState(
        passengersList: data,
        loaderState: LoaderState.loading,
        enableLoaderState: enableLoaderState);

    try {
      model = await _apiServices.getPassengers(page: page);
      if (data == null || (data?.isEmpty ?? true)) {
        data = model?.data;
        pageCount = pageCount + 1;
      } else {
        data = [...?data, ...?model?.data];
        pageCount = pageCount + 1;
      }

      totalPageCount = model?.totalPages;
      state = PassengerState(
          passengersList: data,
          loaderState: LoaderState.loaded,
          enableLoaderState: enableLoaderState);
    } catch (e) {
      state = PassengerState(
          error: e.toString(),
          loaderState: LoaderState.error,
          enableLoaderState: enableLoaderState);
    }
  }
}
