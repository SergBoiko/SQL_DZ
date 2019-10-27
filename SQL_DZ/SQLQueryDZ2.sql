SELECT * FROM Employee e1
WHERE e1.Salary > 
(SELECT Salary FROM Employee e2 WHERE e2.Id = e1.ChiefId);

SELECT d.Id,
d.Name,
COUNT(*) 
FROM Department d, Employee e
WHERE d.Id = e.DepartmentId
GROUP BY d.Id, d.Name 
HAVING COUNT(*) < 3;

SELECT * FROM Employee e1
WHERE e1.Salary = 
(SELECT MAX (Salary) FROM Employee)


SELECT MAX (Salary) FROM (SELECT d.Id,
d.Name,
SUM(e.Salary) AS Salary
FROM Department d, Employee e
WHERE d.Id = e.DepartmentId
GROUP BY d.Id, d.Name) x 

SELECT * FROM Employee e1
WHERE ChiefId = NULL OR DepartmentId <> (SELECT DepartmentId FROM Employee e2 WHERE e1.ChiefId = e2.Id);

SELECT * FROM Employee 
ORDER BY Salary 
OFFSET 1 rows 
FETCH NEXT 1 rows only