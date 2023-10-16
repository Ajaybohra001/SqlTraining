use xyz;

Select * From INFORMATION_SCHEMA.Tables;
Select * from Emp1;
Select * from Emp2;

--Update Emp1 Set EMp_ph=8810304124 where Emp_id=1;

--Select Emp1.Emp_id,Emp_name,course from Emp1 Inner Join Emp2 On Emp1.Emp_id=Emp2.Emp_id;
--Select Emp1.Emp_id,Emp_name,course from Emp1 Left Outer Join Emp2 On Emp1.Emp_id=Emp2.Emp_id;
--Select Emp1.Emp_id,Emp_name,course from Emp1 Right Outer Join Emp2 On Emp1.Emp_id=Emp2.Emp_id;
--Select Emp1.Emp_id,Emp_name,course from Emp1 Full Outer Join Emp2 On Emp1.Emp_id=Emp2.Emp_id;

--Create View

Create View Vw_Emp1 As
Select Emp_id,Emp_name from Emp1;

Select * from Vw_Emp1;

Create View Vw_Emp2 As
Select course from Emp2;

Select * from Vw_Emp2;

--Create Procedure

Create Procedure SelectAllEmp1 AS
Select * from Emp1;


Exec SelectAllEmp1;


Create Procedure SumAge AS 
Select Sum(Emp_age) from Emp1;

Exec SumAge;

--CREATE TRIGGER

--CREATE A TABLE TO STORE AUDIT LOG
CREATE TABLE EMPLOYEEAUDITLOG (
LogID INT PRIMARY KEY IDENTITY(1,1) , 
ATION NVARCHAR(50),
EmployeeId INT,
LogDate DATETIME);

CREATE TRIGGER AuditEmployeeChanges
ON Emp1
After INSERT,UPDATE,DELETE
AS
BEGIN
DECLARE @Action NVARCHAR(50);
IF EXISTS (SELECT * FROM inserted)
BEGIN
IF EXISTS (SELECT * FROM deleted)
SET @ Action='UPDATE';
ELSE
SET @Action='INSERT';
END
ELSE
SET @Action='DELETE';

INSERT INTO EmployeeAuditLog (Action,EmployeeId,LogDate)
Select @Action ,EmployeeId,GETDATE()
FROM inserted;
End;















