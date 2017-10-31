create table bforce.lizard_shore_landing as 
select * from bforce.lizard_bvow where obj = 'PONTON'  or (
attr->'CATSLC' = '4' or attr->'CATSLC' = '11'  
 or attr->'CATSLC' = '12'  or  attr->'CATSLC' = '13'  or  attr->'CATSLC' = '14')  

