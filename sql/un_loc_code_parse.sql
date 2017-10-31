drop table 
unloc_cords;
drop table 
unloc_geo;

--delete the create table to run as select
 create table unloc_cords as
select *,

substring(split_part (coordinates, ' ', 1),1,2) lat_p1,(substring(split_part (coordinates, ' ', 1),3,2)) lat_p2,

(case when substring(split_part (coordinates, ' ', 1),5,1) = 'S' then -1 else 1 end) lat_multi
       ,substring(split_part (coordinates, ' ', 2),1,3) lon_p1,
         substring(split_part (coordinates, ' ', 2),4,2) lon_p2,
         (case when substring(split_part (coordinates, ' ', 2),6,1) = 'W' then -1 else 1 end) lon_multi
from unlocode where coordinates is not null;


delete from unloc_cords where lat_p2 ='';

select coordinates,((lat_p1::double precision+(lat_p2::double precision/60))*lat_multi),
((lon_p1::double precision+(lon_p2::double precision/60))*lon_multi) from unloc_cords 


create table unloc_geo as
select *,st_setsrid(st_makepoint(((lon_p1::double precision+(lon_p2::double precision/60))*lon_multi)
,((lat_p1::double precision+(lat_p2::double precision/60))*lat_multi)),4326) from unloc_cords 
