create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values
(1,100,cast('01-01-2022' as date),2000),
(2,200,cast('01-01-2022' as date),2500),
(3,300,cast('01-01-2022' as date),2100)
,(4,100,cast('02-02-2022' as date),2000),
(5,400,cast('02-01-2022' as date),2200),
(6,500,cast('02-01-2022' as date),2700)
,(7,100,cast('03-01-03' as date),3000),
(8,400,cast('03-01-03' as date),1000),
(9,600,cast('03-01-03' as date),3000);

select * from customer_orders;
-- ===========================================================================
with first_visit as
(select customer_id, min(order_date) as first_visit from customer_orders group by customer_id)

select co.order_date, 
sum(case when co.order_date = fv.first_visit then order_amount end) as new_customer_amount,
sum(case when co.order_date != fv.first_visit then order_amount end) as repeated_customer_amount,
sum(case when co.order_date = fv.first_visit then 1 else 0 end) as new_customer_count,
sum(case when co.order_date != fv.first_visit then 1 else 0 end) as repeated_customer_count
from customer_orders co 
inner join first_visit fv 
on co.customer_id = fv.customer_id 
group by co.order_date order by co.order_date;

-- ===========================================================================

Select a.order_date,
Sum(Case when a.order_date = a.first_order_date then 1 else 0 end) as new_customer,
Sum(Case when a.order_date != a.first_order_date then 1 else 0 end) as repeat_customer
from(
Select customer_id, order_date, min(order_date) over(partition by customer_id) as first_order_date from customer_orders) a 
group by a.order_date;
