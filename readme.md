
# Munich Bicycle Traffic Analysis (2017–2024)

## Overview
This project analyzes bicycle traffic patterns in Munich over the period **2017–2024** using data collected from six bike counting stations. The analysis focuses on **station performance, temporal trends, peak hours, and weather impacts**, providing actionable insights into urban mobility.

## Dataset
The dataset consists of three main tables:

1. **`radzaehlstellen`** – Metadata of counting stations (location, directions, special notes).  
2. **`rad_tage`** – Daily aggregated bicycle counts with weather information.  
3. **`rad_15min`** – 15-minute interval bicycle counts for detailed temporal analysis.  

**Date range:** 2017-01-01 to 2024-12-31  
**Total records:**  
- Daily (`rad_tage`): 169,494  
- 15-min intervals (`rad_15min`): 1,620,783  
- Stations (`radzaehlstellen`): 6  

## Tools & Technologies
- **SQL (PostgreSQL)** for data analysis  
- Optional: VS Code, pgAdmin


## Main Business Questions & Insights

### 1. How much bicycle traffic is recorded in Munich?
- **Total bicycles counted (2017–2024):** 36,892,520  
- **Average daily bikes:** 2,030  
- **All stations active** with consistent daily counts  

### 2. Which stations are the busiest?
- **Top stations by total traffic:**  
  1. Erhardt – 36.54% of total traffic  
  2. Margareten  
  3. Olympia  
  4. Hirsch  
  5. Arnulf  
  6. Kreuther  

### 3. How does bicycle usage change over time?
- **Monthly & yearly trends** show growth in Arnulf (+399.49% in 2022) and variations across other stations.  
- **7-day rolling averages** smooth fluctuations and reveal consistent patterns.  

### 4. What are the peak hours?
- **Morning rush:** 6–9 AM  
- **Evening rush:** 16–19 PM (higher than morning)  
- **Peak 15-min interval:** 17:45 with ~851,459 bikes  

### 5. How does weather impact bicycle usage?
- **Temperature:** Moderate positive correlation with bike usage (correlation = 0.44)  
- **Best conditions:** Warm and hot days, dry weather  
- **Rain impact:** Avg bikes drop significantly on rainy days; some stations more affected than others  

### 6. How do weekdays compare to weekends?
- **Weekdays:** Highest traffic, with max daily bikes 12,283  
- **Weekends:** Lower traffic, total bikes = 26,892,620  

## Key Metrics Dashboard
| Metric | Value |
|--------|-------|
| Total Bicycle Counts | 36,892,520 |
| Average Daily Count | 2,030 |
| Total Active Stations | 6 |
| Date Range | 2017-01-01 to 2024-12-31 |
| Busiest Station | Erhardt |
| Busiest Day Overall | 2022-05-15 |
| Busiest Month | 2022-06 |
| Average 7-Day Rolling | 2,035 |

## Contact
- LinkedIn: [Rafik Bouakaz](https://www.linkedin.com/in/rafik-bouakz-48454722a/)  
- GitHub: [rafikbouakaz](https://github.com/rafikbouakaz)



