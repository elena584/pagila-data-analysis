select * from category 
limit 30;
select name, last_update,
extract(YEAR from last_update) as year,
extract (month from last_update) as month,
trim(to_char(last_update,'tmday'))as day_of_week
from category;
select last_update,count(*)
from category
group by last_update