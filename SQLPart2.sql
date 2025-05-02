create database CompanyDB;

use CompanyDB;

create table Customers(
ID int primary key identity(1,1),
FirstName nvarchar(100),
Surname nvarchar(100),
Salary decimal(10,2)
);

insert into Customers(FirstName, Surname, Salary)
values ('Fatime', 'Esedova',1340),
('Nermin', 'Memmedov',1200),
('Araz', 'Ehmedov',750),
('Elcin', 'Eliyev', 900),
('Leyla','Necefli',1200);

select*from Customers;

update Customers
set Salary = 1300
where ID = 3;

delete from Customers
where ID =5;

select AVG(Salary) as AvarageSalary from Customers;

select*from Customers
where Salary > (select avg(Salary) from Customers);

select FirstName from Customers
where Salary = (select max(Salary) from Customers);

select Surname from Customers
where Salary = (select min(Salary) from Customers);
