SELECT * FROM Employee e1
WHERE e1.Salary > 
(SELECT Salary FROM Employee e2 WHERE e2.Id = e1.ChiefId);

SELECT d.Id,
d.Name,
COUNT(e.DepartmentId) 
FROM Department d
LEFT JOIN Employee e ON d.Id = e.DepartmentId
GROUP BY d.Id, d.Name 
HAVING COUNT(e.DepartmentId) < 3;

SELECT * FROM Employee e1
WHERE e1.Salary = 
(SELECT MAX (e2.Salary) FROM Employee e2
WHERE e1.DepartmentId = e2.DepartmentId
);


SELECT * FROM (SELECT d.Id,
d.Name,
SUM(e.Salary) AS Salary
FROM Department d, Employee e
WHERE d.Id = e.DepartmentId
GROUP BY d.Id, d.Name) x
WHERE x.Salary = (SELECT MAX (Salary)  FROM (SELECT d.Id,
d.Name,
SUM(e.Salary) AS Salary
FROM Department d, Employee e
WHERE d.Id = e.DepartmentId
GROUP BY d.Id, d.Name) y);

SELECT * FROM Employee e1
WHERE ChiefId IS NULL OR DepartmentId <> (SELECT DepartmentId FROM Employee e2 WHERE e1.ChiefId = e2.Id);

SELECT * FROM Employee 
ORDER BY Salary 
OFFSET 1 rows 
FETCH NEXT 1 rows only