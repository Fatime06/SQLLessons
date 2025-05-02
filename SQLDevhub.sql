create database EmployeesDB;

use EmployeesDB;

create table Employees (
Id int primary key identity(1,1),
FirstName nvarchar(100),
LastName nvarchar(100),
Email nvarchar(200),
HireDate date);

alter table Employees
Add PhoneNumber nvarchar(20);

insert into Employees (FirstName, LastName, Email, HireDate,PhoneNumber)
Values ('Orxan', 'Memmedov', 'orxan.mammadov@example.com', '2023-09-01', '+994501234567');

select*from Employees;

insert into Employees (FirstName, LastName, Email, HireDate,PhoneNumber)
Values ('Fatime', 'Esedova', 'esedovaf4@example.com', '2025-04-29', '+994509767000');

UPDATE Employees
SET PhoneNumber = '+994507654321'
WHERE Id = 2;

DELETE FROM Employees
WHERE Id = 1;
