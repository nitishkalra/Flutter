
import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy milk'),
    Task(name: 'Buy milk'),
    Task(name: 'Buy milk'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
  int get taskCount {
    return _tasks.length;
  }
  void addTask(String newTaskTitle){
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }
  void toggle(int index){
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }
  void deleteTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }
}