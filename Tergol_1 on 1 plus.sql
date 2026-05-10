--Q1
DROP TABLE patients;
CREATE TABLE patients
(
	patient_id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	patients_name TEXT NOT NULL,
	blood_type TEXT
);

--Q2
DROP TABLE medical_files;
CREATE TABLE medical_files
(
	file_id INTEGER PRIMARY KEY AUTOINCREMENT,
	patient_ref UNIQUE,
	allergies TEXT,
	emergency_contect TEXT,
	FOREIGN KEY (patient_ref) REFERENCES patients (patient_id) ON DELETE CASCADE
);

--Q3
INSERT INTO patients (patients_name,blood_type)
VALUES
	('Dr. Aisha Khan','O+'),
	('Marcus Williams','AB-'),
	('Dr. Priya Singh','B+');

--Q4
INSERT INTO medical_files (patient_ref,allergies,emergency_contect)
VALUES
	(1,'allergies: Penicillin','contact: +1-555-0101'),
	(2,'allergies: None','contact: +1-555-0202');
	
--Q5
SELECT 
	p.*,
	COALESCE(m.allergies, 'No medical history') AS allergies,
	COALESCE(m.emergency_contect, 'No medical history') AS emergency_contact
FROM patients p
LEFT JOIN medical_files m ON p.patient_id = m.patient_ref;


--Q6
--INSERT INTO medical_files (patient_ref,allergies,emergency_contect)
--VALUES
--	(1,'allergies: pampkin','contact: +1-555-0101');
--Execution finished with errors.
--Result: UNIQUE constraint failed: medical_files.patient_ref
--At line 42:
--INSERT INTO medical_files (patient_ref,allergies,emergency_contect)
--VALUES
	--(1,'allergies: pampkin','contact: +1-555-0101');

--The problem is it canot be added becuase it's UNIQUE, there can not be 2 of the same patients.

--Q7
DELETE FROM patients
WHERE patient_id = 1;
SELECT * FROM patients;
SELECT * FROM medical_files;