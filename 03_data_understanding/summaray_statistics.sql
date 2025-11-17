
/***Question:** What are the basic statistics 
for bicycle counts and weather conditions across the dataset?
*/

-- Summary statistics for daily bicycle counts
select count(*) as total_days,
      min(datum)as earliest_day,
      max(datum) as latest_day,
      min(gesamt)as min_daily_bikes,
      max(gesamt) as max_daily_bikes,
      round(avg(gesamt),2) as avg_daily_bikes,
      round(STDDEV(gesamt),2 ) as stddev_bikes
from rad_tage;
/* rsults :
total_days  =16949 , earliest_day=2017-01-01,latest_day=2024-12-31, min_daily_bikes=0
max_daily_bikes = 12283 ,

/* it is remerkable  that means the number of bikes counted varies a lot from the average.
and the traffic is not stable*/



-- Weather statistics
select
    min(min_temp) as min_temp_detected,
    max(max_temp) as max_temp_detected,
    round(avg(min_temp),2)as avg_min_temp,
    round(avg(max_temp),2)as avg_max_temp,
    round(avg(bewoelkung),2) as avg_bewoelkung,
    round(avg(niederschlag))as avg_niederschlag,
    round(avg(sonnenstunden),2) as avg_sonnensyunden,
    max(sonnenstunden) as max_sonnenstunden,
    min(sonnenstunden) as min_sonnenstunden
from rad_tage;
/* so this query give me all details about the weather across the given period*/


-- Station count and direction information
SELECT 
    COUNT(*) AS total_stations,
    COUNT(DISTINCT richtung_1) AS unique_direction_1_labels,
    COUNT(DISTINCT richtung_2) AS unique_direction_2_labels
FROM radzaehlstellen;
/* number of stations=6
unique direction 1 =unique direction 2 = 4 */