// part of 'task_bloc.dart';
//
// @immutable
// abstract class TaskState {}
//
// class TaskInitial extends TaskState {}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_using_bloc/bloc/task_bloc.dart';


class TaskBlocProvider extends BlocProvider<TaskBloc> {
  TaskBlocProvider({Key? key, required Widget child})
      : super(
    key: key,
    create: (_) => TaskBloc(),
    child: child,
  );

  static TaskBloc of(BuildContext context) {
    return BlocProvider.of<TaskBloc>(context);
  }
}
