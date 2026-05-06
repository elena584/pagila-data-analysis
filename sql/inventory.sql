select* from inventory
limit 10;
select i.inventory_id,i.film_id
from inventory i
left join film f on i.film_id=f.film_id
where f.film_id is null;
select i.store_id,i.inventory_id
from inventory i
left join store s on i.store_id=s.store_id
where i.store_id is null;
select store_id,film_id,count(*)
from inventory
group by film_id,store_id
having count(*)>1;
select * from inventory
where last_update is null;
