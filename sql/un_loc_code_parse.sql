create table unloc_cords as 
select *,(case when substring(split_part (coordinates, ' ', 1),5,1) = 'S' then '-'||((substring(split_part (coordinates, ' ', 1),1,2)||'.'||
substring(split_part (coordinates, ' ', 1),3,2))) else (substring(split_part (coordinates, ' ', 1),1,2)||'.'||
substring(split_part (coordinates, ' ', 1),3,2)) end) lat, 
       (case when substring(split_part (coordinates, ' ', 2),6,1) = 'W' then '-'|| ((substring(split_part (coordinates, ' ', 2),1,3)||'.'||
substring(split_part (coordinates, ' ', 2),4,2))) else (substring(split_part (coordinates, ' ', 2),1,3)||'.'||
substring(split_part (coordinates, ' ', 2),4,2)) end) lon

from unlocode where coordinates is not null;


delete from unloc_cords where lon ='.';

create table unloc_geo as
select *,st_setsrid(st_makepoint(lon::double precision,lat::double precision),4326) from unloc_cords 

