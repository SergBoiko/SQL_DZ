--INSERT INTO Department (Name) VALUES ('Administration'), ('Cafeteria'), ('Human Resources'), ('Power'), ('Shipping'), ('Accounting'), ('Data processing'), ('Cleaning');

--INSERT INTO Employee (ChiefId, Name, DepartmentId) 
--SELECT NULL, 'Bob', d.Id 
--FROM Department d 
--WHERE Name = 'Administration';

--INSERT INTO Employee (ChiefId, Name, DepartmentId)
--VALUES (NULL, 'Steve', (SELECT d.Id FROM Department d WHERE Name = 'Cafeteria')),
--	   (NULL, 'Gordon', (SELECT d.Id FROM Department d WHERE Name = 'Human Resources')),
--	   (NULL, 'Denis', (SELECT d.Id FROM Department d WHERE Name = 'Power')),
--	   (NULL, 'John', (SELECT d.Id FROM Department d WHERE Name = 'Shipping')),
--	   (NULL, 'Samantha', (SELECT d.Id FROM Department d WHERE Name = 'Accounting')),
--	   (NULL, 'Trace', (SELECT d.Id FROM Department d WHERE Name = 'Data processing'));

INSERT INTO Employee (ChiefId, Name, DepartmentId)
SELECT (SELECT TOP 1 Id FROM Employee WHERE Name != 'Bob'), -- подзапрос получения идентификатора начальника
	   Names.Name, -- имя из FROM
	   (SELECT Id FROM Department WHERE Name = 'Administration') -- подзапрос получения идентификатора департамента 'Administration'
FROM (VALUES ('Raymond'), ('Hannah'), ('Ruby')) AS Names(Name);

SELECT * FROM Employee ORDER BY Name; -- смотрим содержимое Employee, отсортированной по колонке Name
SELECT * FROM Employee ORDER BY Name DESC; -- смотрим содержимое Employee, отсортированной по колонке Name в обратном порядке
SELECT * FROM Employee ORDER BY NEWID(); -- смотрим содержимое Employee, отсортированной в случайном порядке, NEWID() - генерация UNIQUEIDENTIFIER (GUID), тобишь сортировка происходит по сгенерированным GUID'ам

-- создать временную таблицу в которой сохраним множество имен для вставки в Employee
CREATE TABLE #names (Name nvarchar(100) UNIQUE);
INSERT INTO #names VALUES ('Lionel'), ('Kermit'), ('Hayden'), ('Rashad'), ('Kimberly'), ('Thaddeus'), ('Brynn'), ('Madonna'), ('Eagan'), ('Rudyard'), ('Aidan'), ('Kim'), ('Oscar'), ('Stewart'), ('Kirk'), ('Keith'), ('Blaine'), ('Eden'), ('Aubrey'), ('Lydia'), ('Rhea'), ('Shelby'), ('Haviva'), ('Miranda'), ('Dorian'), ('Reuben'), ('Michael'), ('Joy'), ('Thane'), ('Cynthia'), ('Chanda'), ('Macey'), ('Fay'), ('Ryder'), ('Olivia'), ('Imelda'), ('Marah'), ('Eric'), ('Denise'), ('Clark'), ('Cheryl'), ('Tyrone'), ('Otto'), ('Dakota'), ('Nora'), ('Neville'), ('Adena'), ('Hiram'), ('Cally'), ('Lois'), ('Cassandra'), ('Herman'), ('Len'), ('Walker'), ('Fiona'), ('Graiden'), ('Hamilton'), ('Cruz'), ('Axel'), ('Velma'), ('Mariam'), ('Jin'), ('Colt'), ('Kaitlin'), ('Frances'), ('Britanni'), ('Linus'), ('Wayne'), ('Knox'), ('Hyacinth'), ('Yael'), ('Lesley'), ('Jaime'), ('Aline'), ('Dalton'), ('Irene'), ('Scarlet'), ('Mariko'), ('Brady'), ('Blair'), ('Madeson'), ('Jena'), ('Josephine'), ('Joel'), ('Moana'), ('Colton'), ('Abbot'), ('Aristotle'), ('Perry'), ('Phillip'), ('Kamal'), ('Lamar'), ('Steel');


DECLARE @currentName nvarchar(100) = (SELECT TOP 1 Name from #names);
DECLARE @departmentId int, @chiefId int; 

WHILE @currentName IS NOT NULL
BEGIN
	SELECT TOP 1 @chiefId = Id, @departmentId = DepartmentId FROM Employee ORDER BY NEWID(); 
	INSERT INTO Employee (ChiefId, Name, DepartmentId) VALUES (@chiefId, @currentName, @departmentId);
	SET @currentName = (SELECT TOP 1 Name from #names);
END;