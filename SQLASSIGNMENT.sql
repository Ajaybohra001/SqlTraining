Create database Sql_Assignment;

USE Sql_Assignment;

CREATE TABLE tbl_Employees (EmployeeID INT PRIMARY KEY, firstName varchar(50),lastname varchar(50),departmentID int); 

CREATE TABLE tbl_Departments  (departmentID int PRIMARY KEY, departmentName varchar(50))

CREATE TABLE tbl_Orders(OrderID int PRIMARY KEY,CustomerId int, OrderDate date)

CREATE TABLE tbl_OrdersDetails(OrderDetailID int PRIMARY KEY,OrderId int,ProductID int, Quantity int);

CREATE TABLE tbl_Products (ProductID int PRIMARY KEY,ProductName varchar(50), UnitPrice int);

Select * from tbl_Orders

Insert Into tbl_Orders Values(1001,11,'2023-07-12')
Insert Into tbl_Orders Values(1002,12,'2023-07-13')
Insert Into tbl_Orders Values(1003,13,'2023-07-14')


ALTER TABLE tbl_Employees ADD  FOREIGN KEY (departmentID) REFERENCES tbl_Departments (departmentID); 
ALTER TABLE tbl_OrdersDetails ADD  FOREIGN KEY (OrderID) REFERENCES tbl_Orders (OrderId); 
ALTER TABLE tbl_Products ADD  FOREIGN KEY (ProductID) REFERENCES tbl_OrdersDetails (ProductID); 

Update tbl_Products Set UnitPrice =200 where ProductID =2;


SELECT * FROM tbl_Employees;
SELECT * FROM tbl_Departments;
SELECT * FROM tbl_Orders ;
SELECT * FROM tbl_OrdersDetails ;
SELECT* FROM tbl_Products ;


--Question 1 Retrieve the first and last names of all employees.

SELECT firstName, lastname FROM tbl_Employees;

--QUESTION 2 Find the total number of employees in each department.

SELECT departmentID, COUNT(*) FROM tbl_Departments  GROUP BY departmentID;

--Question 3:List the names of departments that have no employees.

SELECT * FROM tbl_Departments  WHERE departmentID NOT IN (select departmentID FROM tbl_Employees);

--Question 4: Retrieve the details of the employee with the highest `EmployeeID`.

SELECT TOP 1 * FROM tbl_Employees  ORDER BY EmployeeID DESC ;

--Quesrion 5: Calculate the average quantity of products ordered in the `OrderDetails` table

SELECT AVG(Quantity) AS Average FROM tbl_OrdersDetails ;

--Question 6:List the names of employees who have placed orders.

SELECT E.firstName,E.lastname FROM tbl_Employees AS E INNER JOIN tbl_Orders as O ON O.CustomerId =E.departmentID ; 

--Question 7:Find the total number of orders placed in each year.

select year(OrderDate),count(OrderId)
from tbl_Orders
group by year(OrderDate)

--Question 8:Retrieve the product names that have never been ordered.
SELECT ProductName from tbl_Products WHERE ProductID NOT IN(SELECT Distinct(ProductID) from tbl_OrdersDetails );


--Question 9: List the employees who have the same first name as their department.

SELECT  firstName from tbl_Employees INNER JOIN tbl_Departments  on tbl_Employees.firstName=tbl_Departments.departmentName ;

--Question 10:Calculate the total price of products sold in each order.

SELECT OrderId ,SUM(UnitPrice * Quantity) from tbl_Products AS P 
INNER JOIN tbl_OrdersDetails as O ON P.ProductID =O.ProductID group by(OrderId ); 

--Question 11:Find the customer who placed the largest total value of orders.

--Question 13:List the departments with more than five employees.
SELECT DepartmentName,Count(EmployeeID) As TotalEmployees
FROM  tbl_Departments LEFT JOIN tbl_Employees ON tbl_Departments.departmentID  =tbl_Employees.departmentID 
Group by departmentName Having Count(EmployeeID)>5; 

--Question 14:Calculate the average unit price of products in each department.

SELECT D.DepartmentName, AVG(P.UnitPrice) AS AvgUnitPrice
FROM tbl_Departments  D
LEFT JOIN tbl_Employees  E ON D.DepartmentID = E.DepartmentID
LEFT JOIN tbl_OrdersDetails  OD ON E.EmployeeID = OD.OrderId 
LEFT JOIN tbl_Products  P ON OD.ProductID = P.ProductID
GROUP BY D.DepartmentName;

--Question 15:Retrieve the order with the highest total price.












