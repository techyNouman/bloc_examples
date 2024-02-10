import 'package:bloc_examples/bloc/timer_bloc/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/timer_bloc/timer_bloc.dart';
import '../bloc/timer_bloc/timer_event.dart';


class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countdown Timer"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<TimerBloc, TimerState>(builder: (context, state){

                return Text(
                  '${state.duration}',
                  style: Theme.of(context).textTheme.headline2,
                );
              }),
              ElevatedButton(onPressed: (){
                context
                    .read<TimerBloc>()
                    .add(TimerStarted(30));
              }, child: Text("Start"))
            ],
          ),
        ),
      ),
    );
  }
}

