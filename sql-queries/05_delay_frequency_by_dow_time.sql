SELECT 
    carrier_code,
    CASE STRFTIME('%w', date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    CASE 
        WHEN CAST(STRFTIME('%H', scheduled_departure_time) AS INTEGER) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN CAST(STRFTIME('%H', scheduled_departure_time) AS INTEGER) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN CAST(STRFTIME('%H', scheduled_departure_time) AS INTEGER) BETWEEN 18 AND 21 THEN 'Evening'
        ELSE 'Night'
    END AS time_of_day,
    ROUND(SUM(CASE WHEN departure_delay >= 15 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS delay_rate
FROM 
    alaska_airlines_departure_data_hnl
GROUP BY 
    carrier_code, day_of_week, time_of_day
ORDER BY 
    carrier_code,
    CASE day_of_week
        WHEN 'Sunday' THEN 1
        WHEN 'Monday' THEN 2
        WHEN 'Tuesday' THEN 3
        WHEN 'Wednesday' THEN 4
        WHEN 'Thursday' THEN 5
        WHEN 'Friday' THEN 6
        WHEN 'Saturday' THEN 7
    END,
    CASE time_of_day
        WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
        WHEN 'Night' THEN 4
    END;
