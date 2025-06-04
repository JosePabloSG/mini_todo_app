import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Task>> fetchTasks() => localDataSource.fetchTasks();

  @override
  Future<void> addTask(Task task) => localDataSource.addTask(task);

  @override
  Future<void> deleteTask(int id) => localDataSource.deleteTask(id);

  @override
  Future<void> updateTask(Task task) => localDataSource.updateTask(task);
} 