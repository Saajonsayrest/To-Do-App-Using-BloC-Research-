import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todo_app_bloc/screens/my_drawer.dart';
import 'package:todo_app_bloc/screens/add_task_screen.dart';
import 'package:todo_app_bloc/widgets/tasks_list.dart';

import '../../bloc/bloc_exports.dart';
import '../../models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);
  static const id = "tasks_screen";

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addtask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskScreen(),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Tasks App')),

            actions: [
              IconButton(
                  onPressed: () {
                    _addtask(context);
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Chip(label: Text('Tasks: ${state.allTasks.length}')),
              TasksList(tasksList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addtask(context);
            },
            tooltip: "Add Task",
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

