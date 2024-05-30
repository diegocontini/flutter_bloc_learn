// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_learn/features/todo/model/task.dart';

abstract class TaskState {
  final List<Task> lTask;
  TaskState({
    required this.lTask,
  });
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(lTask: []);
}

class TaskLoadingState extends TaskState {
  TaskLoadingState() : super(lTask: []);
}

class TaskLoadedState extends TaskState {
  TaskLoadedState({required final List<Task> task}) : super(lTask: task);
}

class TaskErrorState extends TaskState {
  final Exception except;
  TaskErrorState({required this.except}) : super(lTask: []);
}
