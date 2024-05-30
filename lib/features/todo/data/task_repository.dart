import 'package:flutter_bloc_learn/features/todo/model/task.dart';

class TaskRepository {
  final List<Task> _task = [];
  Future<List<Task>> getAll() async {
    await Future.delayed(Duration(seconds: 3));

    _task.addAll([
      Task(name: 'Tomar café'),
      Task(name: 'Tirar o lixo'),
      Task(name: 'Lavar a louça'),
      Task(name: 'Dar comida aos gatos'),
      Task(name: 'Checar e-mails'),
    ]);
    return _task;
  }

  Future<List<Task>> post(Task task) async {
    _task.add(task);
    return Future.delayed(const Duration(seconds: 2), () => _task);
  }

  Future<List<Task>> delete(Task task) async {
    _task.remove(task);
    return Future.delayed(const Duration(seconds: 2), () => _task);
  }
}
