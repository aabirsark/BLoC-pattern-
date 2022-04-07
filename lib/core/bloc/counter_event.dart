part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncremenet extends CounterEvent {
  final int increment;
  const CounterIncremenet({
    required this.increment,
  });

  @override
  List<Object> get props => [increment];
}

class CounterDecrement extends CounterEvent {
  final int decrement;
  const CounterDecrement({
    required this.decrement,
  });

  @override
  List<Object> get props => [decrement];
}
