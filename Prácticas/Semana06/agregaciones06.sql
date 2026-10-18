SELECT COUNT(*) AS total_alumnos 
FROM alumnos;

SELECT 
    SUM(calificacion) AS suma_total_calificaciones,
    AVG(calificacion) AS promedio_general,
    MIN(calificacion) AS calificacion_minima,
    MAX(calificacion) AS calificacion_maxima
FROM calificaciones;

SELECT 
    semestre,
    COUNT(*) AS cantidad_alumnos
FROM alumnos
GROUP BY semestre;

SELECT 
    semestre,
    COUNT(*) AS cantidad_alumnos
FROM alumnos
GROUP BY semestre
HAVING COUNT(*) >= 2;

SELECT 
    semestre,
    COUNT(*) AS cantidad_alumnos
FROM alumnos
GROUP BY semestre
ORDER BY cantidad_alumnos DESC;

SELECT 
    semestre,
    COUNT(*) AS cantidad_alumnos
FROM alumnos
GROUP BY semestre
ORDER BY cantidad_alumnos ASC;
