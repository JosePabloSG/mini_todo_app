# Mini Todo App

Aplicación de tareas desarrollada con Flutter implementando Clean Architecture y SQLite para la persistencia de datos.

# 👥 Participantes

- [@JosePabloSG](https://github.com/JosePabloSG)
- [@Yoilin](https://github.com/YoilinCastrillo)
- [@Sofia](https://github.com/SofiaSJ09)
- [@Aaron](https://github.com/ItsChavesCR)
- [@Genesis](https://github.com/AlexaGenar)

## ¿Qué es sqflite?

sqflite es un plugin de Flutter que permite implementar bases de datos SQLite en aplicaciones móviles multiplataforma (Android y iOS). Proporciona funciones para crear, abrir, consultar, insertar, actualizar y eliminar datos almacenados de manera local en dispositivos móviles.

### Importancia y ventajas de sqflite

- **Almacenamiento local eficiente**: Optimiza la gestión de datos de forma ligera y eficiente en dispositivos móviles.
- **Rendimiento**: Alta velocidad en operaciones CRUD (Create, Read, Update, Delete).
- **Persistencia de datos**: Permite guardar datos en almacenamiento local para disponibilidad offline.
- **Multiplataforma**: Compatible con Android y iOS mediante un mismo código base.
- **Facilidad de uso**: Interfaz sencilla y práctica para desarrolladores.

### Instalación e integración

Para integrar sqflite en un proyecto Flutter, se agrega la dependencia en el archivo pubspec.yaml:

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.3
  path_provider: ^2.1.3
```

Después, ejecuta el comando:
```bash
flutter pub get
```

### Ejemplo básico de implementación

1. Crear una base de datos:
```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'example.db');

  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          completed INTEGER
        )
      ''');
    },
    version: 1,
  );
}
```

2. Insertar datos:
```dart
Future<void> insertTask(Database db, String title) async {
  await db.insert(
    'tasks',
    {'title': title, 'completed': 0},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
```

3. Consultar datos:
```dart
Future<List<Map<String, dynamic>>> getTasks(Database db) async {
  return await db.query('tasks');
}
```

## Resumen Técnico 📋

**Tipo de Proyecto:** Aplicación móvil desarrollada con Flutter

**Arquitectura y Patrones:**
- Implementa Clean Architecture (visible en la estructura de carpetas: domain, data, presentation)
- Utiliza Dependency Injection (carpeta di)
- Gestión de estado con Riverpod

**Tecnologías y Dependencias Principales:**
- Flutter SDK: ^3.7.2
- Base de datos local: SQLite (sqflite ^2.3.0)
- Gestión de estado: flutter_riverpod ^2.4.0
- Inyección de dependencias: get_it ^7.6.0
- Manejo de rutas y almacenamiento: path_provider ^2.1.1

**Estructura del Proyecto:**
```
lib/
├── data/         # Capa de datos y repositorios
├── di/           # Configuración de inyección de dependencias
├── domain/       # Lógica de negocio y entidades
├── presentation/ # UI y controladores
└── main.dart     # Punto de entrada de la aplicación
```

## Instrucciones de Ejecución 🚀

### Prerrequisitos:
- Flutter SDK ^3.7.2
- Dart SDK instalado
- Un editor de código (preferiblemente VS Code o Android Studio)
- Un emulador de Android/iOS o un dispositivo físico

### Pasos para ejecutar:

1. Clonar el repositorio:
```bash
git clone https://github.com/JosePabloSG/mini_todo_app.git
cd mini_todo_app
```

2. Obtener las dependencias:
```bash
flutter pub get
```

3. Ejecutar la aplicación:
```bash
flutter run
```

### Verificación del entorno:
```bash
flutter doctor
```
Este comando verificará que todas las dependencias necesarias estén correctamente instaladas.

### Modos de ejecución:
- Para modo debug: `flutter run`
- Para modo release: `flutter run --release`
- Para modo profile: `flutter run --profile`
