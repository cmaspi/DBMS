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