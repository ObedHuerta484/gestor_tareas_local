# Gestor de tareas local

Aplicacion desarrollada en Flutter para administrar tareas mediante almacenamiento local con SQLite.

## Objetivo

Crear, consultar, editar, completar y eliminar tareas, conservando la informacion aunque se cierre y vuelva a abrir la aplicacion.

## Tecnologias

- Flutter y Dart para el desarrollo de la aplicacion.
- SQLite como sistema de almacenamiento local.
- Drift para gestionar las operaciones sobre la base de datos.
- drift_flutter para integrar la persistencia con Flutter.

## Disenio de la base de datos

Se utilizara una tabla llamada `tareas`:

| Campo      | Tipo    | Descripcion                    |
| ---------- | ------- | ------------------------------ |
| id         | INTEGER | Clave primaria autoincremental |
| titulo     | TEXT    | Titulo de la tarea             |
| completada | BOOLEAN | Estado de la tarea             |

## Plataformas

El proyecto contempla Android, iOS, Windows, Linux, macOS y web. La ejecucion y las pruebas en cada plataforma se documentaran conforme se realicen.

## Instalacion y ejecucion

Obtener las dependencias:

```bash
flutter pub get
```

Analizar el proyecto:

```bash
flutter analyze
```

Ejecutar las pruebas:

```bash
flutter test
```

Ejecutar en Edge:

```bash
flutter run -d edge
```

## Estado del proyecto

Actualmente se encuentra en la etapa de preparacion y disenio. La implementacion de la persistencia con SQLite esta pendiente.
