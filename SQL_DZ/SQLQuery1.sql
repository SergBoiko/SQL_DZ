CREATE OR ALTER VIEW EmployeeByDepartment
AS
	SELECT e.Id, e.Name, e.ChiefId, e.Salary, d.Id as DepartmentId, d.Name as DepartmentName
	FROM Employee e
	INNER JOIN Department d ON e.DepartmentId = d.Id;
GO

SELECT * FROM EmployeeByDepartment WHERE DepartmentName = 'Administration';