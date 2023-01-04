import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/bloc/bloc_exports.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return ListTile(
              title: Text(task.title),
              onLongPress: (){context.read<TasksBloc>()..add(DeleteTask(task: task));},
              trailing: Checkbox(
                onChanged: (value) {context.read<TasksBloc>().add(UpdateTask(task: task));},
                value: task.isDone,
              ),
            );
          }),
    );
  }
}
