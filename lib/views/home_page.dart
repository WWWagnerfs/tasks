import 'package:flutter/material.dart';
import '../controllers/task_controller.dart';
import '../models/user_task_model.dart';


class HomePage extends StatelessWidget {
  final String userId;
  final TaskController taskController = TaskController();

  HomePage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Tarefas'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: StreamBuilder<List<TaskModel>>(
        stream: taskController.getTasks(userId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var task = tasks[index];
              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    taskController.updateTask(userId, task.id, value!);
                  },
                ),
                onLongPress: () => taskController.deleteTask(userId, task.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskController.addTask(userId, 'Nova Tarefa');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
