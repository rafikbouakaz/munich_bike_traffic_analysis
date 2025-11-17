
-- question :What insights can we gain by combining daily aggregates with 15-minute interval data?
-- Compare daily totals with sum of 15-minute intervals (data quality check)
SELECT 
    rt.datum,
    rt.zaehlstelle,
    rt.gesamt AS daily_total,
    COALESCE(SUM(r15.gesamt), 0) AS sum_of_15min_intervals,
    rt.gesamt - COALESCE(SUM(r15.gesamt), 0) AS difference
FROM rad_tage rt
LEFT JOIN rad_15min r15 ON rt.datum = r15.datum 
    AND rt.zaehlstelle = r15.zaehlstelle
GROUP BY rt.datum, rt.zaehlstelle, rt.gesamt
HAVING ABS(rt.gesamt - COALESCE(SUM(r15.gesamt), 0)) > 10
ORDER BY ABS(rt.gesamt - COALESCE(SUM(r15.gesamt), 0))DESC;

-- Peak hour identification with weather context

SELECT 
    DATE_TRUNC('day', r15.datum) AS date,
    EXTRACT(HOUR FROM r15.uhrzeit_start) AS peak_hour,
    SUM(r15.gesamt) AS hourly_bikes,
    rt.max_temp,
    rt.niederschlag,
    rt.sonnenstunden
FROM rad_15min r15
INNER JOIN rad_tage rt ON r15.datum = rt.datum 
    AND r15.zaehlstelle = rt.zaehlstelle
GROUP BY 
    DATE_TRUNC('day', r15.datum), 
    EXTRACT(HOUR FROM r15.uhrzeit_start),
    rt.max_temp,
    rt.niederschlag,
    rt.sonnenstunden
ORDER BY hourly_bikes DESC
LIMIT 30;