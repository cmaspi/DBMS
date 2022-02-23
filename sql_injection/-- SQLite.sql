-- SQLite
.open shop.db
create table items(id number primary key, name text, quantity number);
.tables
pragma table_info(items);
insert into items values(101,"dettol",10);
insert into items values(102,"pen",100);
insert into items values(103,"mask",40);
insert into items values(105,"candies",1000);
select * from items;
select quantity from items where name="dettol";


