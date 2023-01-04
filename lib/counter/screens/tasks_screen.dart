import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todo_app_bloc/widgets/add_task_screen.dart';
import 'package:todo_app_bloc/widgets/tasks_list.dart';

import '../../bloc/bloc_exports.dart';
import '../../models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

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
  void initState()  {
    storage();
    super.initState();
  }

  void storage() async {
    await StoragePermissionClass().storagePermission(context);
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Chip(label: Text('Tasks:')),
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


class StoragePermissionClass {
  Future<bool> storagePermission(BuildContext context) async {
    await Permission.storage.request();
    var storageStatus = await Permission.storage.status;
    if (storageStatus != PermissionStatus.granted) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: () {
                openAppSettings();
              },
              child: Text("Open App Settings"),
            ),
          ],
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
