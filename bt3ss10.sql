create database test12;
use test12;
CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);
CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Patient_ID INT,
    Dept_ID INT,
    Amount DECIMAL(10 , 2 )
);
INSERT INTO Departments VALUES (1, 'Nội' ), (2, 'Ngoại' );
INSERT INTO Invoices VALUES (101, 1, 1, 500.00), (102, 2, 1, 300.00), (103, 3, 2,
1000.00);
CREATE VIEW Department_Revenue_View AS
SELECT 
    d.Dept_Name,
    COUNT(DISTINCT i.Patient_ID) AS Total_Patients,
    SUM(i.Amount) AS Total_Revenue
FROM Departments d
JOIN Invoices i ON d.Dept_ID = i.Dept_ID
GROUP BY d.Dept_Name;
UPDATE Department_Revenue_View
SET Total_Revenue = 9999
WHERE Dept_Name = 'Nội';