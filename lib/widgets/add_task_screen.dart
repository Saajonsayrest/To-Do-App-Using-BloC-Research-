import 'package:flutter/material.dart';

import '../bloc/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
   const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
   TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Add Task', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          TextField(autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    var task = Task(title: titleController.text);
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Add'))
            ],
          )
        ],
      ),
    );
  }
}
