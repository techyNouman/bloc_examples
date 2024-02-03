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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("Notifications"),
              BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(value: state.isEnableOrDisable, onChanged: (newValue) {
                      context.read<SwitchBloc>().add(EnableOrDisableNotification());
                    });
                  })
            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: 200,
            color: Colors.red.withOpacity(.2),
          ),
          SizedBox(height: 50,),
          Slider(value: .4, onChanged: (value) {})
        ],
      ),
    );
  }
}
