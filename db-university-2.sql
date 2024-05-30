/* 
1. Contare quanti iscritti ci sono stati ogni anno
2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
3. Calcolare la media dei voti di ogni appello d'esame
4. Contare quanti corsi di laurea ci sono per ogni dipartimento 
*/

-- 1 
SELECT YEAR(`students`.`enrolment_date`) AS anno_immatricolazione, COUNT(`students`.`id`) AS conteggio_matricole
FROM `students`
GROUP BY YEAR(`students`.`enrolment_date`);

-- 2
SELECT COUNT(`teachers`.`id`) AS `teacher_ed`, `teachers`.`office_address` 
FROM `teachers` 
GROUP BY `teachers`.`office_address`;

-- 3 
SELECT AVG(`exam_student`.`vote`) AS `voto_medio` , `exam_student`.`exam_id`
FROM `exam_student`
GROUP BY `exam_student`.`exam_id`;

-- 3 Alternativa 
SELECT AVG(`exam_student`.`vote`) AS `voto_medio` , `courses`.`name`
FROM `exam_student`
INNER JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
INNER JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
GROUP BY `exam_student`.`exam_id`;

-- 4
SELECT COUNT(`degree`.`id`), `departments`.`name`
FROM `degree`
INNER JOIN `departments`
ON `degree`.`department_id` = `departments`.`id`
GROUP BY `departments`.`name`;

------------------------------------------------------------------


/* 
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome
5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
superare ciascuno dei suoi esami 
*/

-- 1
SELECT * 
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2 
SELECT * 
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = "Magistrale"
AND `departments`.`name` = "Dipartimento di Neuroscienze";

-- 3 
SELECT * 
FROM `courses`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`name` = "Fulvio" AND `teachers`.`surname` = "Amato";

-- 4
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `degrees`.`name`, `departments`.`name` 
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`name`, `students`.`surname`;

-- 5
SELECT *
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`;

-- 6
SELECT DISTINCT `teachers`.*
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica";

-- 7 BONUS
