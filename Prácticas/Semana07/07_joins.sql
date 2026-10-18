SELECT 
    a.nombre AS alumno,
    a.apellido,
    c.materia,
    c.calificacion
FROM alumnos AS a
INNER JOIN calificaciones AS c
    ON a.id_alumno = c.id_alumno
ORDER BY a.nombre;

SELECT 
    a.nombre AS alumno,
    a.apellido,
    c.materia,
    c.calificacion
FROM alumnos AS a
LEFT JOIN calificaciones AS c
    ON a.id_alumno = c.id_alumno
ORDER BY a.nombre;

SELECT 
    a.id_alumno,
    a.nombre,
    a.apellido
FROM alumnos AS a
LEFT JOIN calificaciones AS c
    ON a.id_alumno = c.id_alumno
WHERE c.id_calificacion IS NULL;
