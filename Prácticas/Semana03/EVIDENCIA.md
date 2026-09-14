# 🗄️ Práctica 03 — ¡Hagamos que nuestra base de datos proteja los datos!


## 🧪 Experimento 1 — Intentemos romper la PRIMARY KEY

### 💭 Responde
¿Qué ocurrió? La base de datos rechazó la inserción del nuevo registro.

¿El registro fue aceptado? No, fue denegado por completo.

¿Por qué? Porque el identificador 1 ya estaba asignado a otro registro (`` `Minecraft` ``), violando la regla de exclusividad.

¿Qué restricción intervino? La `` `PRIMARY KEY` ``.

¿Qué información proporciona el mensaje de error? Indica que hubo una entrada duplicada (`` ´Duplicate entry '1'` ``) específicamente para la llave primaria (`` `PRIMARY` ``), impidiendo que se rompa la unicidad de los registros.

## 🧪 Experimento 2 — Intentemos insertar un valor NULL

### 💭 Responde

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

## 🧪 Experimento 3 — Provocando un dato duplicado

### 💭 Responde

¿Se permitió el segundo registro?

No, el segundo registro fue rechazado por la base de datos.

¿Qué restricción intervino?

La restricción `UNIQUE` (nombrada como `uc_nombre`).

¿Qué problema evita `UNIQUE`?

Evita la duplicidad de información en columnas que deben contener valores exclusivos (en este caso, que existan dos videojuegos con exactamente el mismo nombre).

¿En qué campos de tu proyecto tendría sentido utilizarlo?

En campos como el nombre de un producto, códigos SKU, correos electrónicos o números de serie, donde duplicar la información causaría confusiones o errores de inventario.

## 🧪 Experimento 4 — Probando DEFAULT

### 💭 Responde

¿Qué valor apareció?

Apareció el valor `10` en la columna `stock` del registro de `'Elden Ring'`.

¿Quién proporcionó ese valor?

El SGBD (MariaDB) de manera automática.

¿El usuario lo escribió?

No, el usuario omitió por completo el campo `stock` al momento de realizar la instrucción `INSERT`.

¿Qué ventaja tiene utilizar valores predeterminados?

Permite agilizar la inserción de datos y garantiza que los campos obligatorios o de control cuenten con un valor estándar y coherente cuando no se provee uno de forma manual.

¿En qué campo de tu proyecto podría ser útil?

En el stock inicial de los videojuegos, una fecha de alta por defecto o un campo de estado (por ejemplo, definir por defecto que un juego está "Disponible").

## 🧪 Experimento 5 — Probemos una condición

### 💭 Responde

¿Cuál registro fue aceptado?

Aquel que cumplía con la regla lógica (valores mayores o iguales a cero).

¿Cuál fue rechazado?

El registro que intentó introducir un valor inválido (`-150.00` en el precio).

¿Qué condición establece CHECK?

Que la columna `precio` debe contener obligatoriamente un valor numérico de cero en adelante (`>= 0`).

¿Qué problema evita?

Evita que se registren datos lógicamente imposibles o erróneos, como precios negativos o cantidades fuera de rango.

¿Qué otro campo de tu proyecto podría necesitar una condición?

El campo `stock` (para evitar existencias negativas) o el campo `cantidad` en la tabla de ventas.
