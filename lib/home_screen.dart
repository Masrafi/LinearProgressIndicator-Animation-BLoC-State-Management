import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timercut/cubit/timer_cubits.dart';
import 'package:timercut/cubit/timer_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The BLoC App'),
        ),
        body: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (context, state) {
            if (state is WorkoutInitial) {
              return Center(
                child: ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<WorkoutCubit>(context).startWorkout(0),
                    child: const Text("Start")),
              );
            }
            if (state is WorkoutInProgress) {
              print("${state.elapsed}");
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: LinearProgressIndicator(
                      minHeight: 20,
                      value: state.elapsed! / 20,
                      backgroundColor: Colors.blue[100],
                    ),
                  ),
                  Center(
                    child: Text("${state.elapsed!}"),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
