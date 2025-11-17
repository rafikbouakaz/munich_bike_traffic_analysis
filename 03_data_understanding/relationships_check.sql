
-- question: How are the tables related, and are there any data integrity issues with foreign keys?

-- Check if all stations in rad_tage exist in radzaehlstellen

SELECT DISTINCT rt.zaehlstelle
FROM rad_tage rt
LEFT JOIN radzaehlstellen rz ON rt.zaehlstelle = rz.zaehlstelle
WHERE rz.zaehlstelle IS NULL;
/* so all stations in rad_tage exist in radzaehlstelle*/

-- Check if all stations in rad_15min exist in radzaehlstellen

select r15.zaehlstelle  
from rad_15min r15
LEFT JOIN radzaehlstellen r on r.zaehlstelle=r15.zaehlstelle
where r15.zaehlstelle  is null ;

/* all stations in rad_tage exists in radzaehlstellen */

-- Count records per station to identify active vs inactive stations

SELECT 
    zaehlstelle,
    COUNT(*) AS record_count,
    CASE 
        WHEN COUNT(*) = 0 THEN 'Inactive'
        WHEN COUNT(*) < 50 THEN 'Low activity'
        ELSE 'Active'
    END AS activity_status
FROM rad_tage
GROUP BY zaehlstelle
ORDER BY record_count DESC;

/* all stations are active */

