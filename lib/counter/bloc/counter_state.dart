part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;

  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return {
      "counterValue": counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map["counterValue"],
    );
  }
//
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counterValue: 0);
}

class IncrementState extends CounterState {
  IncrementState(int increasedValue) : super(counterValue: increasedValue);
}
class DecrementState extends CounterState {
  DecrementState(int decreasedValue) : super(counterValue: decreasedValue);
}