create database gym_membership_system1
use gym_membership_system1
CREATE TABLE Members (MemberID INT ,FirstName VARCHAR(50) ,Email VARCHAR(100) ,PhoneNumber VARCHAR(15),JoinDate DATE,MembershipID INT,address varchar(70))
alter table members add column payment varchar(70) 
alter table members add column grnder varchar(50)
CREATE TABLE Memberships (MembershipID INT ,MembershipType VARCHAR(50) ,Price DECIMAL(10, 2) ,DurationMonths INT )
CREATE TABLE  Instructors (InstructorID INT,FirstName VARCHAR(50),LastName VARCHAR(50),Specialty VARCHAR(100),Email VARCHAR(100))
alter table Instructors add column PhoneNumber int
CREATE TABLE  Classes (ClassID INT,ClassName VARCHAR(100),ScheduleTime TIME ,InstructorID INT)
CREATE TABLE  Enrollments (EnrollmentID INT,MemberID INT,ClassID INT,EnrollmentDate DATE)
INSERT INTO Memberships (membershipID,MembershipType, Price, DurationMonths) VALUES(111,'Basic', 3000.00, 1),(121,'Standard', 7500.00,3),(131,'Premium', 25000.00,12);
INSERT INTO Members (memberID,FirstName, Email, PhoneNumber, JoinDate, MembershipID, Address,Gender) VALUES(2,'Michael', 'michael.brown@example.com', '555-5678', '2024-02-20', 121, '202 Birch St, Springfield', 'Male'),(3,'Sarah', 'sarah.wilson@example.com', '555-8765', '2024-03-10', 131, '303 Cedar St, Springfield','Female'),(4,'James', 'james.johnson@example.com', '555-3456', '2024-04-05', 111, '404 Oak St, Springfield','Male'),(5,'Olivia', 'olivia.martinez@example.com', '555-7890', '2024-05-12', 121, '505 Pine St, Springfield', 'Female'),(6,'Liam','liam.anderson@example.com', '555-2345', '2024-06-01', 131, '606 Maple Ave, Springfield', 'Male'),(7,'Sophia', 'sophia.taylor@example.com', '555-6789', '2024-07-20', 111, '707 Elm St, Springfield', 'Female'),(8,'William', 'william.thomas@example.com', '555-9876', '2024-08-15', 121, '808 Oak Ave, Springfield',  'Male'),(9,'Isabella','isabella.moore@example.com', '555-4567', '2024-09-25', 131, '909 Pine Ave, Springfield', 'Female'),(10,'Ethan', 'ethan.jackson@example.com', '555-3457', '2024-10-05', 111, '1010 Birch Ave, Springfield','Male'),(11,'Mia',  'mia.white@example.com', '555-8760', '2024-11-10', 121, '1111 Cedar St, Springfield', 'Female'),(12,'Benjamin', 'benjamin.harris@example.com', '555-2346', '2024-12-01', 131, '1212 Maple St, Springfield', 'Male'),(13,'Ava', 'ava.clark@example.com', '555-6780', '2024-12-15', 111, '1313 Elm Ave, Springfield', 'Female'),(14,'Jacob', 'jacob.lewis@example.com', '555-3458', '2024-12-25', 121, '1414 Oak St, Springfield', 'Male'),(15,'Charlotte','charlotte.walker@example.com', '555-8761', '2024-01-05', 131, '1515 Pine St, Springfield', 'Female'),(16,'Alexander', 'alexander.young@example.com', '555-2348', '2024-01-20', 111, '1616 Cedar Ave, Springfield', 'Male'),(17,'Amelia', 'amelia.king@example.com', '555-6781', '2024-02-01', 121, '1717 Birch Ave, Springfield', 'Female'),(18,'Daniel', 'daniel.scott@example.com', '555-3459', '2024-02-15', 131, '1818 Maple Ave, Springfield', 'Male'),(19,'Harper', 'harper.adams@example.com', '555-8762', '2024-03-01', 111, '1919 Oak Ave, Springfield' , 'Female'),(20,'Matthew', 'matthew.baker@example.com', '555-2349', '2024-03-20', 121, '2020 Pine Ave, Springfield', 'Male');
update members set payment='halfpaid' where memberID=10
INSERT INTO Instructors (instructorId,FirstName, LastName, Specialty, Email, gender,PhoneNumber) VALUES(141,'John', 'Doe', 'Yoga', 'john.doe@example.com','male',5421234),(142,'Jane', 'Smith', 'Pilates', 'jane.smith@example.com','female',5435678),(143,'Alice', 'Johnson', 'Cardio', 'alice.johnson@example.com','male',5448765),(144,'Michael', 'Brown', 'Strength Training', 'michael.brown@example.com','male',5672345)
update instructors set phonenumber=5672345 where instructorId=144
INSERT INTO Classes (classID,ClassName, ScheduleTime, InstructorID) VALUES(101,'Morning Yoga', '07:00:00', 141),(102,'Evening Pilates', '18:00:00', 142),(103,'High-Intensity Cardio', '19:00:00', 143),(104,'Beginner Strength Training', '08:00:00',144)
INSERT INTO Enrollments (EnrollmentID,MemberID, ClassID, EnrollmentDate) VALUES(111,1, 101, '2024-01-15'), (121,2, 102, '2024-02-20'), (131,3, 103, '2024-03-10'),(111,4, 103, '2024-04-05'),(121,5, 104, '2024-05-12'),(131,6, 104, '2024-06-01'),(111,7, 101, '2024-07-20'),(121,8, 102, '2024-08-15'),(131,9, 102, '2024-09-25'),(111,10, 101, '2024-10-05'),(121,11, 102, '2024-11-10'),(131,12, 103, '2024-12-25'),(111,13, 101, '2024-12-15'),(121,14, 101, '2024-12-25'),(131,15, 102, '2024-01-05'),(111,16, 104, '2024-01-20'),(121,17, 103, '2024-02-01'),(131,18, 104, '2024-02-15'),(111,19, 104, '2024-03-01'),(121,20, 103, '2025-03-20')
 SELECT
    mem.memberID,
    mem.FirstName AS MemberFirstName,
    mem.MembershipID,
    ms.MembershipType,
    ms.DurationMonths,
    c.ClassID,
    c.ClassName,
    c.InstructorID,
    c.ScheduleTime,
    i.FirstName AS InstructorFirstName,
    i.LastName AS InstructorLastName,
    i.Specialty,
    e.EnrollmentDate,
    mem.payment
FROM
    Enrollments e
    INNER JOIN Members mem ON e.MemberID = mem.MemberID
    INNER JOIN Classes c ON e.ClassID = c.ClassID
    INNER JOIN Instructors i ON c.InstructorID = i.InstructorID
    INNER JOIN Memberships ms ON mem.MembershipID = ms.MembershipID;
