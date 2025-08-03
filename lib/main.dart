import 'package:cubitbloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CounterPage());
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterCubit(0), child: CounterView());
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter Cubit!"), centerTitle: true),
        body: BlocBuilder<CounterCubit, int>(
          builder: (context, counter) => Center(
            child: Text(
              "Counter value: $counter",
              style: TextStyle(fontSize: 32),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, counter) => FloatingActionButton(
                heroTag: "inc",
                onPressed: () =>
                    BlocProvider.of<CounterCubit>(context).increment(),
                child: const Icon(Icons.add),
              ),
            ),

            const SizedBox(height: 20),

            BlocBuilder<CounterCubit, int>(
              builder: (context, counter) => FloatingActionButton(
                heroTag: "dec",
                onPressed: () =>
                    BlocProvider.of<CounterCubit>(context).decrement(),
                child: const Icon(Icons.remove),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
