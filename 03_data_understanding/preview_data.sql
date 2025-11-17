-- show sample rows from each table 
select * from rad_tage
limit 3;

select * from rad_15min
limit 4;

select * from radzaehlstellen
limit 5;

-- 2 row counts 
 select count(*) as total_rows
 from radzaehlstellen;
-- total radzaehlstellen are 6 wich mean 6 sensors in munich city 

select count(*) as total_records
from rad_15min;
-- total agregated data during the study period is 1620783 records each record contatin data for only 15 min

select count(*) as total_records
from rad_tage;

-- result 169494

-- date range and stations number 
select min(datum)as min_date,
       max(datum)as max_date,
       count(DISTINCT zaehlstelle) as DISTINCT_stations
FROM rad_tage;

-- so the total number of stations is 6 and the sensors start colecting the data in '2017-01-01'
-- the end of colecting data '2024-12-31'
