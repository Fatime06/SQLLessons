CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    City NVARCHAR(100)
);

CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    OrderDate DATE NOT NULL,

    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);


INSERT INTO Users (Name, Email, City)
VALUES 
('Aysel Mammadova', 'aysel@mail.com', 'Baku'),
('Rashad Aliyev', 'rashad@mail.com', 'Ganja'),
('Leyla Karimova', 'leyla@mail.com', 'Baku'),
('Elvin Huseynov', 'elvin@mail.com', 'Sumgait');

INSERT INTO Products (Name, Price)
VALUES 
('Laptop', 1500.00),
('Mouse', 25.50),
('Keyboard', 45.00),
('Monitor', 300.00);

INSERT INTO Orders (UserId, ProductId, Quantity, OrderDate)
VALUES
(1, 1, 1, '2025-04-10'),  
(1, 2, 2, '2025-04-15'), 
(2, 3, 1, '2025-04-20'),
(3, 1, 1, '2025-04-25'),
(4, 4, 2, '2025-05-01'),
(1, 4, 1, '2025-05-03');



SELECT 
    Users.Name AS Istifadeci, 
    COUNT(Orders.Id) AS SifarisSayi
FROM Users
JOIN Orders ON Users.Id = Orders.UserId
GROUP BY Users.Name;


SELECT 
    Users.Name AS Istifadeci, 
    SUM(Products.Price * Orders.Quantity) AS UmumiXerc
FROM Orders
JOIN Users ON Orders.UserId = Users.Id
JOIN Products ON Orders.ProductId = Products.Id
GROUP BY Users.Name;

SELECT 
    Users.City AS Seher, 
    AVG(Products.Price * Orders.Quantity) AS OrtalamaXerc
FROM Orders
JOIN Users ON Orders.UserId = Users.Id
JOIN Products ON Orders.ProductId = Products.Id
GROUP BY Users.City;


SELECT TOP 1
    Users.Name AS Istifadeci, 
    SUM(Products.Price * Orders.Quantity) AS Xerc
FROM Orders
JOIN Users ON Orders.UserId = Users.Id
JOIN Products ON Orders.ProductId = Products.Id
GROUP BY Users.Name
ORDER BY Xerc DESC;

SELECT 
    Products.Name AS Mehsul, 
    SUM(Orders.Quantity) AS SifarisSayi
FROM Orders
JOIN Products ON Orders.ProductId = Products.Id
GROUP BY Products.Name;


SELECT 
    Users.Name AS Istifadeci, 
    Products.Name AS Mehsul, 
    Orders.OrderDate AS Tarix, 
    Products.Price * Orders.Quantity AS Mebleg
FROM Orders
JOIN Users ON Orders.UserId = Users.Id
JOIN Products ON Orders.ProductId = Products.Id
WHERE DATEDIFF(DAY, Orders.OrderDate, GETDATE()) <= 30;


SELECT 
    Users.Name AS Istifadeci, 
    SUM(Products.Price * Orders.Quantity) AS UmumiXerc
FROM Orders
JOIN Users ON Orders.UserId = Users.Id
JOIN Products ON Orders.ProductId = Products.Id
GROUP BY Users.Name
ORDER BY UmumiXerc DESC;


SELECT 
    Users.Name AS Istifadeci, 
    SUM(Products.Price * Orders.Quantity) AS UmumiXerc
FROM Orders
JOIN Users ON Orders.UserId = Users.Id
JOIN Products ON Orders.ProductId = Products.Id
GROUP BY Users.Name
HAVING SUM(Products.Price * Orders.Quantity) > 300;


SELECT 
    Products.Name AS Mehsul, 
    AVG(Orders.Quantity) AS OrtalamaSatisMiqdari
FROM Orders
JOIN Products ON Orders.ProductId = Products.Id
GROUP BY Products.Name;









