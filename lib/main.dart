import 'package:flutter/material.dart';

import 'data/app_database.dart';
import 'data/tarea_repository.dart';
import 'screens/tareas_page.dart';

void main() {
  final database = AppDatabase();
  final repository = TareaRepository(database);

  runApp(GestorTareasApp(database: database, repository: repository));
}

class GestorTareasApp extends StatefulWidget {
  final AppDatabase database;
  final TareaRepository repository;

  const GestorTareasApp({
    super.key,
    required this.database,
    required this.repository,
  });

  @override
  State<GestorTareasApp> createState() => _GestorTareasAppState();
}

class _GestorTareasAppState extends State<GestorTareasApp> {
  @override
  void dispose() {
    widget.database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de tareas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: TareasPage(repository: widget.repository),
    );
  }
}
