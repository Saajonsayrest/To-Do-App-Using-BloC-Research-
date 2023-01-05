import 'package:flutter/material.dart';
import 'package:todo_app_bloc/screens/my_drawer.dart';

import '../bloc/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = "recycle_bin_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Recycle Bin'),
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(label: Text('Tasks: ${state.removedTasks.length}')),
              TasksList(tasksList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
