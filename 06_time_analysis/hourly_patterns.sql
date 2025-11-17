
 --question : What are the peak hours for bicycle usage based on 15-minute interval data?
-- Hourly patterns from 15-minute data!

select 
    EXTRACT(HOUR FROM uhrzeit_start) AS hour_of_day,
    SUM(gesamt) AS total_bikes,
    ROUND(AVG(gesamt), 2) AS avg_bikes_per_interval,
    COUNT(*) AS total_intervals
FROM rad_15min
GROUP BY EXTRACT(HOUR FROM uhrzeit_start)
ORDER BY hour_of_day;
/* so its clear the peak hours are in the early morning 7 and the end of work hour 17 */


-- Peak 15-minute intervals across all data
SELECT 
    uhrzeit_start,
    SUM(gesamt) AS total_bikes,
    ROUND(AVG(gesamt), 2) AS avg_bikes
FROM rad_15min
GROUP BY uhrzeit_start
ORDER BY total_bikes DESC
LIMIT 20;
/*the peak 15 min interval is : uhrzeit_start = 17:45 with total_bikes = 851459 and avg_ikes  =50.46*/

-- Rush hour analysis (morning vs evening)!!

SELECT 
    CASE 
        WHEN EXTRACT(HOUR FROM uhrzeit_start) BETWEEN 6 AND 9 THEN 'Morning Rush'
        WHEN EXTRACT(HOUR FROM uhrzeit_start) BETWEEN 16 AND 19 THEN 'Evening Rush'
        ELSE 'Off-Peak'
    END AS time_period,
    SUM(gesamt) AS total_bikes,
    ROUND(AVG(gesamt), 2) AS avg_bikes
FROM rad_15min
GROUP BY 
    CASE 
        WHEN EXTRACT(HOUR FROM uhrzeit_start) BETWEEN 6 AND 9 THEN 'Morning Rush'
        WHEN EXTRACT(HOUR FROM uhrzeit_start) BETWEEN 16 AND 19 THEN 'Evening Rush'
        ELSE 'Off-Peak'
    END
ORDER BY total_bikes DESC;

/* so the evening rush is higher than morning rush
evening_rush =11345681 */


