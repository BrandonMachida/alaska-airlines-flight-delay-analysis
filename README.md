# Alaska Airlines Flight Departure Data Analysis

## Project Overview
This project is a detailed data analysis of Alaska Airlines' flight departure data, focusing on departures from Honolulu (HNL) to all destination airports. 

The analysis includes Python scripts for data cleaning and processing, SQL queries to extract insights, and Tableau visualizations that identify patterns and key factors impacting flight delays across a range of variables.

## Objective
The primary goal of this project is to identify and visualize factors contributing to delays in Alaska Airlines' departures from Honolulu. Specifically, the project aims to:
- **Quantify** various delay types and their impact on departure times.
- **Identify trends** in delays over time to aid in strategic planning and operational adjustments.
- **Develop visualizations** that facilitate quick insights and enable decision-makers to assess areas for operational improvement.

## Data Source
The dataset used in this project originates from the Bureau of Transportation Statistics (BTS) DB20, focused on Alaska Airlines departures from HNL. The collected data begins from 01-01-2023 to the most recently available data at the time of this project, 08-31-2024. It provides a granular view of various types of delays, including delays caused by the carrier, weather, security, late aircraft arrival, and air traffic control.

### File Structure
This project is organized into the following directories and files:

- **data/**: Contains raw, cleaned, and processed datasets related to Alaska Airlines' departures from Honolulu (HNL).
  - **raw/**: Monthly raw data files from 2023-01 to 2024-08.
  - **cleaned/**: Monthly cleaned data files from 2023-01 to 2024-08, prepared for analysis.
  - **processed/**: Consolidated dataset used in the analysis, `alaska_airlines_hnl_departures_processed.csv`.

- **scripts/**: Contains Python scripts used for data processing and cleaning.
  - `clean_departure_data.py`: Script for cleaning and standardizing raw data files.
  - `combine_departure_data.py`: Combines cleaned monthly data into a single dataset.
  - `load_departure_data_to_sql.py`: Loads processed data into a SQL database for querying.
  - `departure_data_hnl.db`: SQLite database file containing loaded data.

- **sql-queries/**: Contains SQL scripts used for exploratory data analysis and extracting key insights.
  - `01_key_performance_metrics.sql`: Queries for calculating main performance metrics.
  - `02_delay_type_breakdown.sql`: Breakdown of delays by type.
  - `03_route_performance_comparison.sql`: Comparison of performance metrics across routes.
  - `04_delay_duration_by_time_of_day.sql`: Analysis of delays based on time of day.
  - `05_delay_frequency_by_day_time.sql`: Analysis of delay frequency by day and time.
  - `06_delay_map_by_route.sql`: Mapping delays across different routes.
  - `07_monthly_trend_by_delay_type.sql`: Monthly trend analysis by delay type.

- **dashboard/**: Contains Tableau visualization files.
  - `alaska_airlines_dashboard.html`: HTML version of the Tableau dashboard for interactive viewing.
  - `alaska_airlines_departure_data_dashboard.twb`: Tableau workbook file containing the visualization.

## Project Structure
### 1. Data Cleaning and Processing
Using Python and SQL:
- Loaded and processed the dataset to ensure clean, standardized values.
- Managed missing data in delay columns and standardized times to ensure uniform analysis.
- Aggregated data by delay type to facilitate further exploration.

### 2. Exploratory Data Analysis (EDA)
Conducted an exploratory analysis using SQL queries:
- **Delay Distribution Analysis**: Quantified delays across various categories (carrier, weather, security, late aircraft, and NAS delays).
- **Time-of-Day Trends**: Analyzed delay frequency by hour to identify peak times for delays.
- **Monthly and Daily Trends**: Explored seasonal and day-of-week trends in delays, helping identify periods of potential operational stress.

### 3. SQL Queries and Key Insights
This project involved several SQL queries, each aimed at uncovering specific insights from the Alaska Airlines departure data:

- **01_key_performance_metrics.sql**: 
  - Extracts high-level performance metrics such as total flights, average delay duration, and on-time performance rate.
  - Provides a summary view of Alaska Airlines' departure performance from Honolulu, which is essential for understanding overall operational efficiency.

- **02_delay_type_breakdown.sql**:
  - Breaks down delays by type, including carrier, weather, security, late aircraft arrival, and NAS (National Aviation System).
  - Helps identify the primary contributors to departure delays, allowing the airline to target specific areas for improvement.

- **03_route_performance_comparison.sql**:
  - Compares performance metrics across different routes originating from Honolulu.
  - Useful for identifying routes with higher delay frequencies or durations, which may require additional operational focus or resource allocation.

- **04_delay_duration_by_time_of_day.sql**:
  - Analyzes delay durations based on the time of day.
  - Reveals time-of-day patterns in delays, such as longer delays in the afternoon or evening, potentially due to cumulative delays throughout the day.

- **05_delay_frequency_by_dow_time.sql**:
  - Examines delay frequency by day of the week and time of day.
  - Highlights patterns indicating peak days and times for delays, supporting scheduling adjustments and resource allocation to improve punctuality.

- **06_delay_map_by_route.sql**:
  - Maps delays across different routes, providing a visual representation of delay trends by route.
  - Allows stakeholders to quickly identify which routes experience higher delays, aiding in route-specific strategic planning.

- **07_monthly_trend_by_delay_type.sql**:
  - Provides a monthly trend analysis of delays, categorized by delay type.
  - Useful for identifying seasonal trends or recurring monthly patterns, which can inform long-term operational adjustments.

Each SQL query provided valuable insights into the data, supporting Alaska Airlines' Audit Program objectives such as Continuous Monitoring, Audit Metrics, and Dynamic Reporting. The insights derived from these queries informed the Tableau dashboard visualizations, which facilitate an interactive exploration of Alaska Airlines' departure delays and help stakeholders make data-driven decisions.

### 4. Dashboard Visualization
A Tableau dashboard was developed to display insights interactively, hosted publicly. The dashboard includes:
- **Summary Metrics**: Visualizes total delays by type (carrier, weather, etc.), with interactive filters for specific timeframes.
- **Trend Analysis**: Displays delays by month, day, and time of day to highlight patterns and potential operational inefficiencies.
- **Delay Type Breakdown**: Allows users to drill down into specific delay types, understanding their relative contributions to departure delays.

[View the Alaska Airlines Departure Data Dashboard](https://public.tableau.com/views/alaska_airlines_departure_data_dashboard/Main) or see preview below.

[![Dashboard Preview](https://public.tableau.com/static/images/al/alaska_airlines_departure_data_dashboard/Main/1.png)](https://public.tableau.com/views/alaska_airlines_departure_data_dashboard/Main)

## Key Findings
1. **Carrier Delays Are the Primary Delay Cause at HNL Airport**:
   - Through the `02_delay_type_breakdown.sql` query, it was found that **carrier-related delays** are the largest contributor to total delay minutes. Because of these delays, it is recommended to look into internal processes like maintenance, crew availability, or aircraft readiness. If specific maintenance issues or scheduling conflicts are common, for example, addressing these could reduce delay minutes.
   - By comparing data from 2023 and 2024, we see that carrier delays have either persisted or marginally decreased, reflecting some operational adjustments but also highlighting areas that still require attention. The dashboard projects potential delay minutes for carrier-related issues in the remaining months of 2024 based on current trends, providing actionable insights for preemptive management.

2. **Time-of-Day Impact on Delays**:
   - The `04_delay_duration_by_time_of_day.sql` and `05_delay_frequency_by_dow_time.sql` queries provided insights into how delays vary throughout the day. The analysis shows that **flights scheduled later in the day tend to experience longer delays**. This pattern is likely due to a cascading effect, where minor delays in morning flights gradually impact subsequent departures.
   - The dashboard visualization for time-of-day trends helps identify peak delay periods, showing that delays are more frequent and longer in the afternoon and early evening hours. This insight supports targeted resource allocation during these high-delay periods, such as ensuring additional ground crew or maintenance support to handle potential issues quickly.
   - Comparing 2023 and 2024 data, it is evident that these time-of-day patterns are consistent across both years, indicating a structural issue that may require more strategic adjustments, such as rescheduling high-traffic routes or adjusting crew shifts to address afternoon peaks. The dashboard's projections for the remaining months of 2024 can help Alaska Airlines preemptively prepare for these anticipated high-delay times.

3. **Seasonal Patterns in Delays**:
   - Using the `07_monthly_trend_by_delay_type.sql` query, we analyzed seasonal trends to identify months with higher-than-average delays. The data reveals that **certain months—such as July and December—show heightened delays**, which can be attributed to increased passenger volume during summer and winter holiday travel.
   - This seasonal surge affects various delay types, with carrier delays, late aircraft arrivals, and National Aviation System (NAS) delays all spiking during these periods. The dashboard displays this monthly trend, allowing stakeholders to visually assess which months require additional focus on minimizing delays.
   - Year-over-year analysis of 2023 and 2024 indicates similar seasonal patterns, suggesting that these are recurring trends rather than isolated instances. Based on the dashboard’s projections, Alaska Airlines can anticipate higher delays in the upcoming December holiday season and prepare accordingly by increasing staffing, optimizing aircraft turnaround times, and communicating potential delays proactively to passengers.

4. **Late Aircraft Arrival as a Secondary Delay Contributor**:
   - The `02_delay_type_breakdown.sql` and `03_route_performance_comparison.sql` queries highlight that **late aircraft arrivals** are the second-largest cause of delays. These delays typically result from late arrivals of aircraft from previous flights, which then impact subsequent departures.
   - Late aircraft arrival delays are often more challenging to manage since they depend on factors from preceding routes. The dashboard allows users to analyze which specific routes contribute most to these late arrivals, enabling Alaska Airlines to identify high-impact routes and implement measures to mitigate delays, such as adjusting buffer times for known delay-prone routes.
   - Comparing data between 2023 and 2024 shows slight improvements in reducing late aircraft arrival delays, likely due to Alaska Airlines’ initiatives to streamline turnaround times. However, the projections for late arrivals in the remaining months of 2024 indicate the need for continued focus on minimizing cascading delays, especially on high-traffic routes.

5. **Impact of Weather and NAS Delays**:
   - Although **carrier and late aircraft delays** are the primary contributors, **weather and NAS (National Aviation System) delays** also play a significant role, especially during peak travel months. These delays are generally beyond the airline’s control but can still be managed with proactive planning.
   - The monthly trend analysis in the dashboard shows spikes in weather-related delays in winter months (e.g., January and December), which aligns with seasonal weather patterns. NAS delays, often due to air traffic control restrictions, also tend to increase during high-traffic periods.
   - Year-over-year data comparison for 2023 and 2024 reveals similar patterns, suggesting that while Alaska Airlines may not directly control these delay types, it can still prepare for them by adjusting schedules, communicating with passengers, and collaborating with airport and air traffic authorities during known high-impact months. The dashboard’s projections for the remaining months of 2024 include anticipated weather-related and NAS delays, aiding in resource planning.

6. **Route-Specific Performance and Projections**:
   - The `03_route_performance_comparison.sql` query allows us to drill down into route-specific data, identifying which routes experience the most frequent or severe delays. This insight is essential for operational teams aiming to optimize punctuality on specific routes.
   - Some routes exhibit consistently higher delay frequencies, particularly those with connecting flights from high-traffic airports. The dashboard provides a route-level analysis and shows if certain routes have improved or worsened from 2023 to 2024.
   - Projecting into the remaining months of 2024, the dashboard suggests which routes are likely to experience delays based on historical data, enabling Alaska Airlines to consider proactive measures on these routes, such as increasing buffer times or optimizing schedules.

## Opportunities for the Future
- **Incorporate Real-Time Data**: My analysis was limited to publicly available datasets. If I had more time or more access to data, I would like to join the data with weather patterns in specific seasons and fuel cost data.
- **Acquisition of Hawaiian Airlines**: Considering the recent merger, I would have also explored strategies on how Alaska Airlines would assess its current operations out of Honolulu by comparing routes and delay data between these airlines and other competitors.
