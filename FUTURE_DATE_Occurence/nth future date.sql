--write a query to write th occurece of sunday in future occurence

datepart 
--sunday =7
--monday=1
--'
--'
--friday=5
--saturday=6

--===================================
--The DATEADD() function adds a time/date interval to a date and then returns the date : DATEADD(interval, number, date)
  -- DATEADD(The time/date interval to add , 
             The number of interval to add to date. Can be positive (to get dates in the future) or negative (to get dates in the past), 
             The date that will be modified)

--The DATEPART() function returns a specified part of a date.
  This function returns the result as an integer value.
  --DATEPART(interval, date)

--===================================

declare @today_date date;
declare @n int;
set @today_date = '2023-02-11'; -- saturday; 
set @n= 3;

select dateadd(week,@n-1,dateadd(day,8-datepart(weekday,@today_date),@today_date)) ## (8-7[saturday--> weekday value ])---> one occurence from 1st dateadd 
 -- rest two from outside dateadd that's why @n-1 
        
