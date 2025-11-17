
--What is the relationship between temperature and bicycle usage?
-- Temperature ranges and bicycle usage
with temp_range as (
    SELECT case 
          when max_temp<0 then 'below freezing'
          when max_temp between 1 and 10 then 'cold'
          when max_temp between 11 and 20 then 'mild'
          when max_temp between 21 and 30 then 'warm'
          else 'hot ' end as temp_category,
          gesamt
    from rad_tage
)
select temp_category,
       sum(gesamt) as total_bikes ,
       round(avg(gesamt),2)as avg_bikes,
       count(*) as total_days
from temp_range
GROUP BY temp_category
order by avg_bikes DESC;
/*the high traffic marked in the warm days with 
avg_nikes=2966.15 ,total_bikes=14342498,
in the second position hot days */


-- Correlation between temperature and usage
SELECT 
    ROUND(AVG(max_temp), 2) AS avg_temp,
    ROUND(AVG(gesamt), 2) AS avg_bikes,
    CORR(max_temp, gesamt)AS correlation_coefficient
FROM rad_tage
WHERE max_temp IS NOT NULL 
  AND gesamt IS NOT NULL;
--moderate positive correlation between maximum temperature and bike usage.
/* avg_bikes=2030.64 
avg_temp=15.69 
correlation= 0.43755*/