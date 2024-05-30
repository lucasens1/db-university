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