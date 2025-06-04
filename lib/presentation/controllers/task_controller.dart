import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../../di/di.dart';

class TaskController extends StateNotifier<List<Task>> {
  final TaskRepository repository;

  TaskController({required this.repository}) : super([]);

  Future<void> loadTasks() async {
    final tasks = await repository.fetchTasks();
    state = tasks;
  }

  Future<void> addTask(String title) async {
    final newTask = Task(id: 0, title: title, isCompleted: false);
    await repository.addTask(newTask);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await repository.deleteTask(id);
    state = state.where((task) => task.id != id).toList();
  }

  Future<void> toggleTaskCompleted(int id) async {
    final task = state.firstWhere((t) => t.id == id);
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await repository.updateTask(updatedTask);
    await loadTasks();
  }
}

final taskControllerProvider = StateNotifierProvider<TaskController, List<Task>>(
  (ref) => TaskController(repository: getIt<TaskRepository>()),
); 