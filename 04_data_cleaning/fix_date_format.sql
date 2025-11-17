
-- question: Are there any date inconsistencies or NULL values that need to be addressed?
-- Check for NULL or invalid dates in rad_tage
SELECT 
    COUNT(*) AS total_records,
    COUNT(datum) AS non_null_dates,
    COUNT(*) - COUNT(datum) AS null_dates
FROM rad_tage;
/* no null dates in the table rad_tage*/

-- Identify records with future dates (potential data errors)
SELECT *
FROM rad_tage
WHERE datum > CURRENT_DATE
LIMIT 20;
/* the last year was in 2024,so no future dates*/

-- Check for duplicate date-station combinations
select datum,
      zaehlstelle,
      count(*) as duplicate_count
from rad_tage
group by datum,zaehlstelle
HAVING count(*)>1;
/* the zaehlstelle ='kreuther' and the duplicate_count=2 */

-- View date range coverage by station

SELECT 
    zaehlstelle,
    MIN(datum) AS first_date,
    MAX(datum) AS last_date,
    MAX(datum) - MIN(datum) AS days_span,
    COUNT(DISTINCT datum) AS unique_dates
FROM rad_tage
GROUP BY zaehlstelle
ORDER BY days_span DESC;

