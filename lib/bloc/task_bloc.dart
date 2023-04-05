// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'task_event.dart';
// part 'task_state.dart';
//
// class TaskBloc extends Bloc<TaskEvent, TaskState> {
//   TaskBloc() : super(TaskInitial()) {
//     on<TaskEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sqflite_using_bloc/dbProvider/databaseProvider.dart';


class TaskBloc extends Cubit<List<Map<String, dynamic>>> {
TaskBloc() : super([]);

Future<void> loadTasks() async {
final tasks = await DatabaseProvider.dbProvider.getTasks();
emit(tasks);
}

Future<void> addTask({required String title, required String description}) async {
await DatabaseProvider.dbProvider.insertTask({
DatabaseProvider.columnTitle: title,
DatabaseProvider.columnDescription: description,
});
await loadTasks();
}

Future<void> updateTask({required int id, required String title, required String description}) async {
await DatabaseProvider.dbProvider.updateTask({
DatabaseProvider.columnId: id,
DatabaseProvider.columnTitle: title,
DatabaseProvider.columnDescription: description,
});
await loadTasks();
}

Future<void> deleteTask(int id) async {
await DatabaseProvider.dbProvider.deleteTask(id);
await loadTasks();
}
}
