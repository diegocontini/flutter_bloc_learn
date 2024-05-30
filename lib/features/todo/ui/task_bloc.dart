import 'dart:async';

import 'package:flutter_bloc_learn/features/todo/data/task_repository.dart';
import 'package:flutter_bloc_learn/features/todo/model/task.dart';
import 'package:flutter_bloc_learn/features/todo/ui/task_event.dart';
import 'package:flutter_bloc_learn/features/todo/ui/task_state.dart';

class TaskBloc {
  final _repo = TaskRepository();
  final StreamController<TaskEvent> _inputTaskController = StreamController();
  final StreamController<TaskState> _outputTaskController = StreamController();

  Sink<TaskEvent> get inputTask => _inputTaskController.sink;
  Stream<TaskState> get outputTask => _outputTaskController.stream;

  TaskBloc() {
    _inputTaskController.stream.listen(_onEvent);
  }

  void _onEvent(TaskEvent event) async {
    List<Task> task = [];
    _outputTaskController.add(TaskLoadingState());

    if (event is GetTask) {
      task = await _repo.getAll();
    } else if (event is PostTask) {
      task = await _repo.post(event.task);
    } else if (event is DeleteTask) {
      task = await _repo.delete(event.task);
    }

    _outputTaskController.add(TaskLoadedState(task: task));
  }
}
