import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/task.dart';
import 'package:todo/widget/task_widget.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _tasks = Provider.of<Tasks>(context).tasks(status: Status.InProgress);

    return ListView.separated(
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: _tasks[i],
        child: TasksWidget(),
      ),
      itemCount: _tasks.length,
      separatorBuilder: (ctx, i) => Divider(
        thickness: 1.5,
        height: 1,
      ),
    );
  }
}
