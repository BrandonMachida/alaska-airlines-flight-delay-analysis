-- Average Delay Duration by Delay Type in Minutes
SELECT
    carrier_code,
    'Carrier' AS delay_type,
    AVG(delay_carrier) AS average_delay_minutes
FROM all_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'Weather' AS delay_type,
    AVG(delay_weather) AS average_delay_minutes
FROM all_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'National Aviation System' AS delay_type,
    AVG(delay_national_aviation_system) AS average_delay_minutes
FROM all_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'Security' AS delay_type,
    AVG(delay_security) AS average_delay_minutes
FROM all_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'Late Aircraft Arrival' AS delay_type,
    AVG(delay_late_aircraft_arrival) AS average_delay_minutes
FROM all_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code
ORDER BY 
    carrier_code, delay_type;