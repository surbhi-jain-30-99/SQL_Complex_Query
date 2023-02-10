-- We can find out top 20 % products which gives 80% of the sales. This is also known as pareto principle(PP)
--PP states that 80% of consequences come from 20% of the causes .
--

--Friend and Person (Join)
--DATASET LINK :https://drive.google.com/drive/folders/1Dc81McsB4lp1JUIwssDmmOaw6Z7rBK8T

--A query to write a person id ,name,sum of marks, no.of friends of a person who has friends having sum of marks greater than 100

--Friends and person table

with cte as(
Select p.person_id , Sum(p.score) as total_score ,count(1) asno_of_friends from Person p inner Join friends f
on p.person_id=f.friend_id
group by person_id
having sum(p.score)>100;)

Select c.* ,p.name from person p inner join cte c
on p.person_id=c.person_id; 





