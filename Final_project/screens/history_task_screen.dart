import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class HistoryTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final historyTasks = Provider.of<TaskProvider>(context).historyTasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('History Tasks'),
      ),
      body: historyTasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.history, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No tasks found in history',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: historyTasks.length,
              itemBuilder: (context, index) {
                final task = historyTasks[index];
                final isExpired = task.scheduledTime != null &&
                    task.scheduledTime!.isBefore(DateTime.now()) &&
                    !task.isCompleted;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          task.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isExpired ? Colors.red : Colors.black,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task.description),
                            const SizedBox(height: 4),
                            Text(
                              'Task Date: ${task.date.year}-${task.date.month.toString().padLeft(2, '0')}-${task.date.day.toString().padLeft(2, '0')}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            if (task.scheduledTime != null)
                              Text(
                                'Scheduled at: ${task.scheduledTime!.hour.toString().padLeft(2, '0')}:${task.scheduledTime!.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            if (isExpired)
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "You didn't complete your task",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _confirmDelete(context, task),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  void _confirmDelete(BuildContext context, Task task) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false)
                  .deleteTask(task);
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
