import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CounterState extends Equatable {
  final int? counter;
  final int? counterOne;
  final int? counterTwo;
  final int? counterThree;

  const CounterState(
      {this.counter, this.counterOne, this.counterTwo, this.counterThree});

  CounterState copyWith(
      {int? counter, int? counterOne, int? counterTwo, int? counterThree}) {
    return CounterState(
        counter: counter ?? counter,
        counterOne: counterOne ?? this.counterOne,
        counterTwo: counterTwo ?? this.counterTwo,
        counterThree: counterThree ?? this.counterThree);
  }

  @override
  List<Object?> get props => [counter, counterOne, counterTwo, counterThree];
}
