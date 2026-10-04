CREATE DATABASE college;   

USE college;

CREATE TABLE student(
   rollno INT,
   name VARCHAR(30),
   Age INT
 
);

INSERT INTO student VALUES
(12 , "BOB",18),
(13,"ADAM",19),
(14,"ALOK",20);

SELECT * FROM student;


ALTER USER 'root'@'localhost' IDENTIFIED BY 'monishgowda';



