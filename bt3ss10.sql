create database ss10bt3;
use ss10bt3;


CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);


CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Full_Name VARCHAR(100)
);


CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Patient_ID INT,
    Dept_ID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

CREATE VIEW Department_Revenue_View AS
SELECT 
    d.Dept_Name,
    COUNT(DISTINCT i.Patient_ID) AS Total_Patients,
    SUM(i.Amount) AS Total_Revenue
FROM Departments d
LEFT JOIN Invoices i ON d.Dept_ID = i.Dept_ID
GROUP BY d.Dept_Name;

SELECT * FROM Department_Revenue_View;