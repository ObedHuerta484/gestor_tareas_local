import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

// Tabla donde se almacenarán las tareas.
class Tareas extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get titulo => text()();

  BoolColumn get completada => boolean().withDefault(const Constant(false))();
}

// Configuración de la base de datos.
@DriftDatabase(tables: [Tareas])
class AppDatabase extends _$AppDatabase {
  // Constructor para la aplicación normal.
  AppDatabase() : super(_abrirConexion());

  // Constructor para las pruebas automatizadas.
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;
}

// Conexión con la base de datos local.
QueryExecutor _abrirConexion() {
  return driftDatabase(
    name: 'gestor_tareas_local',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}
