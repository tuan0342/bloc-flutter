import 'package:bloc_app/widget/counter_bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncreaseEvent>((event, emit) => _increase(emit));
    on<DecreaseEvent>((event, emit) => _decrease(emit));
  }

  _increase(Emitter emit) {
    emit(state + 1);
  }

  _decrease(Emitter emit) {
    emit(state - 1);
  }
}
