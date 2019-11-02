CREATE OR ALTER PROCEDURE InsertEmployee
	@Name nvarchar(100),
	@ChiefName nvarchar(100),
	@Salary money,
	@DepartmentName nvarchar(100),
	@EmployeeId int = NULL OUTPUT

AS
BEGIN
	DECLARE @DepartmentId int = (SELECT Id FROM Department WHERE Name = @DepartmentName);
	DECLARE  @ChiefId int = (SELECT Id FROM Employee WHERE Name = @ChiefId);
END;

GO
	
