-- Question-4

create table X( id_num integer, id_str TEXT);
insert into X (id_num,id_str) values (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
select * from X;
PRAGMA table_info('X');

select distinct T1.id_num || ',' || T2.id_num || ',' || T3.id_num as id_num_combinations, T1.id_str || ',' || T2.id_str || ',' || T3.id_str as id_str_combinations from X as T1, X as T2, X as T3 where T1.id_num < T2.id_num and T2.id_num < T3.id_num;
