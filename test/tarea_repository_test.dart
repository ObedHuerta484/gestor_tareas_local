import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:gestor_tareas_local/data/app_database.dart';
import 'package:gestor_tareas_local/data/tarea_repository.dart';

void main() {
  late AppDatabase database;
  late TareaRepository repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());

    repository = TareaRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('Agrega una tarea y guarda su título', () async {
    await repository.agregarTarea('Estudiar Flutter');

    final tareas = await database.select(database.tareas).get();

    expect(tareas.length, 1);
    expect(tareas.first.titulo, 'Estudiar Flutter');
    expect(tareas.first.completada, false);
  });

  test('Rechaza tareas con títulos vacíos', () async {
    expect(() => repository.agregarTarea('   '), throwsArgumentError);

    final tareas = await database.select(database.tareas).get();

    expect(tareas, isEmpty);
  });

  test('Edita, completa y elimina una tarea', () async {
    await repository.agregarTarea('Tarea original');

    final tareasIniciales = await database.select(database.tareas).get();

    final id = tareasIniciales.first.id;

    await repository.editarTarea(id, 'Tarea modificada');
    await repository.cambiarEstado(id, true);

    var tareas = await database.select(database.tareas).get();

    expect(tareas.first.titulo, 'Tarea modificada');
    expect(tareas.first.completada, true);

    await repository.eliminarTarea(id);

    tareas = await database.select(database.tareas).get();

    expect(tareas, isEmpty);
  });
}
