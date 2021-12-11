import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeylist/models/task_data.dart';
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      final task = Provider.of<TaskData>(context).tasks[index];
      return TaskTile(taskTitle:
      task.name, isChecked:
      task.isDone,
      checkboxCallback: (checkboxState) {
      Provider.of<TaskData>(context).updateTask(task);
      },
      longPressCallback: () {
        Provider.of<TaskData>(context).deleteTask(task);
      },
      );

    },
    itemCount:
    Provider.of<TaskData>(context).taskCount,
    );
  }
}