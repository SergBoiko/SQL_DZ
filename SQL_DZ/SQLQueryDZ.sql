create table Department
(
	Id int IDENTITY(1,1) PRIMARY KEY, 
	Name nvarchar(100) NOT NULL
);

ALTER TABLE Department ADD UNIQUE (Name);

CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[ChiefId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Salary] [money] NOT NULL DEFAULT(0), 
	[DepartmentId] [int] NOT NULL
);

ALTER TABLE Employee ADD UNIQUE (Name);

ALTER TABLE [dbo].[Employee] WITH CHECK ADD FOREIGN KEY([ChiefId]) REFERENCES [dbo].[Employee] ([Id]);
ALTER TABLE [dbo].[Employee] WITH CHECK ADD FOREIGN KEY([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);