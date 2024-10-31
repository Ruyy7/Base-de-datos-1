-- CONSULTAS SQL
SELECT dni,nombre,apellido
FROM dueño
WHERE dni NOT IN (SELECT dni
                  FROM chofer)


SELECT patente,id_chofer
FROM auto a INNER JOIN chofer c ON(a.id_chofer = c.id_chofer)
WHERE c.fecha_licencia_hasta = 01/01/2024

SELECT nombreCompleto
FROM estudiante
WHERE estudiante.añoDeIngreso = 2019

SELECT nombreCompleto
FROM estudiante
WHERE estudiante.nacionalidad = "Argentina" and estudiante.códigoDeCarrera <> "LI07"