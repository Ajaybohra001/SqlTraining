Create Table tbl_Emp (Emp_id int ,Emp_name varchar(50),Emp_age int,Emp_City varchar(50))
Insert Into tbl_Emp Values(3,'Prince',21,'Noida')
Select * from tbl_Emp


--Changing the datatype of column
Alter Table tbl_Emp Alter Column  Hobby varchar(50)

Delete from tbl_Emp where Emp_id =3

Select count(Emp_id) from tbl_Emp


Update  tbl_Emp Set Emp_name ='Akshay' where Emp_id=2
Update tbl_Emp Set Hobby ='Football' where Emp_id =2
Select avg(Emp_age) from tbl_Emp
Select max(Emp_age) from tbl_Emp
Select upper(Emp_name) from tbl_Emp
Select substring(Emp_name,1,2) from tbl_Emp

Create table Customer(C_id int identity(1,1),C_name varchar(50))
Insert Into Customer Values('Ajay')
Select * from Customer
Select distinct(C_name) from Customer 

Update Customer Set C_name='Akshay' where C_id=5

Alter Table Customer Add C_Salary int
 Update Customer Set C_Salary=25000 
 --Update Customer Set C_Salary=25000 where C_id=2
 --Update Customer Set C_Salary=25000 where C_id=3
 --Update Customer Set C_Salary=25000 where C_id=4
 Alter Table Drop Column C_Salary


Update Customer Set C_name='Akshay' where C_id=5

Alter Table Customer Add C_Salary int
 Update Customer Set C_Salary=25000 
 --Update Customer Set C_Salary=25000 where C_id=2
 --Update Customer Set C_Salary=25000 where C_id=3
 --Update Customer Set C_Salary=25000 where C_id=4
 Alter Table Drop Column C_Salary




--Rename the Table name
Exec sp_rename 'Customer' , 'tbl_Customer' ;
Select * from tbl_Customer

--Rename the Columnn
Exec sp_rename 'tbl_Customer.C_Salary','Cust_salary'

--Delete command

Delete from tbl_Customer where C_id=5

--Add Column
Alter table tbl_Customer Add Email varchar(50)

Select * from tbl_Customer

--Delete Column
Alter Table tbl_Customer Drop Column Email

--Select C_id from tbl_Customer LIMIT 2;

Select * from tbl_Customer order by C_name Desc
Select * from tbl_Customer order by C_name Asc











