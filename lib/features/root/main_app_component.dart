import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/features/todo/ui/list/widgets/todo_list_page.dart';

class MainAppComponent extends StatelessWidget {
  const MainAppComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TodoListPage());
  }
}
