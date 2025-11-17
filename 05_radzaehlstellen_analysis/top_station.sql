
-- question :Which are the top 10 busiest bicycle counting stations by total traffic?
/* we have just 6 stations so i will write a query to see the contribution of each station and see the 
busiest station in term of traffic detected*/
select 
      zaehlstelle,
      sum(gesamt) as total_bikes,
      round(sum(gesamt)*100.00/sum(sum(gesamt))over(),2) as contribution_percentage
from rad_tage
group by zaehlstelle
order by contribution_percentage desc; 
/* the busiest stations are in this order :

1- Erhardt 2- Margareten 3-Olympia 4-Hirsch 5-Arnulf 6-Kreuther  */