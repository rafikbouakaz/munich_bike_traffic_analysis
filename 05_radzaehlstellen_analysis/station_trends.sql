
-- Question: How do bicycle counts trend over time at different stations, and which stations are growing vs declining?
-- Monthly trends per station (showing growth or decline)
SELECT 
    zaehlstelle,
    TO_CHAR(datum, 'YYYY-MM') AS year_month,
    SUM(gesamt) AS monthly_bikes
FROM rad_tage
GROUP BY 
    zaehlstelle,
    TO_CHAR(datum, 'YYYY-MM')
ORDER BY 
    zaehlstelle,
    year_month;
--  What is the month-to-month growth or decline in bicycle traffic for each counting station?
-- in this step i will measure each station`s bicycle traffic changes 
/* i keep the last qury as CTE monthly_changes */

WITH monthly_changes AS (
    SELECT 
        zaehlstelle,
        TO_CHAR(datum, 'YYYY-MM') AS year_month,
        SUM(gesamt) AS monthly_bikes
    FROM rad_tage
    GROUP BY 
        zaehlstelle,
        TO_CHAR(datum, 'YYYY-MM')
    ORDER BY 
        zaehlstelle,
        TO_CHAR(datum, 'YYYY-MM')
)
SELECT 
      zaehlstelle,
      year_month,
      monthly_bikes,
      LAG(monthly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY year_month) AS prev_monthly_bikes,
      monthly_bikes - LAG(monthly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY year_month) AS monthly_change,
      ROUND(
          (monthly_bikes - LAG(monthly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY year_month)) 
          * 100.00 / 
          NULLIF(LAG(monthly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY year_month), 0), 2
      ) AS percentage_monthly_change
FROM monthly_changes
ORDER BY 
      year_month,
      zaehlstelle;
-- -- Year-over-year comparison

select zaehlstelle,
       sum(gesamt) as yearly_bikes,
       to_char(datum,'yyyy') as year 
from rad_tage
group by  zaehlstelle,to_char(datum,'yyyy')
order by  zaehlstelle,to_char(datum,'yyyy')

/* now i will develop the last query to see percentage changes over years*/
WITH yearly_bikes AS (
    SELECT 
        zaehlstelle,
        TO_CHAR(datum, 'YYYY') AS year,
        SUM(gesamt) AS yearly_bikes
    FROM rad_tage
    GROUP BY 
        zaehlstelle, 
        TO_CHAR(datum, 'YYYY')
)

SELECT 
    zaehlstelle,
    year,
    yearly_bikes,
    LAG(yearly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY year) AS prev_year_bikes,
    (yearly_bikes - LAG(yearly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY year)) AS yearly_change,
    ROUND(
        ( (yearly_bikes - LAG(yearly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY year)) 
          * 100.00 / 
          NULLIF(LAG(yearly_bikes) OVER (PARTITION BY zaehlstelle ORDER BY year), 0)
        ), 
    2) AS percentage_yearly_change
FROM yearly_bikes
ORDER BY zaehlstelle, year;

/* the high percentage goes for Arnulf station with 399.49% in 2022 */