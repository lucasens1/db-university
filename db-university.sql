-- Selezionare tutti gli studenti nati nel 1990 ---> 160
SELECT *
FROM `students` 
WHERE YEAR(`date-of-birth`) = "1990";

--Selezionare tutti i corsi che valgono più di 10 crediti --> 479
SELECT * 
FROM `courses` 
WHERE `cfu` > "10";

--Selezionare studenti over 30
SELECT * 
FROM `students` 
WHERE `date_of_birth` <= CURDATE() - INTERVAL 30 YEAR

--Selezionare tutti i corsi del primo semetre del primo anno di un corso di laurea qualsiasi --> 286
SELECT * 
FROM `courses` 
WHERE `period` = "I semestre" 
AND `year` = "1";

--Selezionare tutti gli appelli che avvengono dopo le 14 del 20/06/2020 --> 21
SELECT * 
FROM `exams` 
WHERE HOUR(`hour`) >= "14" 
AND `date` = "2020-06-20";

--Selezionare tutti i corsi di laurea magistrale --> 38
SELECT * 
FROM `degrees` 
WHERE `level` = "magistrale";

--Count dei dipartimenti --> 12
SELECT COUNT(*)
FROM `departments`;

--Numero insegnanti senza Cellulare --> 50
SELECT * 
FROM `teachers` 
WHERE `phone` IS NULL;


--Inserire nella tab students nuovo record coi propri dati, in degree_id valore random 
INSERT INTO `students` (`id`,`degree_id`,`name`,`surname`,`date_of_birth`,`fiscal_code`,`enrolment_date`,`registration_number`,`email`) 
VALUES ("5001","50", "Luca", "Sensini", "1997-09-26", "SLCLCU80A36G123X", "2024-02-14","894298", "luca@sensini.it");

--Cambiare ufficio a Pietro Rizzo in 126
UPDATE `teachers` 
SET `office_number` = "126" 
WHERE `name` = "Pietro" AND `surname` = "Rizzo";

--Eliminarti dopo che ti sei inserito