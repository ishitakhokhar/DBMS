--PART-A
--1 
--Add two more columns City VARCHAR (20) and Pincode INT.
ALTER TABLE DEPOSIT ADD CITY VARCHAR(20),PINCODE INT
--2
--Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
ALTER TABLE DEPOSIT ALTER COLUMN CNAME VARCHAR(35)
--3 
--Change the data type DECIMAL to INT in amount Column.
ALTER TABLE DEPOSIT ALTER COLUMN AMOUNT INT
--4 
--Rename Column ActNo to ANO.
sp_rename 'DEPOSIT.ACTNO','ANO'
--5 
--Delete Column City from the DEPOSIT table.
ALTER TABLE DEPOSIT DROP COLUMN CITY
--6 
--Change name of table DEPOSIT to DEPOSIT_DETAIL.
sp_rename 'DEPOSIT','DEPOSIT_DETAIL'

--PART-B
--1 
--Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
sp_rename 'DEPOSIT_DETAIL.ADATE','AOPENDATE'
--2
--Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
ALTER TABLE DEPOSIT_DETAIL DROP COLUMN AOPENDATE 
--3
--Rename Column CNAME to CustomerName.
sp_rename 'DEPOSIT_DETAIL.CNAME','CUSTOMERNAME'


--PART-C
CREATE TABLE STUDENT_DETAIL
(
	ENROLMENT_NO	VARCHAR(20),
	NAME			VARCHAR(25),
	CPI				DECIMAL(5,2),
	BIRTHDATE		DATETIME
)

--1
--Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
ALTER TABLE STUDENT_DETAIL ADD CITY VARCHAR(20) NOT NULL,BACKLOG INT
--2
--Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
ALTER TABLE STUDENT_DETAIL ALTER COLUMN NAME VARCHAR(35)
--3
--Change the data type DECIMAL to INT in CPI Column.
ALTER TABLE STUDENT_DETAIL ALTER COLUMN CPI INT 
--4
--Rename Column Enrollment_No to ENO.
sp_rename 'STUDENT_DETAIL.ENROLMENT_NO','ENO'
--5
--Delete Column City from the student_detail table.
ALTER TABLE STUDENT_DETAIL DROP COLUMN CITY
--6
--Change name of table student_detail to STUDENT_MASTER.
sp_rename 'STUDENT_DETAIL','STUDENT_MASTER'


--DELETE, Truncate, Drop Operation
--PART-A
--1
--Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000.
DELETE DEPOSIT_DETAIL WHERE AMOUNT >=4000
SELECT * FROM DEPOSIT_DETAIL
--2
--Delete all the accounts CHANDI BRANCH.
DELETE DEPOSIT_DETAIL WHERE BNAME='CHANDI'
--3
--Delete all the accounts having account number (ANO) is greater than 105.
DELETE DEPOSIT_DETAIL WHERE ANO > 105
--4
--Delete all the records of Deposit_Detail table. (Use Truncate)
TRUNCATE TABLE  Deposit_Detail
--5--Remove Deposit_Detail table. (Use Drop)DROP TABLE Deposit_Detail --PART-BCREATE TABLE EMPLOYEE_MASTER(	EMPNO	INT,	EMPNAME	VARCHAR(25),	JOININGDATE	DATETIME,	SALARY	DECIMAL(8,2),	CITY	VARCHAR(20))INSERT INTO EMPLOYEE_MASTER VALUES(101,'KEYUR','2002-01-01',12000,'RAJKOT')INSERT INTO EMPLOYEE_MASTER VALUES(102,'HARDIK','2004-02-15',14000,'Ahmedabad')INSERT INTO EMPLOYEE_MASTER VALUES(103,'KAJAL','2006-03-14',15000,'Baroda')INSERT INTO EMPLOYEE_MASTER VALUES(104,'Bhoomi','2005-06-23',12500,'Ahmedabad')INSERT INTO EMPLOYEE_MASTER VALUES(105,'Harmit','2004-02-15',14000,'Rajkot')INSERT INTO EMPLOYEE_MASTER VALUES(106,'Mitesh','2001-09-25',5000,'Jamnagar')INSERT INTO EMPLOYEE_MASTER VALUES(107,'Meera',NULL,7000,'Morbi')INSERT INTO EMPLOYEE_MASTER VALUES(108,'Kishan','2002-02-06',10000,NULL)SELECT * FROM EMPLOYEE_MASTER--1
--Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.
DELETE FROM EMPLOYEE_MASTER WHERE SALARY >= 14000
--2 
--Delete all the Employees who belongs to �RAJKOT� city.
DELETE FROM EMPLOYEE_MASTER WHERE CITY='RAJKOT'
--3 
--Delete all the Employees who joined after 1-1-2007.
DELETE FROM EMPLOYEE_MASTER WHERE JOININGDATE='2007-01-01'
--4 
--Delete the records of Employees whose joining date is null and Name is not null.
DELETE FROM EMPLOYEE_MASTER WHERE JOININGDATE IS NULL AND EMPNAME IS NOT NULL
--5 
--Delete the records of Employees whose salary is 50% of 20000.
DELETE FROM EMPLOYEE_MASTER WHERE SALARY=20000*0.5
--6 
--Delete the records of Employees whose City Name is not empty.
DELETE FROM EMPLOYEE_MASTER WHERE CITY IS NOT NULL
--7 
--Delete all the records of Employee_MASTER table. (Use Truncate)
TRUNCATE TABLE EMPLOYEE_MASTER
--8 --Remove Employee_MASTER table. (Use Drop)DROP TABLE EMPLOYEE_MASTER--PART-C--1 --Summarize Delete, Truncate and Drop