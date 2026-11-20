import 'package:flutter/material.dart';
import 'package:quiz/model/list_item.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<ListItem> completedTasks;
  const CompletedTasksPage({super.key, required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Completed Tasks")),
      body: Column(
        children: [
          Expanded(
            child: completedTasks.isEmpty
                ? const Center(child: Text("No completed tasks yet!"))
                : ListView.builder(
                    itemCount: completedTasks.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text('${index + 1}: '),
                          Text(completedTasks[index].title),
                          Text(
                            completedTasks[index].isCompleted
                                ? "Complete"
                                : "Incomplete",
                          ),
                        ],
                      );
                    },
                  ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Back Home"),
          ),
        ],
      ),
    );
  }
}
