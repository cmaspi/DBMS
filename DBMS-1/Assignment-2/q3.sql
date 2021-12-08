-- question 3
-- select * from (select case when minutes between 0 and 1 then 'short' when minutes between 1 and 5 then 'medium' else 'long' end as range from (select *, Milliseconds/60000.0 as minutes from tracks limit 10));

-- query to give count per classification
select classification, count(*) as count from (select *, case when minutes <1 then 'short' when minutes between 1 and 5 then 'medium' else 'long' end as classification from (select *, Milliseconds/60000.0 as minutes from tracks)) t group by t.classification;


--query to give classification of each track
select *, case when minutes <1 then 'short' when minutes between 1 and 5 then 'medium' else 'long' end as classification from (select *, Milliseconds/60000.0 as minutes from tracks);

-- select classification, count(*) from (select *, case when Milliseconds between 0 and 60000 then 'short' when Milliseconds between 60000 and 300000 then 'medium' else 'long' end as classification from tracks) t group by t.classification;


