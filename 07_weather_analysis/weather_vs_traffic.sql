
--How do different weather conditions correlate with bicycle usage?
-- Bicycle usage by weather conditions
--1.niederschlag impact

SELECT 
    case 
    when niederschlag =0 then 'no rain'
    when niederschlag BETWEEN 0.1 and 2.0 then 'light rain'
    when niederschlag BETWEEN 2.1 and 10.0 then 'moderate rain'
    when niederschlag BETWEEN 10.1 and 30 then 'heavy rain '
    else 'very heavy rain' end as rain_category,
    COUNT(*) AS days,
    ROUND(AVG(gesamt), 2) AS avg_bikes,
    SUM(gesamt) AS total_bikes
FROM rad_tage
GROUP BY  case 
    when niederschlag =0 then 'no rain'
    when niederschlag BETWEEN 0.1 and 2.0 then 'light rain'
    when niederschlag BETWEEN 2.1 and 10.0 then 'moderate rain'
    when niederschlag BETWEEN 10.1 and 30 then 'heavy rain '
    else 'very heavy rain' end
ORDER BY avg_bikes DESC;
/* the hifg usage detected in the no rain day with avg_bikes = 2337.12 
and light rain with avg_bike of 1797.49 
the vry heavy_rain avg bikes =1543.09 */ 

--2.bewoelkung impact 
-- in this query i will CTE TO AVOID REPETITION IN THE GROUP BY CLAUSE 

with bewoelkung_category as (
    select 
        case
            when bewoelkung between 0 and 2 then 'clear sky'
            when bewoelkung between 3 and 5 then 'partly cloudy'
            when bewoelkung between 6 and 7 then 'mostly cloudy'
            else 'overcast'
        end as bewoelkung_category,
        gesamt
    from rad_tage
)
select 
    bewoelkung_category,
    sum(gesamt) as total_bikes,
    round(avg(gesamt),2) as avg_bikes,
    count(*) as days_count
from bewoelkung_category
group by bewoelkung_category
order by total_bikes DESC;
/* from the data the total cloudy bikes is high '16156 days',so the total bikes very high , 
but the avg-bikes is very low wich is normal in the cloudy days */
