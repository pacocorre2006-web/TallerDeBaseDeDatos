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

## 🧠 11. INVESTIGA

Responde:

1. ¿Qué significa `SELECT`?
Significa SELECCIONAR y sirve para seleccionar o consultar datos de una tabla de la base de datos.

2. ¿Qué significa `FROM`?
Significa DESDE y es la cláusula que acompaña a SELECT para especificar que tabla se quiere seleccionar.

3. ¿Qué significa `*`?
Significa Todo o Todos y se utiliza en el comando `SELECT *` para que la base de datos nos devuelva todas las columnas de la tabla seleccionada.

4. ¿Qué diferencia existe entre consultar una tabla y modificarla?
Consultar con el comando `SELECT` solo muestra la información sin modificarla
