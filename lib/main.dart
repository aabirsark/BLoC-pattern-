import 'package:bloc_pattern/core/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        )
      ],
      child: const MaterialApp(
        title: "Bloc example",
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterInit) {
            return Center(
                child: Text(state.count.toString(),
                    style: const TextStyle(fontSize: 24)));
          }
          return const Text("an error occured");
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context
                  .read<CounterBloc>()
                  .add(const CounterIncremenet(increment: 1));
            },
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(const CounterDecrement(decrement: 1));
            },
            child: Icon(Icons.minimize),
          )
        ],
      ),
    );
  }
}
