# 🗄️ Práctica 03 — ¡Hagamos que nuestra base de datos proteja los datos!

## 📋 Evidencia de Práctica: Restricciones (Constraints) en MariaDB
### 🎯 Objetivo

Comprender qué es una restricción (constraint) en un SGBD, explicar cómo protege la integridad de los datos, e implementar reglas de validación (PRIMARY KEY, NOT NULL, UNIQUE, DEFAULT, CHECK y FOREIGN KEY) en una base de datos relacional mediante la terminal de MariaDB, provocando y analizando errores controlados.

### 🎮 Problema Elegido

Nombre de la Base de Datos: Tiendavideojuegos

Descripción del negocio: Un sistema de gestión para una tienda de videojuegos que lleva el control del catálogo de productos disponibles (Videojuegos) y el registro de las transacciones de salida o compras realizadas (Ventas).

### 🗄️ Tablas Utilizadas y Esquema
1.Tabla: Videojuegos

Almacena el catálogo de productos disponibles en la tienda.

id_videojuego: Identificador único del videojuego (INT, PRIMARY KEY, AUTO_INCREMENT).

nombre: Nombre del videojuego (VARCHAR(100), NOT NULL, UNIQUE).

plataforma: Consola o sistema compatible (VARCHAR(50)).

precio: Costo del producto (DECIMAL(10,2), con restricción CHECK (precio >= 0)).

stock: Cantidad disponible en inventario (INT, con valor predeterminado DEFAULT 10, CHECK (stock >= 0)).

genero: Categoría del videojuego (VARCHAR(50)).

2.Tabla: Ventas

Almacena el registro histórico de las ventas efectuadas.

id_venta: Identificador único de cada venta (INT, PRIMARY KEY, AUTO_INCREMENT).

id_videojuego: Clave foránea que referencia al producto vendido (INT, FOREIGN KEY hacia Videojuegos(id_videojuego)).

cantidad: Unidades vendidas (INT).

fecha: Fecha de la transacción (DATE).

### 🛡️ Restricciones Implementadas

PRIMARY KEY: Aplicada en id_videojuego (tabla Videojuegos) y id_venta (tabla Ventas).

NOT NULL: Aplicada en id_videojuego y nombre para asegurar que todo producto tenga un título obligatorio.

UNIQUE: Aplicada en la columna nombre (uc_nombre) para evitar títulos duplicados en el catálogo.

DEFAULT: Aplicada en la columna stock (DEFAULT 10) para asignar una existencia inicial automática.

CHECK: Aplicada en precio (chk_precio: precio >= 0) para prohibir valores negativos.

FOREIGN KEY: Aplicada en Ventas(id_videojuego) (fk_ventas_videojuegos) referenciando a Videojuegos(id_videojuego) para mantener la integridad referencial.

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

## 🧪 Experimento 6 — Referencia inexistente

### 💭 Responde

¿El registro fue aceptado?

No, la operación fue rechazada por la base de datos.

¿Por qué?

Porque el identificador `999` que se especificó en `id_videojuego` no existe previamente en la tabla principal `Videojuegos`.

¿Qué restricción intervino?

La clave foránea (`FOREIGN KEY`, nombrada como `fk_ventas_videojuegos`).

¿Qué tabla contiene la clave primaria?

La tabla `Videojuegos` (en su columna `id_videojuego`).

¿Qué tabla contiene la clave foránea?

La tabla `Ventas` (en su columna `id_videojuego`).

¿Qué problema evita esta restricción?

Evita la inconsistencia de datos (registros huérfanos), garantizando que no se puedan registrar ventas de productos que jamás han existido en el catálogo.

## 🧪 Experimento 7 — Investiga tu propia tabla

### 💭 Responde

¿Qué información muestra `DESCRIBE`?

Muestra un resumen tabular de la estructura de la tabla, detallando el nombre de cada campo (`Field`), su tipo de dato (`Type`), si permite valores nulos (`Null`), si está asociada a alguna llave (`Key`), su valor por defecto (`Default`) y propiedades extra como `auto_increment`.

¿Qué información adicional encuentras en `SHOW CREATE TABLE`?

Muestra el código SQL completo y exacto (`CREATE TABLE`) con el que se generó la tabla, incluyendo los nombres explícitos de las restricciones (CONSTRAINT uc_nombre, CONSTRAINT uc_nombre, CONSTRAINT fk_ventas_videojuegos), las reglas específicas de los `CHECK` y `FOREIGN KEY`, además del motor de almacenamiento (`ENGINE=InnoDB`) y la codificación de caracteres.

¿Dónde puedes identificar la clave primaria?

En `DESCRIBE`, se identifica porque en la columna `Key` aparece la etiqueta `PRI` (por ejemplo, en `id_videojuego` de la tabla `Videojuegos` y `id_venta` en `Ventas`). En `SHOW CREATE TABLE`, se identifica en la línea que declara de forma explícita `PRIMARY KEY ('nombre_columna')`.

¿Dónde puedes identificar las claves foráneas?

En `DESCRIBE`, la columna que actúa como clave foránea (`id_videojuego` en la tabla `Ventas`) muestra la etiqueta `MUL` (índice múltiple), aunque no detalla a qué tabla apunta. En cambio, en `SHOW CREATE TABLE`, se observa de manera completa con la sentencia `FOREIGN KEY ('id_videojuego') REFERENCES 'Videojuegos' ('id_videojuego')`.

¿Por qué es importante poder inspeccionar la definición de una tabla?

Porque nos permite auditar, verificar y comprobar con total certeza qué reglas de integridad, tipos de datos, valores por defecto y relaciones están activas en el SGBD, lo cual es fundamental para corregir errores, dar mantenimiento o documentar el diseño del esquema.

## 🔎 Verificación de la Estructura (`DESCRIBE` y `SHOW CREATE TABLE`)
(capturas DESCRIBE y SHOW CREATE TABLE)

## 🧠 14. Investigación

¿Qué es una constraint?

Es una regla o condición lógica que se le aplica a una o varias columnas de una tabla para limitar qué tipo de datos pueden ser aceptados y almacenados por el SGBD.

¿Qué es la integridad de datos?

Es la certeza de que la información guardada en la base de datos es exacta, confiable, consistente y válida a lo largo del tiempo.

¿Qué es PRIMARY KEY?

Es una restricción que identifica de manera única e irrepetible a cada fila o registro dentro de una tabla (no admite valores nulos ni duplicados).

¿Qué es FOREIGN KEY?

Es una restricción que enlaza una columna de una tabla con la clave primaria de otra tabla, con el fin de establecer y proteger una relación lógica entre ambas.

¿Qué es NOT NULL?

Es una restricción que obliga a que una columna siempre tenga un valor obligatorio, impidiendo que el usuario deje el campo vacío (NULL).

¿Qué es UNIQUE?

Es una restricción que garantiza que todos los valores almacenados en una columna sean exclusivos, evitando que se repitan datos.

¿Qué es DEFAULT?

Es una regla que asigna un valor predeterminado a una columna de forma automática en caso de que el usuario omita dicho campo al momento de insertar un registro.

¿Qué es CHECK?

Es una restricción que evalúa una condición lógica específica para los datos de una columna (por ejemplo, obligar a que un precio sea mayor o igual a cero).

¿Qué es la integridad referencial?

Es el mecanismo que asegura que las relaciones entre las tablas se mantengan coherentes, impidiendo que existan referencias a datos que no existen (registros huérfanos).

¿Qué diferencia existe entre una clave primaria y una clave foránea?

La clave primaria (PRIMARY KEY) identifica de forma única a cada registro dentro de su propia tabla; en cambio, la clave foránea (FOREIGN KEY) hace referencia a la clave primaria de otra tabla para vincularlas.

¿Por qué una clave foránea debe hacer referencia a un registro existente?

Para mantener la coherencia de los datos; si se permitiera apuntar a un registro inexistente, se generarían inconsistencias o información rota en el sistema.

¿Qué sucede cuando intentamos insertar un dato que viola una restricción?

El SGBD interrumpe la operación de inmediato, rechaza el almacenamiento del registro y devuelve un mensaje de error detallado indicando qué regla se incumplió.

¿Qué diferencia existe entre DESCRIBE y SHOW CREATE TABLE?

DESCRIBE muestra un resumen rápido en forma de tabla con las columnas, tipos de datos y llaves principales; mientras que SHOW CREATE TABLE despliega el código SQL completo y exacto (CREATE TABLE) con el que se generó la estructura, mostrando los nombres de las restricciones, motores y codificaciones.

¿Por qué es importante que las reglas estén implementadas en la base de datos?

Porque la base de datos es la última línea de defensa de la información. Si las reglas solo dependieran de la interfaz o del código de una aplicación, un error de programación o una inserción directa por consola podría corromper los datos.

¿Qué restricciones utilizaste en tu proyecto y por qué?

En el proyecto TiendaVideojuegos utilicé:

PRIMARY KEY en id_videojuego y id_venta para identificar unívocamente cada producto y cada transacción.

NOT NULL en nombre de los videojuegos para evitar registrar productos sin identificación.

UNIQUE en nombre (uc_nombre) para impedir que existan dos videojuegos con exactamente el mismo título.

DEFAULT en stock con un valor de 10 para asignar una existencia inicial automática.

CHECK en el precio (chk_precio) para asegurar que no se registren precios negativos.

FOREIGN KEY en la tabla Ventas (fk_ventas_videojuegos) apuntando a Videojuegos, garantizando que solo se puedan registrar ventas de productos que realmente existen en el catálogo.

### 🌟 Reflexión Final

Implementar restricciones directamente en el motor de base de datos (SGBD) es fundamental porque actúa como la última línea de defensa de la información. Confiar únicamente en la validación de la interfaz de usuario deja abierta la posibilidad de que errores de código o inserciones directas por consola corrompan los datos. Con el uso de PRIMARY KEY, NOT NULL, UNIQUE, DEFAULT, CHECK y FOREIGN KEY, garantizamos que la base de datos mantenga su consistencia, unicidad e integridad referencial de forma automática.


