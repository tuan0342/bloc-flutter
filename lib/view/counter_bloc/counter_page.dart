import 'package:bloc_app/widget/counter_bloc/counter_bloc.dart';
import 'package:bloc_app/widget/counter_bloc/counter_event.dart';
import 'package:bloc_app/widget/counter_bloc/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final TextStyle _textStyle = const TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: Scaffold(
        body: BlocBuilder<CounterBloc, int>(builder: ((context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Count $state', // state is data from BlocBuilder, BlocBuilder need 'bloc' (CounterBloc)
                style: _textStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _customButton(() => _increase(context), 'Increase'),
                  _customButton(() => _decrease(context), 'Decrease'),
                ],
              )
            ],
          );
        })),
      ),
    );
  }

  _increase(BuildContext context) {
    context.read<CounterBloc>().add(IncreaseEvent());
  }

  _decrease(BuildContext context) {
    context.read<CounterBloc>().add(DecreaseEvent());
  }

  Widget _customButton(Function() onPressed, String text) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
