-- init.sql
CREATE DATABASE MyDatabase;
GO

USE MyDatabase;
GO

CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Cars (
    UserId INT,
    Make NVARCHAR(50),
    Model NVARCHAR(50),
    Color NVARCHAR(50),
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);
GO

INSERT INTO Users (Name) VALUES ('John Doe'), ('Jane Smith');
GO

INSERT INTO Cars (UserId, Make, Model, Color) VALUES 
(1, 'Toyota', 'Camry', 'Red'),
(2, 'Honda', 'Civic', 'Blue');
GO