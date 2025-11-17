--What were the best weather days for cycling, and how did usage respond?
-- Top 20 best weather days (high sunshine, low rain)
select zaehlstelle,
       datum,
       gesamt as bikes,
       max_temp as temp,
       niederschlag as rain,
       bewoelkung as cloud_cover,
       sonnenstunden as sun_hours
from rad_tage
where sonnenstunden>= 8 and niederschlag =0 and (sonnenstunden BETWEEN 15 and 28 )
order by gesamt DESC
limit 20;
/* so the best day was in 2023-06-13 with total bikes of 10631 and temp=24 also sun_hours=15 */ 

-- Days with ideal conditions but low usage (opportunities)

select zaehlstelle,
       datum,
       gesamt as bikes,
       max_temp as temp,
       niederschlag as rain,
       bewoelkung as cloud_cover,
       sonnenstunden as sun_hours
from rad_tage
where sonnenstunden>= 8 and niederschlag =0 and (sonnenstunden BETWEEN 15 and 28 )
order by gesamt ASC
limit 20;
