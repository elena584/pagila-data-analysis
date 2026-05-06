select *
from payment
limit 10;
select amount
from payment
where amount is null;
select amount 
from payment
where amount<0;
select amount
from payment
where amount=0;
select p.payment_id,p.amount,p.rental_id,r.rental_date
from payment p
left join rental r on p.rental_id=r.rental_id
where p.amount=0;
select 
    count(*) as total_payments,
    sum(case when amount = 0 then 1 else 0 end) as zero_payments,
    round(100.0 * sum(case when amount = 0 then 1 else 0 end) / count(*), 2) as zero_percentage
from payment;
select payment_id,amount
from payment
where amount<0;
select payment_id, amount
from payment
where amount>20;
select p.payment_id, p.payment_date, r.rental_date
from payment p
join rental r on p.rental_id = r.rental_id
where p.payment_date < r.rental_date;
select p.payment_id, p.customer_id
from payment p
left join customer c on p.customer_id = c.customer_id
where c.customer_id is null;
select p.payment_id, p.staff_id
from payment p
left join staff s on p.staff_id = s.staff_id
where s.staff_id is null;
