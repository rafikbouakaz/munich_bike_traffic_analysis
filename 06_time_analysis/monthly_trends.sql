
--What are the monthly bicycle usage patterns across all stations?
-- Monthly aggregated bicycle counts

SELECT 
    DATE_TRUNC('month', datum) AS month,
    TO_CHAR(datum, 'Month YYYY') AS month_name,
    SUM(gesamt) AS total_bikes,
    ROUND(AVG(gesamt), 2) AS avg_daily_bikes,
    COUNT(DISTINCT zaehlstelle) AS active_stations
FROM rad_tage
GROUP BY DATE_TRUNC('month', datum), TO_CHAR(datum, 'Month YYYY')
ORDER BY month;

-- Month-of-year patterns (aggregated across all years)
SELECT 
    EXTRACT(MONTH FROM datum) AS month_number,
    TO_CHAR(datum, 'Month') AS month_name,
    SUM(gesamt) AS total_bikes,
    ROUND(AVG(gesamt), 2) AS avg_daily_bikes,
    COUNT(*) AS total_days
FROM rad_tage
GROUP BY EXTRACT(MONTH FROM datum), TO_CHAR(datum, 'Month')
ORDER BY month_number;