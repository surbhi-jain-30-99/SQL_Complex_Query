/* We need to find the Number of Winners and lossers of the match
---------------------------------------------------------------
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

o/p : 
India|SL|India
SL|Aus|Aus
SA|Eng|Eng
Eng|NZ|NZ
Aus|India|India
------------------------------------------------------------------------

Select team_name ,count(1)as no_of_matches_played ,sum(win_flag) as no_of_match_won , 
count(1)-sum(win_flag) as no_of_match_losses
from
(
Select Team_1 as team_name ,case when Team_1=Winner then 1 else 0 end as win_flag
from icc_world_cup
union all
Select Team_2 as team_name ,case when Team_2=Winner then 1 else 0 end as win_flag 
from icc_world_cup ) A
group by team_name
order by no_of_match_won desc

0/p :
India|2|2|0
NZ|1|1|0
Eng|2|1|1
Aus|2|1|1
SL|2|0|2
SA|1|0|1

-------------------------------------------------------------------------

