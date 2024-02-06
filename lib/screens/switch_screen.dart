import 'package:bloc_examples/bloc/switch_bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current)  => previous.isEnableOrDisable != current.isEnableOrDisable,
                    builder: (context, state) {
                  print("Notification");
                  return Switch(
                      value: state.isEnableOrDisable,
                      onChanged: (newValue) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotification());
                      });
                })
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current)  => previous.sliderValue != current.sliderValue,
                builder: (context, state) {
              print("Container");
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.sliderValue),
              );
            }),
            const SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current)  => previous.sliderValue != current.sliderValue,
                builder: (context, state) {
              print("Slider");
              return Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    context
                        .read<SwitchBloc>()
                        .add(ScrollSlider(sliderValue: value));
                  });
            })
          ],
        ),
      ),
    );
  }
}
