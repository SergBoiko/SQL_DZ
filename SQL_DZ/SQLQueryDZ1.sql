SELECT d.Name,
       (SELECT COUNT(1) FROM Employee WHERE DepartmentId = d.Id)
           AS [Employees in departments]
FROM Department d
ORDER BY d.Name;