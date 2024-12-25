import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  // Getter to fetch all tasks
  List<Task> get allTasks => _tasks;

  // Getter for today's tasks
  List<Task> get todayTasks =>
      _tasks.where((task) => task.date.day == DateTime.now().day).toList();

  // Getter for historical tasks
  List<Task> get historyTasks {
    final now = DateTime.now();
    return _tasks.where((task) {
      final taskDateTime = task.scheduledTime ?? task.date;
      return (taskDateTime.isBefore(now) && !task.isCompleted) ||
          task.isCompleted;
    }).toList();
  }

  // Method to add a task
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  // Method to delete a task
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  // Method to edit a task
  void editTask(Task oldTask, Task updatedTask) {
    final index = _tasks.indexOf(oldTask);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  // Method to toggle task completion status
  void toggleTaskCompletion(Task task) {
    final index = _tasks.indexOf(task);
    if (index != -1) {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
      notifyListeners();
    }
  }
}
