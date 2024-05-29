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

--Selezionare tutti gli appelli che avvengono dopo le 14 del 20/06/2020 --> 21

--Selezionare tutti i corsi di laurea magistrale --> 38

--Count dei dipartimenti --> 12

--Numero insegnanti senza Cellulare --> 50

--Inserire nella tab students nuovo record coi propri dati, in degree_id valore random 

--Cambiare ufficio a Pietro Rizzo in 126

--Eliminarti dopo che ti sei inserito