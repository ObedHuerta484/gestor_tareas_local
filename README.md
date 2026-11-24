# Gestor de tareas local

Aplicacion desarrollada en Flutter para administrar tareas mediante almacenamiento local con SQLite. Los datos permanecen guardados aunque se cierre y vuelva a abrir la aplicacion.

## Objetivo

Implementar una aplicacion multiplataforma que permita crear, consultar, editar, completar y eliminar tareas mediante una base de datos SQLite local, sin utilizar servidores ni servicios externos.

## Tecnologias utilizadas

- Flutter y Dart para el desarrollo.
- SQLite como sistema de almacenamiento local.
- Drift para gestionar las operaciones de la base de datos.
- drift_flutter para integrar SQLite con Flutter.
- build_runner y drift_dev para generar el codigo de la base de datos.

## Diseno de la base de datos

Se utiliza una tabla llamada `tareas`:

| Campo      | Tipo    | Descripcion                    |
| ---------- | ------- | ------------------------------ |
| id         | INTEGER | Clave primaria autoincremental |
| titulo     | TEXT    | Titulo de la tarea             |
| completada | BOOLEAN | Estado de la tarea             |

## Funcionalidades

- Agregar tareas.
- Consultar las tareas guardadas.
- Editar titulos.
- Marcar tareas como completadas o pendientes.
- Eliminar tareas.
- Rechazar titulos vacios.
- Conservar los datos mediante almacenamiento local.

## Plataformas

El proyecto contempla Android, iOS, Windows, Linux, macOS y Web.

Se verifico la ejecucion y persistencia de datos en Android y Web. Las demas plataformas estan contempladas en la configuracion del proyecto, pero no se realizaron pruebas de ejecucion en ellas.

## Configuracion y ejecucion

Obtener las dependencias:

```bash
flutter pub get
```

Analizar el proyecto:

```bash
flutter analyze
```

Ejecutar las pruebas automatizadas:

```bash
flutter test
```

Ejecutar en Android:

```bash
flutter run -d <id_del_dispositivo>
```

Ejecutar en Edge:

```bash
flutter run -d edge
```

## SQLite en Web

Para utilizar SQLite en Web se incluyen los archivos `sqlite3.wasm` y `drift_worker.js`, necesarios para el funcionamiento de Drift mediante WebAssembly.

## Pruebas realizadas

- Analisis estatico sin problemas.
- Cuatro pruebas automatizadas aprobadas.
- Operaciones CRUD y persistencia verificadas en Android.
- Persistencia despues de recargar la pagina en Microsoft Edge.

## Estado del proyecto

Implementacion principal terminada. Aplicacion funcional y pruebas realizadas en Android y Web.
