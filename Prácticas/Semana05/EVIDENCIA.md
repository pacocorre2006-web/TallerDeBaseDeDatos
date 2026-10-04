# 💻 Práctica 05 — Consultas SELECT

## 🎯 1. Objetivo

Convertir preguntas humanas y necesidades de negocio reales en consultas SQL precisas y eficientes utilizando el comando `SELECT` y sus diferentes cláusulas de filtrado, operadores lógicos, patrones de texto, rangos y ordenamiento. Aprender a ir más allá de la recuperación de tablas completas, enfocándose en extraer exactamente la información requerida para la toma de decisiones, aplicando buenas prácticas de sintaxis y analizando el comportamiento de los datos en un entorno de base de datos relacional (MySQL / MariaDB).

## 2. 🗄️ Base de datos utilizada

* **Nombre de la base de datos:** `TiendaVideojuegos`

* **Descripción:** Entorno relacional diseñado para administrar el inventario de un establecimiento comercial de videojuegos. Permite registrar catálogos por plataforma, control de precios, stock disponible y el registro de transacciones de venta bajo estrictas reglas de integridad referencial.

## 3. 📋 Tablas utilizadas

### 🎮 1. Tabla: `Videojuegos`
Almacena el catálogo general e inventario disponible de los artículos en la tienda.
* **Estructura y Tipos de Datos:**
  * `id_videojuego`: `int(11)` (Clave primaria, Auto_increment)
  * `nombre`: `varchar(100)` (Clave única, No nulo)
  * `plataforma`: `varchar(50)` (Permite nulos)
  * `precio`: `decimal(10,2)` (Permite nulos)
  * `stock`: `int(11)` (Valor predeterminado: 10)
  * `genero`: `varchar(50)` (Permite nulos)

### 🛒 2. Tabla: `Ventas`
Registra las transacciones comerciales vinculadas al catálogo de videojuegos.
* **Estructura y Tipos de Datos:**
  * `id_venta`: `int(11)` (Clave primaria, Auto_increment)
  * `id_videojuego`: `int(11)` (Clave foránea relacionada con el catálogo)
  * `cantidad`: `int(11)` (Permite nulos)
  * `fecha`: `date` (Permite nulos)
  
## 📊 4. SELECT básico

![Captura de pantalla](img/captura01.png)

Se utilizó el comando `SELECT * FROM Videojuegos;` para seleccionar y mostrar todas las columnas disponibles en la tabla `Videojuegos`.

## 🎯 5. SELECT de columnas específicas

![Captura de pantalla](img/captura02.png)

Se utilizó el comando `SELECT * FROM Videojuegos;` para seleccionar y mostrar todas las columnas disponibles en la tabla `Videojuegos`, y después se utilizó el comando `SELECT id_videojuego, nombre FROM Videojuegos;` para seleccionar y mostrar únicamente las columnas específicas de `id_videojuego` y `nombre` de los registros.

### 📝 Documenta

| Consulta | ¿Qué devuelve? |
| :--- | :--- |
| `SELECT *` | Muestra todas las columnas de la tabla |
| `SELECT columna1, columna2` | Muestra únicamente las columnas especificadas |

## 🔎 6. WHERE

![Captura de pantalla](img/captura03.png)

Se utilizó el comando `SELECT * FROM Videojuegos WHERE plataforma = 'PS5';` para mostrar los registros de la tabla `Videojuegos` que coincida exactamente con `PS5` para obtener los juegos que le corresponden.

### 📝 INVESTIGACIÓN

¿Qué diferencia existe entre: `=` y: `LIKE`?
El operador `=` se utiliza para buscar coincidencias exactas.
El operador `LIKE` se utiliza para realizar busquedas aproximadas o patrones.

## 🔢 7. Operadores

**1. Operador Mayor que (>) [Punto A]**

¿Cuáles son los videojuegos del inventario cuyo precio es mayor a 100.00?
![Captura de pantalla](img/captura05.png)

¿Qué significa el resultado?
Que solo existen dos títulos que su precio es mayor a 100.

**2. Operador Menor que (<) [Punto B]**

¿Cuáles son los juegos cuyo precio es menor a 100.00?
![Captura de pantalla](img/captura06.png)

¿Qué significa el resultado?
Que solo hay dos titulos que su precio sea menor a 100.

**3. Operador Mayor o igual que (>=) [Punto C]**

¿Qué videojuegos cuentan con un stock disponible mayor o igual a 10 unidades?
![Captura de pantalla](img/captura07.png)

¿Qué significa el resultado?
Que solo muestra los productos que tienen un stock mayor o igual a 10.

**4. Operador Menor o igual que (<=) [Punto D]**

¿Cuáles videojuegos tienen un stock menor o igual a 10 unidades?
![Captura de pantalla](img/captura08.png)

¿Qué significa el resultado?
Muestra los productos que están por agotarse

**5. Operador Diferente de (<>) [Punto E]**

¿Cuáles videojuegos NO pertenecen a la plataforma de PS5?
![Captura de pantalla](img/captura09.png)

¿Qué significa el resultado?
Excluye todos los juegos de una consola en especifico y muestra los demas.

## 🔤 8. LIKE

**A) Nombres que comiencen con una letra determinada**

![Captura de pantalla](img/captura10.png)

**Explicación:**Filtra y devuelve únicamente los registros donde el título inicia con la letra "F".

**B) Nombres que terminen con una secuencia determinada**
![Captura de pantalla](img/captura11.png)

**Explicación:**Muestra registros que terminen con el número "5".

**C) Nombres que contengan una palabra o fragmento**
![Captura de pantalla](img/captura12.png)

**Explicación:**Muestra solo los registros que comiencen con "The".

## 📋 9. IN 

![Captura de pantalla](img/captura13.png)

**¿Qué hace el operador `IN`?**
Permite buscar varios valores evitando escribir varios `OR`.

## 📏 10. BETWEEN

**A) Una consulta utilizando un rango numérico (Precios)**

`SELECT nombre, precio FROM Videojuegos WHERE precio BETWEEN 30.00 AND 100.00;`

**Explicación:** El operador `BETWEEN` simplifica la búsqueda dentro de un intervalo cerrado, evitando usar condiciones combinadas con operadores de mayor o menor igual.

**B) Una consulta utilizando otro rango que tenga sentido para tu proyecto (Stock)**

`SELECT nombre, stock FROM Videojuegos WHERE stock BETWEEN 5 AND 20;`

**Explicación:** Simplifica la busqueda de la cantidad de productos que quedan sin utilizar el mayor o menor igual.

**C) Comprobación de límites**

Valor inicial: 30.00

Valor final: 100.00

¿Se incluyó el inicial?: Sí

¿Se incluyó el final?: Sí 

Evidencia:

![Captura de pantalla](img/captura14.png)

![Captura de pantalla](img/captura15.png)

## ❓ 11. IS NULL / IS NOT NULL

Se utilizó el comando `SELECT * FROM Videojuegos WHERE genero IS NULL;` para comprobar que no existen registros con valores vacíos o nulos en dicha columna (devolviendo un conjunto vacío), y posteriormente se utilizó el comando `SELECT * FROM Videojuegos WHERE genero IS NOT NULL;` para filtrar y mostrar todos los registros que sí cuentan con un género asignado correctamente.

![Captura de pantalla](img/captura16.png)

### 📝 RESPONDE

1. ¿Cuántos registros tienen NULL?
Respuesta: 0 registros.

2. ¿Cuántos no tienen NULL?
Respuesta: 5 registros.

3. ¿Qué diferencia existe entre ambas consultas?
Respuesta: `IS NULL` busca los registros donde no hay información.
`IS NOT NULL` hace lo contrario, muestra los registros que si tienen información.

4. ¿Qué problema de información puede revelar un NULL?
* Datos incompletos o errores de capturas: información que el usuario olvida ingresar.
* Falta de integridad o estandarización: desconocimiento del dato.

5. ¿Cuándo puede ser válido permitir NULL?
Es válido y útil permitir valores NULL en situaciones donde la informació es opcional o aún no se conoce.

## 🧹 12. DISTINCT

![Captura de pantalla](img/captura17.png)

* Primera consulta (`SELECT plataforma FROM Videojuegos;`): Muestra los 5 registros totales de la tabla.

* Segunda consulta (`SELECT DISTINCT plataforma FROM Videojuegos;`): Filtra y elimina los duplicados, devolviendo únicamente 4 filas.

## 🔤 13. Alias

![Captura de pantalla](img/captura18.png)

* **Explicación:** Esta consulta selecciona las columnas `nombre` y `precio`, pero cambia sus encabezados en pantalla por `videojuego` y `costo`.

## 🔀 14. AND / OR / NOT

**Consulta A: Dos condiciones utilizando AND**

* Pregunta: ¿Cuáles videojuegos pertenecen a la plataforma PS5 y tienen un precio menor a 50.00?

* SQL:
`SELECT * FROM Videojuegos WHERE plataforma = 'PS5' AND precio < 50.00;`

* Resultado:
`FIFA 25` | `PS5` | `34.99`

* Explicación: El operador AND exige que ambas condiciones se cumplan.

**Consulta B: Dos condiciones utilizando OR**

* Pregunta: ¿Qué videojuegos pertenecen a la plataforma PC o a la plataforma Xbox?

* SQL:
SELECT * FROM Videojuegos WHERE plataforma = 'PC' OR plataforma = 'Xbox';

* Resultado:
`GTA V` | `Xbox`
`Cyberpunk 2077` | `PC`

* Explicación: El operador OR es más flexible; basta con que se cumpla al menos una de las condiciones para que el registro sea seleccionado e incluido en los resultados de la consulta.

**Consulta C: Una condición negada utilizando NOT**

* Pregunta: ¿Cuáles videojuegos NO pertenecen a la plataforma PS5?

* SQL:
`SELECT * FROM Videojuegos WHERE NOT plataforma = 'PS5';`

* Resultado:

`GTA V` | `Xbox`
`Cyberpunk 2077` | `PC`
`The Legend of Zelda: Tears of the Kingdom` | `Nintendo Switch`

* Explicación: El operador `NOT` hace que no busque la información que se indique.

![Captura de pantalla](img/captura19.png)

## 📊 15. ORDER BY

**1. Orden ascendente (`ASC`) con columna numérica (Precios)**

![Captura de pantalla](img/captura20.png)

**2. Orden descendente (`DESC`) con columna numérica (Precios)**

![Captura de pantalla](img/captura21.png)

**3. Orden por una columna de texto (Nombres de los videojuegos)**

![Captura de pantalla](img/captura22.png)

## 🔥 16. Diez preguntas de negocio

| # | Pregunta humana | SQL utilizado | Concepto |
|---|---|---|---|
| 1 | ¿Cuáles son los videojuegos que pertenecen exclusivamente a la plataforma de mayor preferencia (PS5)? | `SELECT nombre, plataforma FROM Videojuegos WHERE plataforma = 'PS5';` | Filtrado básico por igualdad (`=`) |
| 2 | ¿Qué títulos del inventario superan las 100 unidades monetarias de costo para considerarse de gama alta? | `SELECT nombre, precio FROM Videojuegos WHERE precio > 100.00;` | Operador de comparación mayor que (`>`) |
| 3 | ¿Cuáles son los productos más económicos del catálogo cuyo precio es menor a 60.00? | `SELECT nombre, precio FROM Videojuegos WHERE precio < 60.00;` | Operador de comparación menor que (`<`) |
| 4 | ¿Qué videojuegos cuentan con una disponibilidad en almacén mayor o igual a 20 unidades para evitar desabasto? | `SELECT nombre, stock FROM Videojuegos WHERE stock >= 20;` | Operador mayor o igual que (`>=`) |
| 5 | ¿Cuáles títulos tienen un stock crítico menor o igual a 5 unidades que requieran reabastecimiento urgente? | `SELECT nombre, stock FROM Videojuegos WHERE stock <= 5;` | Operador menor o igual que (`<=`) |
| 6 | ¿Qué juegos de la tienda inician con la letra 'F' en su nombre corporativo o comercial? | `SELECT * FROM Videojuegos WHERE nombre LIKE 'F%';` | Búsqueda por patrón inicial (`LIKE`) |
| 7 | ¿Cuáles videojuegos están disponibles dentro del rango de plataformas principales (PS5, Xbox, PC)? | `SELECT * FROM Videojuegos WHERE plataforma IN ('PS5', 'Xbox', 'PC');` | Filtrado por conjunto de valores (`IN`) |
| 8 | ¿Qué productos se encuentran en un rango de precios intermedio entre 30.00 y 100.00 unidades? | `SELECT nombre, precio FROM Videojuegos WHERE precio BETWEEN 30.00 AND 100.00;` | Consulta por rangos numéricos (`BETWEEN`) |
| 9 | ¿Cuáles son los nombres únicos y diferentes de las consolas registradas en el sistema sin mostrar duplicados? | `SELECT DISTINCT plataforma FROM Videojuegos;` | Eliminación de registros repetidos (`DISTINCT`) |
| 10 | ¿Qué videojuegos del género RPG tienen un precio superior a 500.00 organizados del más caro al más barato? | `SELECT nombre, genero, precio FROM Videojuegos WHERE genero = 'RPG' AND precio > 500.00 ORDER BY precio DESC;` | Consultas combinadas (`AND`) y ordenamiento (`ORDER BY DESC`) |
