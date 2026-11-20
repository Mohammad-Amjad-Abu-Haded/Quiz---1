import 'package:flutter/material.dart';
import 'package:quiz/model/list_item.dart';
import 'package:quiz/pages/completed_tasks_page.dart';
import 'package:quiz/widgets/task_item.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<ListItem> listItems = [
    ListItem(title: "Title 1"),
    ListItem(title: "Title 2"),
    ListItem(title: "Title 3"),
    ListItem(title: "Title 4"),
  ];

  @override
  Widget build(BuildContext context) {
    final completedTasks = listItems.where((item) => item.isCompleted).toList();
    return Scaffold(
      appBar: AppBar(title: const Text("My Tasks")),
      body: Column(
        children: [
          Text('Completed: ${completedTasks.length}/${listItems.length}'),
          Expanded(
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  listIem: listItems[index],
                  taskNumber: index + 1,
                  onChanged: (value) {
                    setState(() {
                      listItems[index].isCompleted = value;
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return CompletedTasksPage(completedTasks: completedTasks);
                },
              ),
            ),
            child: const Text("Go to Completed Task"),
          ),
        ],
      ),
    );
  }
}
