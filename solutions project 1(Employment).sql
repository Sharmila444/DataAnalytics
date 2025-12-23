USE EmployeeManagement;
-- 1]- Situational Questions on INSERT
-- Situation -1
-- We have hired two employees, 
-- Siddharth Gupta (email: siddharth.gupta@example.com, salary: ₹70,000, DOJ: 2024-01-01) 
-- and Aarav Jain (email: aarav.jain@example.com, salary: ₹72,000, DOJ: 2024-01-02), 
-- in the IT department (DepartmentID: 3). Add these records.
INSERT INTO Employees (FirstName, LastName, Salary, DateOfJoining,
Email, DepartmentID)
VALUES
('Siddharth', 'Gupta', 70000, '2024-01-01', 'siddharth.gupta@example.com', 3),
('Aarav', 'Jain', 72000, '2024-01-02', 'aarav.jain@example.com', 3);

-- Situation -2
-- The Marketing department has been created (DepartmentID: 11) with a budget of
-- ₹13,00,000, located in Pune, and headed by Rakesh Mehta. Add this department.

INSERT INTO Departments 
(DepartmentID, DepartmentName,  AnnualBudget, Location, HeadofDepartment)
VALUES
(11, 'Marketing', 1300000, 'Pune', 'Rakesh Mehta');


-- Situation -3
-- Three employees have been hired for the Marketing department (DepartmentID: 11):
-- Rahul Mehra (email: rahul.mehra@example.com, salary: ₹58,000, DOJ: 2024-01-10), 
-- Sara Kapoor (email: sara.kapoor@example.com, salary: ₹62,000, DOJ: 2024-01-11), and 
-- Nitin Shah (email: nitin.shah@example.com, salary: ₹60,000, DOJ: 2024-01-12). Add these records.

INSERT INTO employees
(DepartmentID,FirstName, LastName, Salary, DateOfJoining, Email)
VALUES
(11, 'Rahul', 'Mehera',  58000, '2024-01-10','rahul.mehra@example.com'),
(11, 'Sara', 'Kapoor',  62000, '2024-01-11','sara.kapoor@example.com'),
(11, 'Nitin', 'Shah',  60000, '2024-01-12','nitin.shah@example.com');


-- Situation -4
-- Two employees have been hired for the HR department (DepartmentID: 1): Riya Sharma
-- (email: riya.sharma@example.com, salary: ₹50,000, DOJ: 2024-02-01) and Mohit Desai (email:
-- mohit.desai@example.com, salary: ₹55,000, DOJ: 2024-02-02). Add these records.

INSERT Into employees (FirstName, LastName, DepartmentID, Salary, DateOfJoining, Email)
values 
('Riya', 'Sharma', 1, 50000, '2024-02-01', 'riya.sharma@example.com'),
('Mohit', 'Dessai', 1, 55000, '2024-02-02', 'mohit.desai@example.com');


-- Situation -5
-- Sneha Rao (email: sneha.rao@example.com) has joined the Finance department
-- (DepartmentID: 2) on 2024-02-15 with a salary of ₹60,000. Add this record.
insert into employees(FirstName, LastName, DepartmentID, Salary, DateOfJoining, Email)
Values
('Sneha', 'Rao', 2, 60000, '2024-02-15', 'sneha.rao@example.com');

-- Situation -6
-- Three employees have been hired for the Legal department (DepartmentID: 7): Aditya
-- Malhotra (email: aditya.malhotra@example.com, salary: ₹65,000, DOJ: 2024-03-01), Priyanka
-- Kapoor (email: priyanka.kapoor@example.com, salary: ₹67,000, DOJ: 2024-03-02), and Kunal
-- Singh (email: kunal.singh@example.com, salary: ₹68,000, DOJ: 2024-03-03). Add these
-- records.
insert into employees(FirstName, LastName, DepartmentID, Salary, DateOfJoining, Email)
Values
('Aditya', 'Malhotra', 7, 65000, '2024-03-01', 'aditya.malhotra@example.com'),
('Priyanka', 'Kapoor', 7, 67000, '2024-03-02', 'priyanka.kapoor@example.com'),
('Kunal', 'Singh', 7, 68000, '2024-03-03', 'kunal.singh@example.com');


-- Situation -7
-- The Research department (DepartmentID: 12) has been created with a budget of
-- ₹20,00,000, located in Hyderabad, and headed by Dr. Meera Joshi. Add this department.
Insert into Departments(DepartmentID, DepartmentName, Location, HeadOfDepartment, AnnualBudget)
Values 
(12, 'Research', 'Hyderabad', 'Dr.MeeraJoshi', 2000000);

-- Situation -8
-- Two employees have been hired for the Research department (DepartmentID: 12): Arjun
-- Shah (email: arjun.shah@example.com, salary: ₹75,000, DOJ: 2024-04-01) and Riya Patel
-- (email: riya.patel@example.com, salary: ₹72,000, DOJ: 2024-04-02). Add these records.

insert into employees(FirstName, LastName, DepartmentID, Salary, DateOfJoining, Email)
Values
('Arjun', 'Shah', 12, 75000, '2024-04-01', 'arjun.shah@example.com'),
('Riya', 'Patel', 7, 72000, '2024-04-02', 'riya.patel@example.com');



-- Situation -9
-- The Logistics department (DepartmentID: 13) has been created with a budget of
-- ₹9,00,000, located in Chennai, and headed by Ravi Verma. Add this department.

Insert into Departments(DepartmentID, DepartmentName, Location, HeadOfDepartment, AnnualBudget)
Values 
(13, 'Logistics', 'Chennai', 'RaviVerma', 900000);

-- Situation -10
-- Two employees have been hired for the Logistics department (DepartmentID: 13): Kavita
-- Desai (email: kavita.desai@example.com, salary: ₹50,000, DOJ: 2024-05-01) and Amit Jain
-- (email: amit.jain@example.com, salary: ₹52,000, DOJ: 2024-05-02). Add these records.

insert into employees(FirstName, LastName, DepartmentID, Salary, DateOfJoining, Email)
Values
('Kavita', 'Desai', 13, 50000, '2024-05-01', 'kavita.desai@example.com'),
('Amit', 'Jain', 13, 52000, '2024-05-02', 'amit.jain@example.com');

-- 2] Situational Questions on WHERE Clause
-- Employee Table

-- Situation -1 We are planning a cybersecurity project. Find all employees working in the IT department (DepartmentID: 3).
select * from employees where departmentid = 3;

-- Situation -2 To organize a corporate event, we need employees who joined after 2024-01-01. Retrieve their details.
select * from employees where dateofjoining = '2024-01-01';

-- Situation -3 The finance team is preparing budgets. List all employees whose salary is greater than ₹60,000.
select * from employees where salary > 60000;

-- Situation -4 We are sending a company-wide newsletter. Find the details of employees whose email ends with '@example.com'.
select * from employees where email like '%@example.com';

-- Situation -5 The Marketing department is launching a new campaign and needs a cost-effective team. Retrieve the details of employees in the Marketing department (DepartmentID: 11) who earn less than ₹60,000.
select * from employees where departmentid = '11' and salary < 60000; 


-- Situation -6 A client requires a project lead for their team. Find the employee details where the name starts with 'S'.

select * from employees where firstname like 's%';

-- Situation -7 For recruitment analysis, retrieve all employees who joined in February 2024.

select * from employees where dateofjoining > '2024-01-31';

-- Situation -8 To shortlist mid-level employees, find the details of employees who are earning between ₹50,000 and ₹70,000.

select * from employees where salary between 50000 and 70000;

-- Situation -9 We need to identify senior employees. Retrieve the details of employees who joined before 2024-03-01 and earn more than ₹55,000.

select * from employees where dateofjoining < '2024-03-01' and salary = 55000;


-- Situation -10 A special campaign is being planned for team leaders. Find employees who have "Manager" in their name.
select * from employees where firstname = manager;

-- Department Table
-- Situation -11 To identify local opportunities, list all the departments located in Pune.

select * from departments where location = 'Pune';

-- Situation -12 The board is interested in high-budget projects. Find the details of departments where the budget exceeds ₹10,00,000.

select * from departments where annualbudget > 1000000;

-- Situation -13 For a leadership meeting, retrieve the departments headed by "Rakesh Mehta".

select * from departments where headofdepartment = "Rakesh Mehta";

-- Situation -14 Marketing expansion is being planned. Find all departments whose names start with "M".

select * from departments where headofdepartment like 'M%';

-- Situation -15 To allocate funds efficiently, list all departments where the budget is between ₹8,00,000 and ₹15,00,000.

select * from departments where AnnualBudget between 800000 and 1500000;

-- 3] Situational Questions on GROUP BY Clause
-- Employee Table

-- Situation -1: To analyze salary distribution, find the total salary paid in each department.

SELECT 
    d.departmentid,
    d.departmentname,
    SUM(e.salary) AS TotalSalary
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
GROUP BY d.departmentid, d.departmentname;

-- Situation -2: For employee retention analysis, count the number of employees in each department.

SELECT 
    d.departmentid,
    d.departmentname,
    COUNT(e.employeeid) AS CountOfEmployee
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
GROUP BY d.departmentid, d.departmentname
ORDER BY CountOfEmployee DESC;

-- Situation -3: The finance team wants to understand salary variation. Find the average salary in each department.

SELECT 
    d.departmentid,
    d.departmentname,
    AVG(e.salary) AS AverageSalary
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
GROUP BY d.departmentid, d.departmentname
ORDER BY AverageSalary DESC;


-- Situation -4: To reward experienced employees, identify the earliest joining date in each department.

SELECT 
    d.departmentid,
    d.departmentname,
    SUM(e.salary) AS TotalSalary
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
GROUP BY d.departmentid, d.departmentname;



-- Situation -5: The HR team is preparing performance reports. Retrieve the maximum salary in each department.
SELECT 
    d.departmentid,
    d.departmentname,
    MAX(e.salary) AS MaxiumSalary
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
GROUP BY d.departmentid, d.departmentname;


-- Situation -6: To analyze junior-level hiring, find the minimum salary in each department.
SELECT 
    d.departmentid,
    d.departmentname,
    MIN(e.salary) AS MinimumSalary
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
GROUP BY d.departmentid, d.departmentname
ORDER BY MinimumSalary ASC;


-- Situation -7: The finance team wants to review high-salary employees. Find the total salary paid for employees earning more than ₹60,000 in each department.

SELECT 
    d.departmentid,
    d.departmentname,
    SUM(e.salary) AS TotalSalary
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
GROUP BY d.departmentid, d.departmentname
HAVING TotalSalary > 60000;


-- Situation -8: To monitor departmental growth, count the number of employees who joined in 2024 in each department.
SELECT 
    d.departmentid,
    d.departmentname,
    COUNT(e.employeeid) AS CountOfEmployee,
    e.dateofjoining
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
WHERE YEAR(e.dateofjoining) = '2024'
GROUP BY d.departmentid, d.departmentname
ORDER BY CountOfEmployee DESC ;


-- Situation -9: For training allocation, count the number of employees with salaries between ₹50,000 and ₹70,000 in each department.

SELECT 
    d.departmentid,
    d.departmentname,
    COUNT(e.employeeid) AS CountOfEmployee,
    e.salary
FROM employees AS e
JOIN departments AS d
    ON e.departmentid = d.departmentid
WHERE salary between 50000 and 70000
GROUP BY d.departmentid, d.departmentname
ORDER BY CountOfEmployee;


-- Situation -10: For diversity analysis, count the number of employees whose names start with each letter of the alphabet.

SELECT 
    left(e.firstname, 1) as FirstLetter,
    COUNT(e.employeeid) as CountOfEmployee
from employees as e
group by FirstLetter
Order by FirstLetter;

-- Department Table
-- Situation -11: For city-based analysis, count the number of departments located in each city.

SELECT 
    d.location,
    Count(d.departmentid) as NumberOfDepartments
From departments as d
group by d.location
order by NumberOfDepartments Desc;

-- Situation -12: To manage high-budget projects, find the total budget allocated to all departments in each city.
select 
d.departmentname, d.location,
sum(d.annualbudget) as TotalBudget
from departments as d
group by d.location 
order by TotalBudget;

-- Situation -13: For leadership tracking, count the number of departments headed by each manager.
select d.headofdepartment, count(d.departmentid) as Numberofdepartment
from departments as d
group by d.headofdepartment
order by Numberofdepartment;


-- Situation -14: To plan budget allocation, calculate the average budget of departments in each city.
select d.departmentname, d.location,
avg(d.annualbudget) as AverageBudget
from departments as d
group by d.departmentname, d.location
order by AverageBudget;

-- Situation -15: For funding efficiency, find the maximum and minimum budgets among departments in each city.
select d.location as City, d.departmentname,
Min(d.annualbudget) as MinimumBudget,
Max(d.annualbudget) as MaximumBudget
from departments as d
group by city;

-- 4] Situational Questions on CONCAT and Concatenating Words
-- Situation -1: To create a full name column, concatenate the first name and last name of each employee.
select
concat(e.firstname, ' ', e.lastname) as EmployeeName,
e.employeeid, e.departmentid,
e.salary, e.dateofjoining, e.email
from employees as e
order by employeename;

-- Situation -2: For a project report, concatenate the department name and its location to display a complete department address.
select 
d.departmentid,
concat(d.departmentname, ' , ' , d.location) as Department_Address
from departments as d
group by d.departmentid;

-- Situation -3: To prepare a personalized email greeting, concatenate "Hello " with the employee's name and a comma.
select 
e.email, concat('Hello', ' ! ', e.firstname, '  ', e.lastname) as EmailGreeting
from employees as e
order by e.email;

-- Situation -4: For creating a unique employee ID, concatenate the department ID and employee number.
Select 
e.firstname, e.lastname, concat(e.departmentid, ' - ', e.employeeid) as EmployeeUniqueid
from employees as e
order by EmployeeUniqueid;


-- Situation -5: For creating a company contact list, concatenate the employee's phone number with their extension (if applicable).

SELECT 
    CONCAT(e.firstname, ' ', e.lastname) AS EmployeeName,
    e.email,
    CONCAT(e.phonenumber, 
           IFNULL(CONCAT(' Ext-', e.extension), '')
    ) AS ContactNumber
FROM employees AS e
ORDER BY EmployeeName;


-- Situation -6: To display the complete address, concatenate the street, city, and postal code of each employee.

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    CONCAT(Street, ', ', City, ', ', PostalCode) AS CompleteAddress
FROM Employee;


-- Situation -7: To create an employee login ID, concatenate the employee’s first name, last name, and their department ID.

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID,
    CONCAT(FirstName, LastName, DepartmentID) AS LoginID
FROM Employee;


-- Situation -8: For sending out a personalized notification, concatenate the employee's department with their position.

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    DepartmentName,
    Position,
    CONCAT(DepartmentName, ' - ', Position) AS NotificationText
FROM Employee;

-- Situation -9: To display the employee's work status, concatenate their job title and current project.

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    JobTitle,
    CurrentProject,
    CONCAT(JobTitle, ' - ', CurrentProject) AS WorkStatus
FROM Employee;


-- Situation -10: For an annual report, concatenate the year and employee’s first name to create a unique report reference code.

SELECT 
    EmployeeID,
    FirstName,
    YEAR(CURDATE()) AS ReportYear,
    CONCAT(YEAR(CURDATE()), '_', FirstName) AS ReportReferenceCode
FROM Employee;

-- 5] Situational Questions on the UPDATE Clause
-- Situation -1: As part of an organizational review, we need to update the salary of all employees who are part of the IT department (DepartmentID: 3). The salary of all employees in this department should be increased by 10%. Make sure that the increase is applied to every employee within the department.

Update employees
Set salary = salary * 1.10
Where departmentid = 3;


-- Situation -2: After the recent promotion evaluation, it has been decided that the employee with EmployeeID 101 should be promoted to a "Senior Developer" role. Update their job title accordingly and make sure the position is reflected correctly in the employee records.

Update employees
Set jobtitle = 'Senior Developer'
Where employeeid = 101;


-- Situation -3: The HR team has informed us of a change in the contact information of employee with EmployeeID 120. The new contact number for this employee should be updated to "9876543210". Ensure that the correct phone number is reflected in the system for any future communications.

Update employees
Set Phone_Number = 9876543210
Where employeeid = 120;

-- Situation -4: The company has recently implemented a new email domain. All employees who joined after January 1, 2023, need their email addresses updated to reflect the new domain "@newcompany.com". Update the email addresses accordingly for all the affected employees.

Update employees
Set email = CONCAT(SUBSTRING_INDEX(email, '@', 1), '@newcompany.com')
Where hire_date > '2023-01-01';


-- Situation -5: It has come to our attention that there was an error in the naming of the HR department. The department name for DepartmentID 5 needs to be updated from "HR" to "Human Resources" to reflect the company's official title. Perform this update to ensure consistency across the records.

Update departments
Set departmentname = 'Human Resources'
Where departmentid = 5;

-- Situation -6: As part of a company-wide salary review process, all employees who are currently earning below ₹50,000 need to receive a salary increase of ₹5,000. This update should only affect employees with a salary below the threshold and should apply the increase uniformly to each of their records.

Update employees
Set salary = salary + 5000
Where salary < 50000;


-- Situation -7: The Marketing department has recently moved to a new office in a different city. The location of the Marketing department (DepartmentID: 11) needs to be updated to reflect this change. Please update the location to "Mumbai" in the department's records accordingly.

Update departments
Set location = 'Mumbai'
Where departmentid = 11;

-- Situation -8: Update the Salary of EmployeeID 135 to ₹60,000 as part of their annual appraisal.
Update Employees
Set Salary = 60000
Where Employeeid = 135;

-- Situation -9: EmployeeID 110, who was previously working on a different project, has now been assigned to "Project Alpha" after the successful completion of their prior assignment. Please update the project assignment for this employee to reflect this new responsibility.

Update employees
Set Project_Assignment = 'Project_Alpha'
where Employeeid = 110;


-- Situation -10: The employee with EmployeeID 103 had a delayed start date due to personal reasons. We need to update their joining date to the correct date, which is 2024-03-15, to ensure the records accurately reflect the employee's actual start date with the company.
update Employees
Set DateofJoining = '2024-03-15'
Where EmployeeID = 103;


-- 6] Situational Questions on the DELETE Clause
-- Situation -1: Due to an employee leaving the company, we need to delete the record of EmployeeID 101 from the Employee table.

Delete from employees 
Where Employeeid = 101;


-- Situation -2: The company is undergoing a restructuring. As part of this process, we need to delete all employees in the HR department (DepartmentID: 2) who joined before 2022.

Delete from Employees
Where Year(DateofJoining) < '2022'
and Departmentid = 2;


-- Situation -3: We are cleaning up the database and need to delete employees with a salary lower than ₹30,000, as they are no longer part of the workforce.

Delete from Employees
Where Salary < 30000;

-- Situation -4: As per a recent audit, employees who joined before 2020 but no longer have any active projects should be removed from the system. Delete these employee records.

Delete from Employees
Where Year(DateofJoining) < '2020';

-- Situation -5: After the closure of "Project Beta", we need to delete all records of employees who were working on this project (assumed to be recorded in ProjectName).

Delete from Employees
Where Project_Assignment = 'Project Beta';

--  Situation -6: An employee, EmployeeID 135, was added mistakenly and is no longer part of the organization. Please delete their record from the Employee table.

Delete from Employees 
Where Employeeid = 135;

-- Situation -7: The Marketing department (DepartmentID: 3) has undergone significant layoffs. Delete all records of employees who worked in the Marketing department and joined before 2021.

Delete from Employees 
where Departmentid = 3
and Dateofjoining < '2021-01-01';

--  Situation -8: As part of a data privacy initiative, we need to delete records of employees who have not provided their email addresses or contact numbers.

DELETE FROM employees
WHERE email IS NULL  OR phonenumber IS NULL;


-- Situation -9: We need to remove all employees whose salary is above ₹1,00,000 but were part of a temporary contract that has now expired. Delete these employee records.

Delete from employees 
Where Salary > 100000;


-- Situation -10: The company has decided to shut down operations in certain regions. Delete the employee records of those who were hired in the "North" region (assuming a Region column exists), and whose employment ended before 2023.

Delete from Employees
where Region = 'North'
and Employementenddate = '2023-01-01';


-- 7] Situational Questions on Table Schema Modifications (with Retrieval for Data Consistency)
-- Situation -1: Due to a change in company policy, we need to rename the Employee table to Staff. Please perform the necessary operation to rename the table. Note: Please do retrieve the changes made for consistency of the data. If you are changing the name of the table, make sure to restore it to the original state as Employee if needed.

Alter Table Employees
Rename to Staff;


-- Situation -2: As the company has decided to start tracking employees' marital status, add a new column MaritalStatus of type VARCHAR(20) to the Employee table. Note: Please do retrieve the changes made for consistency of the data and ensure the data remains accurate for all future entries.

Alter Table Employees
Add Coloumn MaritalStatus Varchar(20);


-- Situation -3: The company has decided to store the employees' date of birth. Add a DateOfBirth column of type DATE to the Employee table. Note: Please ensure to retrieve the changes made to check the column's impact on future data consistency.

Alter Table Employees
Add Coloumn Dateofbirth Date;

-- Situation -4: We need to change the data type of the Salary column in the Employee table from INT to DECIMAL(10,2) to accommodate fractional salary amounts. Note: Please do retrieve the changes made for consistency of the data, ensuring that all existing salary data is preserved accurately.

Alter Table Employees
Modify Salary Decimal(10,2);


-- Situation -5: To better categorize employees, we need to add a new column EmployeeCategory in the Employee table. The column should accept values like "Full-time", "Part-time", or "Contract". Note: Please ensure the changes are reflected and retrieve the updated schema for consistency.

ALTER TABLE Employee
ADD CONSTRAINT chk_employee_category
CHECK (EmployeeCategory IN ('Full-time', 'Part-time', 'Contract', 'Not Assigned'));


-- Situation -6: The company wants to keep track of the department name for employees. Therefore, a column DepartmentName should be added to the Employee table. Note: After making the change, please retrieve the updates to ensure the column is populated correctly for future entries.

ALTER TABLE Employee
ADD COLUMN DepartmentName VARCHAR(100);


-- Situation -7: We need to set the default value of the Status column in the Employee table to "Active" for any new employee added to the database. Note: After applying this change, please retrieve the changes and verify that all new employee records default to "Active".

ALTER TABLE Employee
ALTER COLUMN Status SET DEFAULT 'Active';


-- Situation -8: As part of a company-wide restructuring, the DepartmentID column in the Employee table should be renamed to TeamID to reflect the new team-based structure. Note: Please retrieve the changes made for consistency of the data. If necessary, restore the column name back to DepartmentID for future references.

ALTER TABLE Employee
RENAME COLUMN DepartmentID TO TeamID;


-- Situation -9: The company has decided to archive old employee data, so the Employee table needs to be partitioned by JoinDate in order to keep the data for employees who joined before 2020 separate. Note: After partitioning the data, ensure to retrieve the changes and check the data consistency and accessibility for employees prior to 2020.




-- Situation -10: We need to create a foreign key constraint between the Employee table and the Department table to ensure the integrity of the department data linked to each employee. Note: Please retrieve the changes made to verify the foreign key relationship, ensuring data integrity and consistency across both tables.

ALTER TABLE Employee
ADD CONSTRAINT fk_department
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID);
