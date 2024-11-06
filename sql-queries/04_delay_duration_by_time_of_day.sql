SELECT 
    carrier_code,
    CASE 
        WHEN strftime('%H', scheduled_departure_time) BETWEEN '05' AND '11' THEN 'Morning'
        WHEN strftime('%H', scheduled_departure_time) BETWEEN '12' AND '17' THEN 'Afternoon'
        WHEN strftime('%H', scheduled_departure_time) BETWEEN '18' AND '21' THEN 'Evening'
        ELSE 'Night'
    END AS time_of_day,
    ROUND(AVG(departure_delay), 2) AS avg_delay_duration
FROM 
    all_airlines_departure_data_hnl
WHERE
    departure_delay >= 15
GROUP BY 
    carrier_code, time_of_day
ORDER BY 
    carrier_code, 
    CASE time_of_day
        WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
        WHEN 'Night' THEN 4
    END;