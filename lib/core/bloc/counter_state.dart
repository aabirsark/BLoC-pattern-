part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInit extends CounterState {
  final int _count;
  
  const CounterInit({
    int count = 0,
  }) : _count = count;

  int get count => _count;

  @override
  List<Object> get props => [_count];
}
