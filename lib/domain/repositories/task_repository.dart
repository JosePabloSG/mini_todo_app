import '../entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();
  Future<void> addTask(Task task);
  Future<void> deleteTask(int id);
  Future<void> updateTask(Task task);
} 