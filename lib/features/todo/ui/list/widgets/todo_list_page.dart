import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_learn/features/todo/model/task.dart';
import 'package:flutter_bloc_learn/features/todo/ui/list/widgets/todo_list_item_widget.dart';
import 'package:flutter_bloc_learn/features/todo/ui/task_bloc.dart';
import 'package:flutter_bloc_learn/features/todo/ui/task_event.dart';
import 'package:flutter_bloc_learn/features/todo/ui/task_state.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late final TaskBloc _bloc;

  @override
  void initState() {
    _bloc = TaskBloc();

    _bloc.inputTask.add(GetTask());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO-DO'),
      ),
      body: StreamBuilder<TaskState>(
        stream: _bloc.outputTask,
        builder: (context, state) {
          if (state.data is TaskLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.data is TaskErrorState) {
            return const Center(
              child: Icon(Icons.error),
            );
          } else if (state.data is TaskLoadedState) {
            final list = state.data?.lTask ?? [];

            return ListView.separated(
              itemCount: list.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                return TodoListItemWidget(
                  task: list[index],
                  delete: () {
                    _bloc.inputTask.add(DeleteTask(task: list[index]));
                  },
                );
              },
            );
          } else {
            return const Text('Errors');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Task task = Task(name: '');
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Insira o nome da tarefa'),
                  TextField(
                    onChanged: (value) => task.name = value.toString(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: FilledButton(
                              onPressed: () {
                                _bloc.inputTask.add(PostTask(task: task));
                                Navigator.pop(context);
                              },
                              child: Text('Salvar')))
                    ],
                  )
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
