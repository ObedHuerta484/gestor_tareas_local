# Diseño de la persistencia local

## Tecnología seleccionada

Se utilizará SQLite como sistema de almacenamiento local y Drift como
biblioteca para interactuar con la base de datos desde Flutter.

También se utilizará drift_flutter para facilitar la integración con
las diferentes plataformas.

## Diseño de la tabla

La aplicación tendrá una tabla llamada tareas con los siguientes campos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | INTEGER | Clave primaria autoincremental |
| titulo | TEXT | Título de la tarea |
| completada | BOOLEAN | Estado de la tarea |

## Operaciones previstas

- Crear tareas.
- Consultar tareas.
- Modificar títulos.
- Cambiar el estado de las tareas.
- Eliminar tareas.

## Persistencia

Los datos se almacenarán localmente, sin utilizar servidores ni
servicios externos.
