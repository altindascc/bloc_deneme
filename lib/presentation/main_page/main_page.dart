import 'package:bloc_deneme/presentation/main_page/bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  final String title;
  const MainPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc(),
      child: Builder(builder: (context) {
        return BlocListener<MainPageBloc, MainPageState>(
          listenWhen: (previous, current) => previous.text != current.text,
          listener: (context, state) {
            final snackBar = SnackBar(content: Text(state.text));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  BlocBuilder<MainPageBloc, MainPageState>(
                    builder: (context, state) {
                      return Text(
                        '${state.counter}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                  const Text(
                    'You have pushed the secnd  buttonjkjkn this many times:',
                  ),
                  BlocBuilder<MainPageBloc, MainPageState>(
                    buildWhen: (previous, current) =>
                        previous.secondCounter != current.secondCounter,
                    builder: (context, state) {
                      return Text(
                        '${state.secondCounter}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<MainPageBloc>()
                            .add(MainPageEventOnIncreaseSecondCounter());
                      },
                      child: Icon(Icons.add)),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<MainPageBloc>()
                            .add(MainPageEventOnText(text: 'anan'));
                      },
                      child: Icon(Icons.add))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _incrementCounter(context),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        );
      }),
    );
  }

  void _incrementCounter(BuildContext context) {
    context.read<MainPageBloc>().add(MainPageEventOnIncreaseCounter());
  }
}
