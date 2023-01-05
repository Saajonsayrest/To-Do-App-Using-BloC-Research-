import 'package:flutter/material.dart';
import 'package:todo_app_bloc/bloc/bloc_exports.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      onLongPress: () {
        _removeOrDeleteTask(context, task);
      },
      trailing: Checkbox(
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        },
        value: task.isDone,
      ),
    );
  }
}
