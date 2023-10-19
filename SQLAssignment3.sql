Create Database SQLAssignment3;
use SqlAssignment3;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Accounts (
    account_number INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_number INT,
    transaction_date DATETIME,
    amount DECIMAL(10, 2),
    transaction_type VARCHAR(20),
    FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(50),
    amount DECIMAL(10, 2),
    interest_rate DECIMAL(5, 2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    address VARCHAR(100),
    phone_number VARCHAR(20)
);

INSERT INTO Customers (customer_id, first_name, last_name, date_of_birth, address, phone_number, email)
VALUES (1, 'Ajay', 'Bohra', '1990-05-15', 'palam', '8810304137', 'ajaybohra000@gmail.com');

INSERT INTO Customers (customer_id, first_name, last_name, date_of_birth, address, phone_number, email)
VALUES (2, 'Akshay', 'Bohra', '1985-09-20', 'Dwarka', '7065182733', 'akshaybohra982332@gmail.com');

INSERT INTO Accounts (account_number, customer_id, account_type, balance)
VALUES (1001, 1, 'Savings', 5000.00);

INSERT INTO Accounts (account_number, customer_id, account_type, balance)
VALUES (1002, 2, 'Salary', 2500.00);

INSERT INTO Transactions (transaction_id, account_number, transaction_date, amount, transaction_type)
VALUES (1, 1001, '2023-10-18 10:30:00', 1000.00, 'Deposit');

INSERT INTO Transactions (transaction_id, account_number, transaction_date, amount, transaction_type)
VALUES (2, 1002, '2023-10-19 14:45:00', 500.00, 'Withdrawal');

INSERT INTO Employees (employee_id, first_name, last_name, date_of_birth, address, phone_number, email, position, salary)
VALUES (1, 'Prince', 'kumar', '1980-02-10', 'Noida', '8973482798', 'Prince@gmail.com', 'Manager', 60000.00);

INSERT INTO Employees (employee_id, first_name, last_name, date_of_birth, address, phone_number, email, position, salary)
VALUES (2, 'Utkarsh', 'Sri', '1995-07-25', 'Dwarka', '8938232322', 'Utk@gmail.com', 'Teller', 35000.00);






