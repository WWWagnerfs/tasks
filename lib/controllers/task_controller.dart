import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_task_model.dart';

class TaskController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Adicionar uma nova tarefa
  Future<void> addTask(String userId, String title) async {
    try {
      await _firestore.collection('users').doc(userId).collection('tasks').add({
        'title': title,
        'isCompleted': false,
      });
    } catch (e) {
      print('Erro ao adicionar tarefa: $e');
    }
  }

  // Atualizar o status de uma tarefa
  Future<void> updateTask(String userId, String taskId, bool isCompleted) async {
    try {
      await _firestore.collection('users').doc(userId).collection('tasks').doc(taskId).update({
        'isCompleted': isCompleted,
      });
    } catch (e) {
      print('Erro ao atualizar tarefa: $e');
    }
  }

  // Deletar uma tarefa
  Future<void> deleteTask(String userId, String taskId) async {
    try {
      await _firestore.collection('users').doc(userId).collection('tasks').doc(taskId).delete();
    } catch (e) {
      print('Erro ao deletar tarefa: $e');
    }
  }

  // Obter uma lista de tarefas do usuário em tempo real
  Stream<List<TaskModel>> getTasks(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel(
          id: doc.id,
          title: doc['title'],
          isCompleted: doc['isCompleted'],
        );
      }).toList();
    });
  }
}
