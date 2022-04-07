import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInit()) {
    on<CounterIncremenet>(_increment);
    on<CounterDecrement>(_decrement);
  }

  _increment(CounterIncremenet event, Emitter<CounterState> emit) {
    var state = this.state;
    if (state is CounterInit) {
      emit(CounterInit(count: state._count + event.increment));
    }
  }

  _decrement(CounterDecrement event, Emitter<CounterState> emit) {
    var state = this.state;
    if (state is CounterInit) {
      emit(CounterInit(count: state._count - event.decrement));
    }
  }
}
