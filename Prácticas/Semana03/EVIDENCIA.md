# 🗄️ Práctica 03 — ¡Hagamos que nuestra base de datos proteja los datos!


## 🧪 Experimento 1 — Intentemos romper la PRIMARY KEY

### 💭 Responde
¿Qué ocurrió? La base de datos rechazó la inserción del nuevo registro.

¿El registro fue aceptado? No, fue denegado por completo.

¿Por qué? Porque el identificador 1 ya estaba asignado a otro registro (`` `Minecraft` ``), violando la regla de exclusividad.

¿Qué restricción intervino? La `` `PRIMARY KEY` ``.

¿Qué información proporciona el mensaje de error? Indica que hubo una entrada duplicada (`` ´Duplicate entry '1' ``) específicamente para la llave primaria (`` `PRIMARY` ``), impidiendo que se rompa la unicidad de los registros.
