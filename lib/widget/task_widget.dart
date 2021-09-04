import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/task.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _task = Provider.of<Task>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.23,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${_task.time.format(context)}'),
              ),
            ),
          ),
          title: Text('${_task.title}'),
          subtitle: Text('${DateFormat.yMMMd().format(_task.date)}'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () =>
              Provider.of<Tasks>(context, listen: false).removeTask(_task.id),
        ),
        if (_task.status != Status.InProgress)
          IconSlideAction(
            caption: 'In Progress',
            color: Colors.black45,
            icon: Icons.archive_outlined,
            onTap: () => Provider.of<Tasks>(context, listen: false)
                .changeStatus(_task.id, Status.InProgress),
          ),
        if (_task.status != Status.Completed)
          IconSlideAction(
            caption: 'Complete',
            color: Colors.blue,
            icon: Icons.done_all,
            onTap: () => Provider.of<Tasks>(context, listen: false)
                .changeStatus(_task.id, Status.Completed),
          ),
      ],
    );
  }
}
