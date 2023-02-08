create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));
-- ================================================================
insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),
('A','Bangalore','A1@gmail.com',1,'CPU'),
('A','Bangalore','A2@gmail.com',2,'DESKTOP'),
('B','Bangalore','B@gmail.com',2,'DESKTOP'),
('B','Bangalore','B1@gmail.com',2,'DESKTOP'),
('B','Bangalore','B2@gmail.com',1,'MONITOR');

-- ================================================================

select * from entries;

-- ================================================================

with cte as(
select name ,floor,count(1) no_of_floor_visit 
,rank()over(partition by name order by count(1) desc) as rn
from entries
group by name ,floor )
select fv.name ,fv.floor as most_visted_floor from cte fv where rn=1;


-- ================================================================

select name,count(*) as total_visits,
		(select e1.floor from entries e1 where e1.name=e.name 
		group by floor order by count(e1.floor) desc limit 1) as frequent_floor
		,group_concat(distinct resources) as used_resources
from entries e
group by name;



select name,count(name),floor,GROUP_CONCAT(DISTINCT resources)
from 
(
select name,floor,count(floor) over(partition by name,floor order by floor) as c,resources
from entries ) ta
 group by name having c=max(c);
-- GROUP_CONCAT concats all the string in a group
-- string_agg is almost equivalent function to GROUP_CONCAT in sql server
