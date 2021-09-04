import 'package:flutter/material.dart';

enum Status { InProgress, Completed }

class Task with ChangeNotifier {
  int id;
  String title;
  DateTime date;
  TimeOfDay time;
  Status? status;
  Task(
      {required this.id,
      required this.title,
      required this.time,
      required this.date,
      this.status});
}

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task(
      id: 1,
      title: 'Task 1',
      time: TimeOfDay.now(),
      date: DateTime.now(),
    ),
    Task(
      id: 2,
      title: 'Task 2',
      time: TimeOfDay.now(),
      date: DateTime.now(),
    ),
    Task(
      id: 3,
      title: 'Task 3',
      time: TimeOfDay.now(),
      date: DateTime.now(),
    ),
    Task(
      id: 4,
      title: 'Task 4',
      time: TimeOfDay.now(),
      date: DateTime.now(),
    ),
  ];
  List<Task> tasks({Status? status}) =>
      _tasks.where((element) => element.status == status).toList();

  void changeStatus(int id, Status status) {
    _tasks.firstWhere((element) => element.id == id).status = status;
    notifyListeners();
  }

  void removeTask(int id) {
    _tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void addTask(String title, TimeOfDay time, DateTime date) {
    _tasks.add(Task(
      id: _tasks.length + 1,
      title: title,
      time: time,
      date: date,
    ));
    notifyListeners();
  }
}
