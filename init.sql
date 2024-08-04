-- init.sql

-- Check if the database exists, and create it if it does not
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'MyDatabase')
BEGIN
    CREATE DATABASE MyDatabase;
END
GO

-- Use the database
USE MyDatabase;
GO

-- Check if the Users table exists, and create it if it does not
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE Users (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Name NVARCHAR(100) NOT NULL,
        Password NVARCHAR(100) NOT NULL
    );
END
GO

-- Check if the Cars table exists, and create it if it does not
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Cars')
BEGIN
    CREATE TABLE Cars (
        UserId INT,
        Make NVARCHAR(50),
        Model NVARCHAR(50),
        Color NVARCHAR(50),
        FOREIGN KEY (UserId) REFERENCES Users(Id)
    );
END
GO

-- Insert data into Users table if it is empty
IF NOT EXISTS (SELECT * FROM Users)
BEGIN
    INSERT INTO Users (Name, Password) VALUES 
    ('Bob', 'Password123'), 
    ('Tim', '123Hello'),
    ('Jake', 'SecretKey'),
    ('John', 'Time2Go#'),
    ('Russell', 'qy34y*!@#$');
END
GO

-- Insert data into Cars table if it is empty
IF NOT EXISTS (SELECT * FROM Cars)
BEGIN
    INSERT INTO Cars (UserId, Make, Model, Color) VALUES 
    (1, 'Toyota', 'Camry', 'Red'),
    (2, 'Honda', 'Civic', 'Blue'),
    (3, 'Ford', 'Mustang', 'Black'),
    (4, 'Chevrolet', 'Malibu', 'White'),
    (5, 'Nissan', 'Altima', 'Gray'),
    (1, 'Tesla', 'Model S', 'Silver'),
    (2, 'BMW', '3 Series', 'Green'),
    (3, 'Audi', 'A4', 'Yellow'),
    (4, 'Mercedes', 'C-Class', 'Blue'),
    (5, 'Volkswagen', 'Passat', 'Red');
END
GO