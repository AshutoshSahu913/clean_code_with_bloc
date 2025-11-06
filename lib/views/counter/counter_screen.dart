import 'package:clean_code_with_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:clean_code_with_bloc/bloc/counter_bloc/counter_events.dart';
import 'package:clean_code_with_bloc/bloc/counter_bloc/counter_state.dart';
import 'package:clean_code_with_bloc/bloc/switch_bloc/switch_bloc.dart';
import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:clean_code_with_bloc/views/counter/widgets/RoundedButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.isSwitch != current.isSwitch,
              builder: (context, state) {
                return Center(
                  child: Switch(
                    value: state.isSwitch,
                    onChanged: (newValue) {
                      context.read<SwitchBloc>().add(
                        SwitchEnableOrDisableNotification(),
                      );
                    },
                  ),
                );
              },
            ),
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) =>
                  previous.counter != current.counter,
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButtonWidget(
                  buttonTxt: 'Increment',
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                ),
                SizedBox(width: 10),
                RoundedButtonWidget(
                  buttonTxt: 'Decrement',
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                ),
              ],
            ),

            const SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 100,
                    color: AppColors.appColor.withOpacity(state.slider),
                  ),
                );
              },
            ),

            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Center(
                  child: Slider(
                    secondaryActiveColor: AppColors.buttonColor,
                    thumbColor: Colors.black,
                    activeColor: Colors.greenAccent,
                    inactiveColor: Colors.grey,
                    value: state.slider,
                    onChanged: (double value) {
                      context.read<SwitchBloc>().add(
                        SliderEvent(slider: value),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
