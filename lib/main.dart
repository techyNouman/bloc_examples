import 'package:bloc_examples/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_examples/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_examples/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_examples/bloc/timer_bloc/ticker.dart';
import 'package:bloc_examples/bloc/timer_bloc/timer_bloc.dart';
import 'package:bloc_examples/screens/get_api_screen.dart';
import 'package:bloc_examples/screens/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => CounterBloc()),
      BlocProvider(create: (_) => SwitchBloc()),
      BlocProvider(create: (_) => TimerBloc(ticker: const Ticker())),
      BlocProvider(create: (_) => PostsBloc())
    ], child:  MaterialApp(
      title: 'Bloc Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetApiScreen(),
    ));

  }
}
