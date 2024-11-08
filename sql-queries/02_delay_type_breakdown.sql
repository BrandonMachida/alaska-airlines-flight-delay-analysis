-- Average Delay Duration by Delay Type in Minutes
SELECT
    carrier_code,
    'Carrier' AS delay_type,
    AVG(delay_carrier) AS average_delay_minutes
FROM alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'Weather' AS delay_type,
    AVG(delay_weather) AS average_delay_minutes
FROM alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code

UNION ALL

SELECT 
   carrier_code,
    'National Aviation System' AS delay_type,
    AVG(delay_national_aviation_system) AS average_delay_minutes
FROM alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'Security' AS delay_type,
    AVG(delay_security) AS average_delay_minutes
FROM alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code
    
UNION ALL

SELECT 
    carrier_code,
    'Late Aircraft Arrival' AS delay_type,
    AVG(delay_late_aircraft_arrival) AS average_delay_minutes
FROM alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    carrier_code
ORDER BY 
    carrier_code, delay_type;

-- Average Delay Duration of Late Aircraft Arrials by Destination Airport 
SELECT 
    destination_airport,
    'Late Aircraft Arrival' AS delay_type,
    AVG(delay_late_aircraft_arrival) AS average_delay_minutes
FROM alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY
    destination_airport
ORDER BY
    average_delay_minutes DESC;

-- Average Delay Duration of Late Aircraft Arrials on San Diego (SAN) route in 2023
SELECT 
    destination_airport,
    'Late Aircraft Arrival' AS delay_type,
    AVG(delay_late_aircraft_arrival) AS average_delay_minutes
FROM alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15 AND
    destination_airport = 'SAN' AND
    CAST(strftime('%Y', date) AS INTEGER) = 2023
GROUP BY
    destination_airport
ORDER BY
    average_delay_minutes DESC;

-- Average Delay Duration of Late Aircraft Arrials on San Diego (SAN) route in 2024
SELECT 
    destination_airport,
    'Late Aircraft Arrival' AS delay_type,
    AVG(delay_late_aircraft_arrival) AS average_delay_minutes
FROM alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15 AND
    destination_airport = 'SAN' AND
    CAST(strftime('%Y', date) AS INTEGER) = 2024
GROUP BY
    destination_airport
ORDER BY
    average_delay_minutes DESC;


-- Percentage of Delayed Flights by Late Aircraft Arrival by Destination Airport
SELECT 
    destination_airport,
    'Late Aircraft Arrival' AS delay_type,
    ROUND(SUM(delay_late_aircraft_arrival) * 100.0 / NULLIF(SUM(delay_carrier + delay_weather + delay_national_aviation_system + delay_security + delay_late_aircraft_arrival), 0), 2) AS percent_of_total_delay
FROM 
    alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY 
    destination_airport
ORDER BY
    percent_of_total_delay DESC;

-- Percentage of Delayed Flights by Late Aircraft Arrival for San Diego (SAN) route in 2023
SELECT 
    destination_airport,
    'Late Aircraft Arrival' AS delay_type,
    ROUND(SUM(delay_late_aircraft_arrival) * 100.0 / NULLIF(SUM(delay_carrier + delay_weather + delay_national_aviation_system + delay_security + delay_late_aircraft_arrival), 0), 2) AS percent_of_total_delay
FROM 
    alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15 AND
    destination_airport = 'SAN' AND
    CAST(strftime('%Y', date) AS INTEGER) = 2023
GROUP BY 
    destination_airport
ORDER BY
    percent_of_total_delay DESC;

-- Percentage of Delayed Flights by Late Aircraft Arrival for San Diego (SAN) route in 2024
SELECT 
    destination_airport,
    'Late Aircraft Arrival' AS delay_type,
    ROUND(SUM(delay_late_aircraft_arrival) * 100.0 / NULLIF(SUM(delay_carrier + delay_weather + delay_national_aviation_system + delay_security + delay_late_aircraft_arrival), 0), 2) AS percent_of_total_delay
FROM 
    alaska_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15 AND
    destination_airport = 'SAN' AND
    CAST(strftime('%Y', date) AS INTEGER) = 2024
GROUP BY 
    destination_airport
ORDER BY
    percent_of_total_delay DESC;
