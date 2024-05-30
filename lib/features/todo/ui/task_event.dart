// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_learn/features/todo/model/task.dart';

abstract class TaskEvent {}

class GetTask extends TaskEvent {}

class PostTask extends TaskEvent {
  final Task task;
  PostTask({required this.task});
}

class DeleteTask extends TaskEvent {
  final Task task;
  DeleteTask({required this.task});
}
