import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/model/passengers/passengers_model.dart';

@immutable
class PassengerState extends Equatable {
  final List<PassengerData>? passengersList;
  final String? error;
  final LoaderState? loaderState;
  final bool? enableLoaderState;
  const PassengerState(
      {this.passengersList,
      this.error,
      this.loaderState,
      this.enableLoaderState});

  @override
  List<Object?> get props =>
      [passengersList, error, loaderState, enableLoaderState];
}

enum LoaderState { loaded, loading, error }
