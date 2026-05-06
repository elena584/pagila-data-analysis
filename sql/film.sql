select * from film
limit 10;
update film
set title=trim((title));

select original_language_id, count(*)
from film
group by original_language_id
order by original_language_id;
do $$
declare
    r record;
    sql text;
begin
    for r in 
        select column_name 
        from information_schema.columns 
        where table_name = 'film'
    loop
        sql := format(
            'select ''%s'' as column_name, count(*) as null_count 
             from film 
             where %I is null',
            r.column_name, r.column_name
        );
        execute sql;
    end loop;
end $$;
do $$
declare
    r record;
    sql text;
begin
    for r in 
        select column_name 
        from information_schema.columns 
        where table_name = 'film'
          and data_type in ('text', 'character varying')
    loop
        sql := format(
            'select ''%s'' as column_name, count(*) as empty_count
             from film
             where trim(%I) = '''' ',
            r.column_name, r.column_name
        );
        execute sql;
    end loop;
end $$;
select rental_duration
from film
where rental_duration<0 or rental_duration=0 or rental_duration>30;
select rental_rate
from film
where rental_rate <= 0
   or rental_rate > 10;
  select rental_rate, count(*)
from film
group by rental_rate
order by rental_rate;
 select rental_duration, count(*)
from film
group by rental_duration
order by rental_duration;
select distinct rating 
from film;