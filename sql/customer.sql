select* from customer
limit 10;
update customer
set first_name=trim(initcap(first_name)),
last_name=trim(initcap(last_name)),
email=trim(lower(email));
select first_name,last_name,email
from customer
where (first_name is null or first_name='')
and email is null or email='';
select email,count(*)
from customer
group by email
having count(*)>1;
select distinct activebool
from customer;
select customer_id,activebool,active
from customer
where(activebool=True and active=0)
and (activebool=false and active=1);
select c.customer_id,c.address_id
from customer c
left join address a on c.address_id=a.address_id
where a.address_id is null;
select c.customer_id,c.store_id
from customer c
left join store a on c.store_id=a.store_id
where a.store_id is null;