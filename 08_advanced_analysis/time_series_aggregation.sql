
--How can we create rolling averages and identify trends over time?
-- 7-day rolling average for each station

SELECT 
    datum,
    zaehlstelle,
    gesamt AS daily_count,
    ROUND(AVG(gesamt) OVER (
        PARTITION BY zaehlstelle 
        ORDER BY datum 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS rolling_7day_avg
FROM rad_tage
ORDER BY zaehlstelle, datum;

-- -- Month-over-month growth rate
WITH monthly_totals AS (
    SELECT 
        DATE_TRUNC('month', datum) AS month,
        zaehlstelle,
        SUM(gesamt) AS monthly_bikes
    FROM rad_tage
    GROUP BY DATE_TRUNC('month', datum), zaehlstelle
)
SELECT 
    month,
    zaehlstelle,
    monthly_bikes,
    LAG(monthly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY month) AS prev_month_bikes,
    ROUND(
        ((monthly_bikes - LAG(monthly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY month))::NUMERIC 
        / NULLIF(LAG(monthly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY month), 0) * 100), 
        2
    ) AS pct_change
FROM monthly_totals
ORDER BY zaehlstelle, month;