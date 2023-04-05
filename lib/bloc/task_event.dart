// part of 'task_bloc.dart';
//
// @immutable
// abstract class TaskEvent {}
abstract class TaskEvent {}

class LoadTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String title;
  final String description;

  AddTaskEvent({required this.title, required this.description});
}

class UpdateTaskEvent extends TaskEvent {
  final int id;
  final String title;
  final String description;

  UpdateTaskEvent({required this.id, required this.title, required this.description});
}

class DeleteTaskEvent extends TaskEvent {
  final int id;

  DeleteTaskEvent({required this.id});
}
