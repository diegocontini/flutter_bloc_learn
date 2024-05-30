import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/todo/model/task.dart';

class TodoListItemWidget extends StatelessWidget {
  final Task task;
  final Function delete;
  const TodoListItemWidget({super.key, required this.task, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(task.name),
      trailing: IconButton(
          onPressed: () {
            delete();
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          )),
    ));
  }
}
