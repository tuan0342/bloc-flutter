import 'package:bloc_app/widget/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterProvider extends StatelessWidget {
  final Widget child;
  const CounterProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      // CounterProvider tạo ra 1 instance của CounterBloc và 'thằng cha' của nó sẽ sử dụng được cái Bloc này
      create: (BuildContext context) => CounterBloc(),
      child: child,
    );
  }
}
