import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import 'add_task_screen.dart';
import 'EditTaskScreen.dart';

class TodayTaskScreen extends StatelessWidget {
  const TodayTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allTasks = Provider.of<TaskProvider>(context).allTasks;
    Map<String, List<Task>> groupedTasks = {};
    for (var task in allTasks) {
      String dateKey = '${task.date.year}-${task.date.month}-${task.date.day}';
      if (groupedTasks.containsKey(dateKey)) {
        groupedTasks[dateKey]!.add(task);
      } else {
        groupedTasks[dateKey] = [task];
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('All Tasks')),
      body: Column(
        children: [
          Expanded(
            child: allTasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.list, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No tasks available.',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    children: groupedTasks.keys.map((dateKey) {
                      var tasks = groupedTasks[dateKey]!;
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Tasks for $dateKey',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ...tasks.map((task) {
                              return ListTile(
                                title: Text(
                                  task.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: task.isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    color: task.isCompleted
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(task.description),
                                    if (task.scheduledTime != null)
                                      Text(
                                        'Scheduled at: ${task.scheduledTime!.year}-${task.scheduledTime!.month.toString().padLeft(2, '0')}-${task.scheduledTime!.day.toString().padLeft(2, '0')} '
                                        '${task.scheduledTime!.hour.toString().padLeft(2, '0')}:${task.scheduledTime!.minute.toString().padLeft(2, '0')}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditTaskScreen(task: task),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () =>
                                          _confirmDelete(context, task),
                                    ),
                                    Checkbox(
                                      value: task.isCompleted,
                                      onChanged: (value) {
                                        Provider.of<TaskProvider>(context,
                                                listen: false)
                                            .toggleTaskCompletion(task);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTaskScreen(),
                  ),
                );
              },
              child: const Text('Add New Task'),
            ),
          ),
        ],
      ),
    );
  }
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
            Provider.of<TaskProvider>(context, listen: false).deleteTask(task);
            Navigator.pop(ctx);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Delete'),
        ),
      ],
    ),
  );
}
