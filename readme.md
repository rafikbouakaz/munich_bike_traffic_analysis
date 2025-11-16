# Munich Bike Traffic Analysis

## Overview
This project provides a comprehensive analysis of bicycle usage in Munich using real-world data. The goal is to uncover patterns, trends, and insights from bike-sharing data, including the impact of weather, time, and station performance.

The analysis is done using **SQL queries** on multiple tables, covering:
- Daily and hourly bike usage
- Weather impacts (temperature, precipitation, cloud coverage)
- Station-level performance
- Rolling averages and trends over time
- Key metrics and business insights
munich_bike_traffic_analysis/
│
├── 01_data_understanding/ # Data exploration and summary statistics
│ ├── preview_data.sql
│ ├── summaray_statistics.sql
│ └── relationships_check.sql
│
├── 02_data_cleaning/ # Cleaning and preprocessing queries
│ ├── fix_date_format.sql
│ └── other_cleaning.sql
│
├── 03_radzaehlstellen_analysis/ # Station-level analysis
│ ├── station_summary.sql
│ ├── station_trends.sql
│ └── top_station.sql
│
├── 04_time_analysis/ # Temporal patterns (hourly, weekday/weekend, monthly)
│ ├── hourly_patterns.sql
│ ├── weekday_vs_weekend.sql
│ └── monthly_trends.sql
│
├── 05_weather_analysis/ # Weather impact on bike usage
│ ├── best_weather_days.sql
│ ├── temperature_effect.sql
│ └── weather_vs_traffic.sql
│
├── 06_advanced_analysis/ # Advanced insights (multi-table, time-series)
│ ├── multi_table_analysis.sql
│ ├── station_weather_combined.sql
│ └── time_series_aggregation.sql
│
├── 07_business_insights/ # Key metrics and summary dashboards
│ └── key_metrics.sql
│
├── setup/ # Setup scripts
│ └── create_tables.sql
│
└── README.md # Project documentation
