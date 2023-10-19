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

--group by and having clause


Create Table sales (
    id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);


Insert Into  sales (id, product_name, category, price)
Values (1, 'Product A', 'Category 1', 10.50),
       (2, 'Product B', 'Category 1', 15.75),
       (3, 'Product C', 'Category 2', 20.00),
       (4, 'Product D', 'Category 2', 12.25),
       (5, 'Product E', 'Category 3', 8.50),
       (6, 'Product F', 'Category 3', 18.00);

Select category, AVG(price) AS average_price
From sales
group  by category
having AVG(price) > 15.00;



