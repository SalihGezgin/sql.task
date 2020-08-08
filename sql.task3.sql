Single-Row Subqueries:
1- Write a query to find the maximum duration among the tracks. Your query should include TrackId, Name, Milliseconds.

SELECT TrackId, name, Milliseconds 
FROM tracks 
WHERE Milliseconds = (SELECT max (Milliseconds) FROM tracks);
------------------------------------------------------
2- Write a query to find the minimum duration among the tracks. Your query should include TrackId, Name, Milliseconds.

SELECT TrackId, name, Milliseconds 
FROM tracks 
WHERE Milliseconds = (SELECT min (Milliseconds) FROM tracks);
------------------------------------------------------
3- Write a query to find the tracks whose bytes are higher than the average of the bytes of all tracks. Your query should 
include TrackId, Name, Bytes, general average and should be ordered by Bytes from highest to lowest. General average is 
the average of all tracks. General average should repeat in every row. (Hint: You need to use two subqueries)

SELECT TrackId, name, Bytes, (SELECT avg(bytes) from tracks) General_AVG 
FROM tracks 
WHERE Bytes > General_AVG 
ORDER BY Bytes DESC;
------------------------------------------------
 Multiple-Row Subqueries:
1- Write a query that returns the customers whose sales representatives are Jane Peacock and Margaret Park. Your query 
should include CustomerID, First Name and Last Name of the customers.

--Multiple-Row Subqueries:
 SELECT CustomerId, FirstName, LastName
 FROM customers
 WHERE SupportRepId IN 
(
 SELECT EmployeeId
 FROM employees
 WHERE (FirstName = 'Jane' and LastName = 'Peacock') 
 or (FirstName = 'Margaret' and LastName = 'Park'))
 
 --Multiple-Row Subqueries WITH JOIN:Rewrite the subquery above using the JOIN.
 2- SELECT CustomerId, C.FirstName, C.LastName
 FROM customers C
 JOIN employees E ON (C.SupportRepId = E.EmployeeId)
 WHERE (E.FirstName = 'Jane' and E.LastName = 'Peacock') 
 or (E.FirstName = 'Margaret' and E.LastName = 'Park');
----------------------------------------------
1- Create a table inside the chinook database. This table tracks the employees’ 
courses inside the organization. Your table should have the followings features:
               Name of the table: courses
               Columns:
                    CourseId (Primary Key)
                    CourseName (Cannot be null)
                    EmployeeId (Foreign Key - Refers to EmployeeId of employees table ) 
                    CoursePrice

CREATE TABLE Courses
(
	Courseld INT PRIMARY KEY, 
	CourseName TEXT NOT NULL,
	EmployeeId INT,
	CoursePrice REAL,
	FOREIGN KEY (EmployeeId) REFERENCES employees(EmployeeId)
	)
------------------------------------------
2- Insert at least 10 rows into the courses table. Your EmployeeId should contain the 
values of the EmployeeId column on the employees table. You’re free to choose any values 
for other columns (CourseId, CourseName, CoursePrice)

INSERT INTO Courses VALUES 
(1, 'SQL', 1, 120.5),
(2, 'SQL', 2, 130.5),
(3, 'Python', 3, 190.0),
(4, 'Python', 4, 210.5),
(5, 'HTML', 5, 130),
(6, 'HTML', 6, 145),
(7, 'DevOps', 7, 150),
(8, 'DevOps', 7, 160.5),
(9, 'Dockers', 1, 100.0),
(10, 'Dockers', 2, 120.0)

SELECT * FROM Courses
------------------------------------
3- Delete the last row of your courses table.

DELETE FROM Courses WHERE Courseld = (SELECT max(Courseld) FROM Courses)

SELECT * FROM Courses  --tablonun son halini görmek icin
-----------------------------------
4- Add a new column to your courses table named StartDate. The new column cannot be null.

ALTER TABLE Courses ADD StartDate date NOT NULL DEFAULT '2020-08-08';

SELECT * FROM Courses; --tablonun son halini görmek icin
------------------------------------------------
5- Delete the CoursePrice column.

--ALTER TABLE Courses DROP COLUMN CoursePrice; -- calismiyor
CREATE TABLE Courses_backup   --sütunu silemedigim icin yeni bir tablo olusturdum.
Daha sonra bunu da silip eski isimi vercgm
(
	Courseld INT PRIMARY KEY, 
	CourseName TEXT NOT NULL,
	EmployeeId INT,
	FOREIGN KEY (EmployeeId) REFERENCES employees(EmployeeId)
	)
SELECT * from Courses_backup
INSERT into Courses_backup SELECT Courseld, CourseName, EmployeeId FROM Courses

DROP TABLE Courses;  -- tabloyu siliyorum

ALTER TABLE Courses_backup RENAME to Courses;  --tabloyu yeniden adlandiriyorum

SELECT * from Courses  --tablonun son halini görmek icin yazdim
-------------------------
6- Delete the courses table.

DROP TABLE if EXISTS Courses;

