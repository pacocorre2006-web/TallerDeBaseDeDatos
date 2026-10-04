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
![Captura de pantalla](img/captura04.png)

¿Qué significa el resultado?
Que solo existen dos títulos que su precio es mayor a 100.

**2. Operador Menor que (<) [Punto B]**
¿Cuáles son los juegos cuyo precio es menor a 100.00?
![Captura de pantalla](img/captura05.png)

¿Qué significa el resultado?
Que solo hay dos titulos que su precio sea menor a 100.



## 🔤 8. LIKE



