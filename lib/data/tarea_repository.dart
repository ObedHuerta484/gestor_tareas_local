import 'package:drift/drift.dart';

import 'app_database.dart';

class TareaRepository {
  final AppDatabase _database;

  TareaRepository(this._database);

  // Consultar las tareas y recibir cambios automáticamente.
  Stream<List<Tarea>> obtenerTareas() {
    return _database.select(_database.tareas).watch();
  }

  // Agregar una tarea.
  Future<void> agregarTarea(String titulo) async {
    final texto = titulo.trim();

    if (texto.isEmpty) {
      throw ArgumentError('El título no puede estar vacío.');
    }

    await _database
        .into(_database.tareas)
        .insert(TareasCompanion.insert(titulo: texto));
  }

  // Editar el título de una tarea.
  Future<void> editarTarea(int id, String nuevoTitulo) async {
    final texto = nuevoTitulo.trim();

    if (texto.isEmpty) {
      throw ArgumentError('El título no puede estar vacío.');
    }

    await (_database.update(_database.tareas)
          ..where((tarea) => tarea.id.equals(id)))
        .write(TareasCompanion(titulo: Value(texto)));
  }

  // Cambiar el estado de una tarea.
  Future<void> cambiarEstado(int id, bool completada) async {
    await (_database.update(_database.tareas)
          ..where((tarea) => tarea.id.equals(id)))
        .write(TareasCompanion(completada: Value(completada)));
  }

  // Eliminar una tarea.
  Future<void> eliminarTarea(int id) async {
    await (_database.delete(
      _database.tareas,
    )..where((tarea) => tarea.id.equals(id))).go();
  }
}
