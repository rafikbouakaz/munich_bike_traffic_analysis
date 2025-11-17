
-- question : How does weather impact bicycle usage differently across various stations?
-- Station performance under different weather conditions

SELECT 
    rz.zaehlstelle,
    rz.zaehlstelle_lang,
    CASE 
        WHEN rt.niederschlag = 0 THEN 'Dry'
        ELSE 'Rainy'
    END AS weather_condition,
    COUNT(*) AS days,
    ROUND(AVG(rt.gesamt), 2) AS avg_bikes,
    ROUND(AVG(rt.max_temp), 2) AS avg_temp
FROM radzaehlstellen rz
INNER JOIN rad_tage rt ON rz.zaehlstelle = rt.zaehlstelle
GROUP BY 
    rz.zaehlstelle, 
    rz.zaehlstelle_lang,
    CASE 
        WHEN rt.niederschlag = 0 THEN 'Dry'
        ELSE 'Rainy'
    END
ORDER BY rz.zaehlstelle, avg_bikes DESC;

/* in all station the avg_bikes is higher in the dry days */ 

-- Stations most/least affected by rain
WITH weather_impact AS (
    SELECT 
        rz.zaehlstelle,
        rz.zaehlstelle_lang,
        AVG(CASE WHEN rt.niederschlag = 0 THEN rt.gesamt END) AS avg_bikes_dry,
        AVG(CASE WHEN rt.niederschlag > 0 THEN rt.gesamt END) AS avg_bikes_rainy
    FROM radzaehlstellen rz
    INNER JOIN rad_tage rt ON rz.zaehlstelle = rt.zaehlstelle
    GROUP BY rz.zaehlstelle, rz.zaehlstelle_lang
)
SELECT 
    zaehlstelle,
    zaehlstelle_lang,
    ROUND(avg_bikes_dry, 2) AS avg_dry_day,
    ROUND(avg_bikes_rainy, 2) AS avg_rainy_day,
    ROUND(((avg_bikes_dry - avg_bikes_rainy) / avg_bikes_dry * 100), 2) AS pct_decrease_in_rain
FROM weather_impact
WHERE avg_bikes_dry IS NOT NULL 
  AND avg_bikes_rainy IS NOT NULL
ORDER BY pct_decrease_in_rain DESC;