--Question 2

create table instructor ( name TEXT, courseID TEXT);
insert into instructor (name, courseID) values ( 'Amy','CS1000'),( 'Aaron','CS700'),( 'Anne','CS400');
-- insert into instructor (name, courseID) values ( 'Aaron','CS700');
-- insert into instructor (name, courseID) values ( 'Anne','CS400');
select * from instructor;
PRAGMA table_info('instructor');
create table student ( name TEXT, courseID TEXT);
insert into student (name, courseID) values ( 'Jack','CS800'),( 'Jones','CS1000'), ( 'Jason','CS450');
select * from student;
PRAGMA table_info('student');
-- drop table student;
-- drop table instructor;

select instructor.name as Instructor_name, Instructor.courseID as instructor_courseID, student.name as Student_name, student.courseID as student_courseID from instructor left outer join student on student.courseID = instructor.courseID
union
select instructor.name as Instructor_name, Instructor.courseID as instructor_courseID, student.name as Student_name, student.courseID as student_courseID from student left outer join instructor on student.courseID = instructor.courseID;