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


