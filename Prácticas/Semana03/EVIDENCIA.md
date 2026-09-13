# 🗄️ Práctica 03 — ¡Hagamos que nuestra base de datos proteja los datos!


## 🧪 Experimento 1 — Intentemos romper la PRIMARY KEY

### 💭 Responde
¿Qué ocurrió? La base de datos rechazó la inserción del nuevo registro.

¿El registro fue aceptado? No, fue denegado por completo.

¿Por qué? Porque el identificador 1 ya estaba asignado a otro registro (`` `Minecraft` ``), violando la regla de exclusividad.

¿Qué restricción intervino? La `` `PRIMARY KEY` ``.

¿Qué información proporciona el mensaje de error? Indica que hubo una entrada duplicada (`` ´Duplicate entry '1'` ``) específicamente para la llave primaria (`` `PRIMARY` ``), impidiendo que se rompa la unicidad de los registros.

### 🧪 Experimento 2 — Intentemos insertar un valor NULL

¿Cuál de los dos registros fue aceptado?

El registro que intentó introducir un valor `NULL` en el campo `nombre` fue rechazado por completo por el SGBD.

¿Por qué?

Porque la columna `nombre` tiene definida la restricción  `NOT NULL`, lo cual prohíbe explícitamente dejar este campo vacío o sin un valor asignado.

¿Qué campo tiene  `` `NOT NULL` ``?

El campo `nombre` (además de `id_videojuego` por ser clave primaria).

¿Qué campo permite `NULL`?

Los demás campos de la tabla que no cuentan con esta restricción estricta en su configuración actual.

¿Qué ventaja tiene utilizar `NOT NULL`?

Evita que la base de datos almacene registros incompletos o inválidos, asegurando que los datos críticos para el sistema siempre tengan información real.
