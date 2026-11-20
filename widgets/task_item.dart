import 'package:flutter/material.dart';
import 'package:quiz/model/list_item.dart';

class TaskItem extends StatelessWidget {
  final ListItem listIem;
  final num taskNumber;
  final ValueChanged<bool> onChanged;

  const TaskItem({
    super.key,
    required this.listIem,
    required this.taskNumber,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${taskNumber.toString()}: '),
        Text(listIem.title),
        Text(listIem.isCompleted ? "Complete" : "Incomplete"),
        Checkbox(
          value: listIem.isCompleted,
          onChanged: ((value) {
            onChanged(value!);
          }),
        ),
      ],
    );
  }
}