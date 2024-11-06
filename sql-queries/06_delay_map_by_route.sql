SELECT 
    carrier_code,
    'HNL' AS origin_airport,
    destination_airport,
    ROUND(AVG(departure_delay), 2) AS avg_delay_duration, -- Average delay duration per airline and route
    ROUND(SUM(CASE WHEN departure_delay >= 15 THEN 1 ELSE 0 END) * 100.0 
          / NULLIF(COUNT(*), 0), 2) AS percent_delayed, -- Percentage of delayed flights (>= 15 minutes) per airline and route
    COUNT(*) AS total_flights, -- Total number of flights on the route
    SUM(CASE WHEN departure_delay >= 15 THEN 1 ELSE 0 END) AS total_delayed_flights -- Total number of delayed flight on the route
FROM 
    all_airlines_departure_data_hnl
GROUP BY 
    carrier_code, destination_airport
ORDER BY 
    carrier_code, percent_delayed DESC, avg_delay_duration DESC;