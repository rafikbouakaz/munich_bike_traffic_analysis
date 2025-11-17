
--question: What is the overall performance summary for each bicycle counting station?

--Comprehensive summary of each station's bicycle activity

select rz.zaehlstelle,
       rz.latitude,
       rz.longitude,
       rz.zaehlstelle_lang,
       count(rt.datum) as active_days,
       sum(rt.gesamt)as total_bikes,
       round(avg(rt.gesamt),2) as avg_daily_bikes,
       min(rt.gesamt) as min_daily_bikes,
       max(rt.gesamt)as max_daily_bikes,
       sum(rt.richtung_1)as total_direction_1,
       sum(rt.richtung_2)as total_direction_2
from radzaehlstellen as rz
left join rad_tage rt on rz.zaehlstelle=rt.zaehlstelle
group by rz.zaehlstelle,
       rz.latitude,
       rz.longitude,
       rz.zaehlstelle_lang
order by total_bikes;

-- Question: What percentage of total bicycle traffic does each station contribute?

SELECT 
    rz.zaehlstelle,
    rz.zaehlstelle_lang,
    SUM(rt.gesamt) AS total_bikes,
    ROUND(
        SUM(rt.gesamt) * 100.0 / SUM(SUM(rt.gesamt)) OVER (),
        2
    ) AS percent_of_total
FROM radzaehlstellen rz
LEFT JOIN rad_tage rt 
    ON rz.zaehlstelle = rt.zaehlstelle
GROUP BY 
    rz.zaehlstelle,
    rz.zaehlstelle_lang
ORDER BY 
    percent_of_total DESC;

/*zaehlstelle 'erhard' conrtibute with 36.54% in the total traffic ,wich is the high percentage */

