import 'package:bloc_examples/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_examples/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_examples/screens/counter_screen.dart';
import 'package:bloc_examples/screens/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterBloc(),
        child: BlocProvider(
          create: (context) => SwitchBloc(),
          child: MaterialApp(
            title: 'Bloc Examples',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SwitchScreen(),
          ),
        ));
  }
}
