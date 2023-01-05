import 'package:flutter/material.dart';
import 'package:todo_app_bloc/counter/bloc/brightness_cubit.dart';

import 'new_screen_test.dart';
import 'bloc/bloc_imports.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter App')),
        actions: [
          IconButton(
              onPressed: () {
                context.read<BrightnessCubit>().toggleBrightness();
              },
              icon: const Icon(Icons.brightness_5_rounded))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              'Counter Value: ${state.counterValue}',
              style: textTheme.displaySmall,
            );
          }, listener: (context, state) {
            if (state is IncrementState) {

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Successfully Incremented'),
                duration: Duration(seconds: 1),
              ));
            }
            if (state is DecrementState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Successfully Decremented'),
                duration: Duration(seconds: 1),
              ));
            }
          }),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(theme)),
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                  },
                  child: const Icon(Icons.remove)),
              const SizedBox(width: 50),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(theme)),
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                  },
                  child: const Icon(Icons.add))
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NewScreenTest()));
              },
              child: const Text('NEW Page'))
        ],
      ),
    );
  }
}
