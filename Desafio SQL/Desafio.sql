-- Paso 1: Exploración Inicial de Datos
-- Pregunta: ¿Cuáles son los nombres de las columnas Student_id, Hours_Studied, y Exam_Score de los estudiantes?
SELECT 
    Student_id, 
    Hours_Studied, 
    Exam_Score 
FROM 
    `make-it-real-tarea-clase.clase_mir.student`;

-- Paso 2: Uso de WHERE para Filtrar Datos
-- Pregunta: ¿Cuáles son los estudiantes que han estudiado más de 20 horas y su puntaje en el examen?
SELECT 
    Student_id, 
    Hours_Studied, 
    Exam_Score 
FROM 
    `make-it-real-tarea-clase.clase_mir.student` 
WHERE 
    Hours_Studied > 20;

-- Paso 3: Uso de GROUP BY y Funciones de Agregación
-- Pregunta: ¿Cuál es el promedio de horas estudiadas y el puntaje en el examen según el tipo de escuela?
SELECT 
    School_Type, 
    AVG(Hours_Studied) AS Average_hours,
    AVG(Exam_Score) AS Average_score 
FROM 
    `make-it-real-tarea-clase.clase_mir.student` 
GROUP BY 
    School_Type;

-- Paso 4: Filtrado con HAVING
-- Pregunta: ¿Qué tipos de escuelas tienen un puntaje promedio de examen mayor a 80?
SELECT 
    School_Type, 
    AVG(Exam_Score) AS Average_score 
FROM 
    `make-it-real-tarea-clase.clase_mir.student` 
GROUP BY 
    School_Type 
HAVING 
    AVG(Exam_Score) > 80;

-- Paso 5: Uso de ORDER BY y LIMIT
-- Pregunta: ¿Quiénes son los 5 estudiantes que más horas han estudiado?
SELECT 
    Student_id, 
    Hours_Studied 
FROM 
    `make-it-real-tarea-clase.clase_mir.student` 
ORDER BY 
    Hours_Studied DESC 
LIMIT 5;

-- Paso 6: Uso de IF y CASE
-- Pregunta: ¿Cómo se clasifican los estudiantes en función de sus horas estudiadas?
SELECT 
    Student_id, 
    Hours_Studied, 
    IF(Hours_Studied > 20, 'Más de 20 horas', 'Menos de 20 horas') AS clasificacion_horas
FROM 
    `make-it-real-tarea-clase.clase_mir.student`;

-- Pregunta: ¿Cómo se clasifican los estudiantes por su puntaje en el examen?
SELECT 
    Student_id, 
    Exam_Score, 
    CASE
        WHEN Exam_Score >= 80 THEN 'Alta' 
        WHEN Exam_Score >= 50 THEN 'Media' 
        ELSE 'Baja' 
    END AS clasificacion_puntaje 
FROM 
    `make-it-real-tarea-clase.clase_mir.student`;

-- Paso 7: Uso de Funciones de Agregación: COUNT, SUM y AVG
-- Pregunta: ¿Cuántos estudiantes pertenecen a cada tipo de escuela?
SELECT 
    School_Type, 
    COUNT(Student_id) AS Num_student
FROM 
    `make-it-real-tarea-clase.clase_mir.student` 
GROUP BY 
    School_Type;

-- Pregunta: ¿Cuál es la suma total de horas estudiadas por los estudiantes de cada tipo de escuela?
SELECT 
    School_Type, 
    SUM(Hours_Studied) AS Total_Hours_Studied
FROM 
    `make-it-real-tarea-clase.clase_mir.student`
GROUP BY 
    School_Type;

-- Pregunta: ¿Cuál es el promedio de puntaje en el examen de los estudiantes con asistencia mayor a 80?
SELECT 
    AVG(Exam_Score) AS Average_Exam_Score 
FROM 
    `make-it-real-tarea-clase.clase_mir.student`
WHERE 
    Attendance > 80;
