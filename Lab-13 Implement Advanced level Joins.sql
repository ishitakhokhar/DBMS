SELECT * FROM CITY
SELECT * FROM VILLAGE
--PART-A
--1
--Display all the villages of Rajkot city.
SELECT VILLAGE.NAME,CITY.NAME FROM CITY JOIN VILLAGE ON CITY.CITYID=VILLAGE.CITYID WHERE CITY.NAME='RAJKOT'

--2
--Display city along with their villages & pin code.
SELECT CITY.NAME,VILLAGE.NAME,CITY.PINCODE FROM CITY JOIN VILLAGE ON CITY.CITYID=VILLAGE.CITYID

--3
--Display the city having more than one village.
SELECT CITY.NAME,COUNT(VILLAGE.CITYID) FROM CITY JOIN VILLAGE ON CITY.CITYID=VILLAGE.CITYID GROUP BY CITY.NAME HAVING COUNT(VILLAGE.CITYID) > 1

--4
--Display the city having no village.
SELECT CITY.NAME,COUNT(VILLAGE.CITYID) FROM CITY LEFT JOIN VILLAGE ON CITY.CITYID=VILLAGE.CITYID GROUP BY CITY.NAME HAVING COUNT(VILLAGE.CITYID) = 0

--5
--Count the total number of villages in each city.
SELECT CITY.NAME,COUNT(VILLAGE.CITYID) FROM CITY JOIN VILLAGE ON CITY.CITYID=VILLAGE.CITYID GROUP BY CITY.NAME 

--6
--Count the number of cities having more than one village.
SELECT COUNT(*) FROM CITY WHERE NAME IN (SELECT CITY.NAME FROM CITY JOIN VILLAGE ON CITY.CITYID=VILLAGE.CITYID GROUP BY CITY.NAME HAVING COUNT(VILLAGE.CITYID)>1)


SELECT * FROM STU_MASTER
--1
--Do not allow SPI more than 10
ALTER TABLE STU_MASTER ADD CHECK (SPI<=10)

--2
--Do not allow Bklog less than 0.
ALTER TABLE STU_MASTER ADD CHECK (BKLOG >=0)

--3
--Enter the default value as ‘General’ in branch to all new records IF no other value is specified
ALTER TABLE STU_MASTER ADD CONSTRAINT DF_BRANCH DEFAULT 'GENERAL' FOR BRANCH

--4
--Try to update SPI of Raju from 8.80 to 12.
UPDATE STU_MASTER SET SPI=12 WHERE NAME='RAJU'

--5
--Try to update Bklog of Neha from 0 to -1
UPDATE STU_MASTER SET BKLOG=-1 WHERE NAME='NEHA'


-- PART B 

--Create table as per following schema with proper validation and try to insert data which violate your validation.
--Emp(Eid, Ename, Did, Cid, Salary, Experience)
--Dept(Did, Dname)
--City(Cid, Cname)

CREATE TABLE Dept_DETAILS (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_DETAILS(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE Emp_DETAILS (
    Eid INT PRIMARY KEY,

	    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0), 
    FOREIGN KEY (Did) REFERENCES Dept_DETAILS(Did),
    FOREIGN KEY (Cid) REFERENCES City_DETAILS(Cid)
);

INSERT INTO Dept_DETAILS(Did, Dname) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

INSERT INTO City_DETAILS(Cid, Cname) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago');

INSERT INTO Emp_DETAILS(Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 5),
(2, 'Jane Smith', 2, 2, 75000.00, 8),
(3, 'Mike Johnson', 3, 3, 60000.00, 3);


-- PART C 

--Create table as per following schema with proper validation and try to insert data which violate your validation.
--1.	Emp(Eid, Ename, Did, Cid, Salary, Experience)
--		Dept(Did, Dname)
--		City(Cid, Cname, Did))
--		District(Did, Dname, Sid)
--		State(Sid, Sname, Cid)
--		Country(Cid, Cname)


CREATE TABLE Country_INFO (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE State_INFO (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country_INFO(Cid)
);

CREATE TABLE District_INFO (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State_INFO(Sid)
);

CREATE TABLE Dept_INFO (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_INFO (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District_INFO(Did)
);

CREATE TABLE Emp_INFO (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0), -- Salary must be positive
    Experience INT CHECK (Experience >= 0),  -- Experience cannot be negative
    FOREIGN KEY (Did) REFERENCES Dept_INFO(Did),
    FOREIGN KEY (Cid) REFERENCES City_INFO(Cid)
);

INSERT INTO Country_INFO (Cid, Cname) VALUES
(1, 'USA'),
(2, 'Canada'),
(3, 'UK'),
(4, 'Australia'),
(5, 'India');

INSERT INTO State_INFO (Sid, Sname, Cid) VALUES
(1, 'California', 1),
(2, 'Ontario', 2),
(3, 'London', 3),
(4, 'New South Wales', 4),
(5, 'Gujarat', 5);

INSERT INTO District_INFO (Did, Dname, Sid) VALUES
(1, 'Los Angeles', 1),
(2, 'Toronto', 2),
(3, 'Westminster', 3),
(4, 'Sydney', 4),
(5, 'Ahmedabad', 5);

INSERT INTO Dept_INFO (Did, Dname) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Finance');

INSERT INTO City_INFO (Cid, Cname, Did) VALUES
(1, 'Los Angeles City', 1),
(2, 'Toronto City', 2),
(3, 'London City', 3),
(4, 'Sydney City', 4),
(5, 'Ahmedabad City', 5);

INSERT INTO Emp_INFO (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 5),
(2, 'Jane Smith', 2, 2, 75000.00, 8),
(3, 'Mike Johnson', 3, 3, 60000.00, 3),
(4, 'Alice Brown', 4, 4, 45000.00, 2),
(5, 'Bob Green', 5, 5, 40000.00, 4);



