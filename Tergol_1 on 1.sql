--creating citizens TABLE Q1.
DROP TABLE citizens;
CREATE TABLE citizens
(
	citizen_id INTEGER PRIMARY KEY AUTOINCREMENT,
	full_name TEXT NOT NULL,
	city TEXT
);
--creating id_cards TABLE Q1.
DROP TABLE id_cards;
CREATE TABLE id_cards
(
	citizen_id INTEGER PRIMARY KEY,
	cart_number TEXT UNIQUE NOT NULL,
	expires TEXT,
	FOREIGN KEY (citizen_id) REFERENCES citizens (citizen_id) ON DELETE CASCADE
);
--INSERTing into the table citizens Q2.
INSERT INTO citizens (full_name,city)
VALUES
('Sophia Martinez','Barcelona'),
('James Chen','Toronto'),
('Amira Hassan','Cairo');

--INSERTing into the table id_cards Q3.
INSERT INTO id_cards (citizen_id,cart_number,expires)
VALUES
(1,'ID-2024-5521','expires: 2032-12-15'),
(2,'ID-2023-7744','2031-08-22');

--creating inner-inner join QUERY Q4.
SELECT 
	citizens. citizen_id,
	id_cards.cart_number
FROM citizens
INNER JOIN id_cards ON citizens.citizen_id = id_cards.citizen_id;

--creating left_join QUERY Q5.
SELECT 
	c.full_name,
	coalesce(i.cart_number, 'NO CARD') AS card_info
FROM citizens c
LEFT JOIN id_cards i ON c.citizen_id = i.citizen_id;

--Q7
--INSERT INTO id_cards (citizen_id,cart_number,expires)
--VALUES
--(1,'ID-2025-5521','expires: 2032-12-15');
--q7 ANSWER;
--Execution finished with errors.
--Result: UNIQUE constraint failed: id_cards.citizen_id
--At line 46:
--INSERT INTO id_cards (citizen_id,cart_number,expires)
--VALUES
--(1,'ID-2025-5521','expires: 2032-12-15');
--The problem is that the citizen_id is UNIQUE, therefore, citizen 1 can't have 2 ID


-- DELETING JAMES ID Q8
DELETE FROM citizens 
WHERE full_name = 'James Chen';
SELECT * FROM id_cards;
SELECT * FROM citizens;