-- CREAR BASE DE DATOS
CREATE DATABASE "desafio2-Pablo-Goeppinger-259";
-- PARA CONECTAR A LA BBDD
\c desafio2-Pablo-Goeppinger-259

-- CREAR TABLA
CREATE TABLE IF NOT EXISTS INSCRITOS(id SERIAL PRIMARY KEY, cantidad INT, fecha DATE, fuente
VARCHAR);
-- AGREGAR DATOS
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- 1. ¿Cuántos registros hay?

SELECT COUNT(*) AS "Total Registros Tabla" FROM INSCRITOS;

-- 2. ¿Cuántos inscritos hay en total?

SELECT SUM(cantidad) AS "Total Personas Inscritas" FROM INSCRITOS;

-- 3. ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT * FROM INSCRITOS WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);

-- 4. ¿Cuántos inscritos hay por día? 

SELECT fecha, SUM(cantidad) AS "Inscritos por dia" FROM INSCRITOS GROUP BY fecha ORDER BY fecha;

-- 5. ¿Cuántos inscritos hay por fuente?

SELECT fuente, SUM(cantidad) AS "Inscritos por fuente" FROM INSCRITOS GROUP BY fuente ORDER BY fuente;

-- 6. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

SELECT fecha, SUM(cantidad) AS INSCRITOS_DIA FROM INSCRITOS GROUP BY fecha ORDER BY INSCRITOS_DIA DESC LIMIT 1;

-- 7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?

SELECT fuente, fecha, cantidad FROM INSCRITOS WHERE cantidad = (SELECT MAX(cantidad) FROM INSCRITOS WHERE fuente = 'Blog') AND fuente = 'Blog';

-- 8. ¿Cuántas personas en promedio se inscriben en un día?

SELECT ROUND(AVG(total_dia),2) AS "Promedio Inscritos por dia" FROM (SELECT SUM(cantidad) AS total_dia, fecha FROM INSCRITOS GROUP BY fecha) AS TOTALES_POR_DIA;

-- 9. ¿Qué días se inscribieron más de 50 personas?

SELECT fecha, SUM(cantidad) AS "Total Personas por dia" FROM INSCRITOS GROUP BY fecha HAVING SUM(cantidad) > 50;

-- 10.  ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?

SELECT ROUND(AVG(total_dia),2) AS "Promedio Inscritos por dia" FROM (SELECT SUM(cantidad) AS total_dia, fecha FROM INSCRITOS WHERE fecha >= '01/03/2021' GROUP BY fecha) AS TOTALES_POR_DIA;

-- \c postgres
-- DROP DATABASE "desafio2-Pablo-Goeppinger-259";