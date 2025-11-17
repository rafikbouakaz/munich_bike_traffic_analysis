
-- How does bicycle usage differ between weekdays and weekends?
-- Weekday vs Weekend comparison

SELECT 
    CASE 
        WHEN EXTRACT(DOW FROM datum) IN (0, 6) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_days,
    SUM(gesamt) AS total_bikes,
    ROUND(AVG(gesamt), 2) AS avg_bikes_per_day,
    MIN(gesamt) AS min_bikes,
    MAX(gesamt) AS max_bikes
FROM rad_tage
GROUP BY 
    CASE 
        WHEN EXTRACT(DOW FROM datum) IN (0, 6) THEN 'Weekend'
        ELSE 'Weekday'
    END;
/* the busiest days are weekdays 
weekend : total_bikes= 26892620 
max bike per day = 12283 */ 

-- Detailed day-of-week analysis
SELECT 
    EXTRACT(DOW FROM datum) AS day_of_week_num,
    TO_CHAR(datum, 'Day') AS day_name,
    SUM(gesamt) AS total_bikes,
    ROUND(AVG(gesamt), 2) AS avg_daily_bikes,
    COUNT(*) AS total_days
FROM rad_tage
GROUP BY EXTRACT(DOW FROM datum), TO_CHAR(datum, 'Day')
ORDER BY day_of_week_num;