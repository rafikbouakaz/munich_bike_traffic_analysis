
-- 08_business_insights/key_metrics.sql
-- Key metrics summary dashboard for Munich Bike Traffic Dataset

-- This query outputs a compact table of important KPIs.
-- Each SELECT returns one metric, and UNION ALL stacks them into one table.

SELECT 
    'Total Bicycle Counts' AS metric,
    SUM(gesamt)::TEXT AS value
FROM rad_tage

UNION ALL

SELECT 
    'Average Daily Count Across All Stations',
    ROUND(AVG(gesamt), 2)::TEXT
FROM rad_tage

UNION ALL

SELECT 
    'Total Active Stations',
    COUNT(DISTINCT zaehlstelle)::TEXT
FROM rad_tage

UNION ALL

SELECT 
    'Date Range',
    MIN(datum)::TEXT || ' to ' || MAX(datum)::TEXT
FROM rad_tage

UNION ALL

SELECT 
    'Busiest Station (Total Bikes)',
    zaehlstelle
FROM (
    SELECT zaehlstelle, SUM(gesamt) AS total
    FROM rad_tage
    GROUP BY zaehlstelle
    ORDER BY total DESC
    LIMIT 1
) AS sub

UNION ALL

SELECT
    'Busiest Day Overall',
    datum::TEXT
FROM (
    SELECT datum, SUM(gesamt) AS total
    FROM rad_tage
    GROUP BY datum
    ORDER BY total DESC
    LIMIT 1
) AS sub2

UNION ALL

SELECT
    'Busiest Month (All Stations Combined)',
    TO_CHAR(month, 'YYYY-MM')
FROM (
    SELECT DATE_TRUNC('month', datum) AS month,
           SUM(gesamt) AS total
    FROM rad_tage
    GROUP BY month
    ORDER BY total DESC
    LIMIT 1
) AS sub3

UNION ALL

SELECT
    'Average 7-Day Rolling (All Stations)',
    ROUND(AVG(rolling_avg), 2)::TEXT
FROM (
    SELECT
        AVG(gesamt) OVER (
            ORDER BY datum
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS rolling_avg
    FROM rad_tage
) AS sub4;
