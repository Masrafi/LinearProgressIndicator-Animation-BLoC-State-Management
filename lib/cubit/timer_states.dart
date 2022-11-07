import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class WorkoutState extends Equatable {
  final int? elapsed;
  const WorkoutState(this.elapsed);
}

class WorkoutInitial extends WorkoutState {
  const WorkoutInitial() : super(0);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WorkoutInProgress extends WorkoutState {
  const WorkoutInProgress(int? elapsed) : super(elapsed);
  @override
  // TODO: implement props
  List<Object?> get props => [elapsed];
}
