-- SQLite
-- .tables
-- select * from artists;
-- select * from artists natural left join albums;
PRAGMA table_info('artists');
-- insert into artists values(1111,'a');
-- delete from artists where ArtistId = 1111;
select upper(substr(Name,1,1)) as Alphabet, count(*) as num from artists natural left join albums group by Alphabet;
-- select sum(num) from (select substr(Name,1,1) as Alphabet ,count(*) as num from artists natural left join albums group by Alphabet);

-- 
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

-- question 3
-- select * from (select case when minutes between 0 and 1 then 'short' when minutes between 1 and 5 then 'medium' else 'long' end as range from (select *, Milliseconds/60000.0 as minutes from tracks limit 10));


-- select classification, count(*) from (select *, case when Milliseconds between 0 and 60000 then 'short' when Milliseconds between 60000 and 300000 then 'medium' else 'long' end as classification from tracks) t group by t.classification;


select classification, count(*) as count from (select *, case when minutes <1 then 'short' when minutes between 1 and 5 then 'medium' else 'long' end as classification from (select *, Milliseconds/60000.0 as minutes from tracks)) t group by t.classification;

-- Question-4

create table X( id_num integer, id_str TEXT);
insert into X (id_num,id_str) values (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
select * from X;
PRAGMA table_info('X');

select distinct T1.id_num || ',' || T2.id_num || ',' || T3.id_num as id_num_combinations, T1.id_str || ',' || T2.id_str || ',' || T3.id_str as id_str_combinations from X as T1, X as T2, X as T3 where T1.id_num < T2.id_num and T2.id_num < T3.id_num;



