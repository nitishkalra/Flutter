import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (bool checkboxState) {
                taskData.toggle(index);
              },
              longPressCallback: (){
                 taskData.deleteTask(index);
              }
              );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
