import 'package:get_it/get_it.dart';
import '../data/datasources/task_local_datasource_impl.dart';
import '../data/repositories/task_repository_impl.dart';
import '../domain/repositories/task_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<TaskLocalDataSourceImpl>(() => TaskLocalDataSourceImpl());
  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(localDataSource: getIt<TaskLocalDataSourceImpl>()),
  );
} 