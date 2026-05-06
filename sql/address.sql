select * from address
limit 10;
update address
set address=trim(address),
district=trim(district);
select * from address
limit 1;
select address2, count(*)
from address
where address2 is null or address=''
group by address2;
update address
set address2=Null
where trim(address2)='' or address2 is null;
select* from address
limit 10;
select dist