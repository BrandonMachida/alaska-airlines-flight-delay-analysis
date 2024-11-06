-- Overall On-Time Performance (OTP) for Alaska Airlines and Hawaiian Airlines
SELECT 
    carrier_code,
    COUNT(CASE WHEN departure_delay < 15 THEN 1 END) * 100.0 / COUNT(*) AS percent_on_time
FROM 
    all_airlines_departure_data_hnl
GROUP BY 
    carrier_code
ORDER BY 
    carrier_code;

-- Average Delay Duration for Flights Considered Delayed by the FAA (>= 15 minutes) for Alaska Airlines and Hawaiian Airlines
SELECT 
    carrier_code,
    AVG(departure_delay) as average_departure_delay
FROM 
    all_airlines_departure_data_hnl
WHERE 
    departure_delay >= 15
GROUP BY 
    carrier_code;

-- Percentage of Delays by Delay Type for Alaska Airlines and Hawaiian Airlines
SELECT 
    carrier_code,
    'Carrier' AS delay_type,
    ROUND(SUM(delay_carrier) * 100.0 / NULLIF(SUM(delay_carrier + delay_weather + delay_national_aviation_system + delay_security + delay_late_aircraft_arrival), 0), 2) AS percent_of_total_delay
FROM 
    all_airlines_departure_data_hnl
GROUP BY 
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'Weather' AS delay_type,
    ROUND(SUM(delay_weather) * 100.0 / NULLIF(SUM(delay_carrier + delay_weather + delay_national_aviation_system + delay_security + delay_late_aircraft_arrival), 0), 2) AS percent_of_total_delay
FROM 
    all_airlines_departure_data_hnl
GROUP BY 
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'NAS' AS delay_type,
    ROUND(SUM(delay_national_aviation_system) * 100.0 / NULLIF(SUM(delay_carrier + delay_weather + delay_national_aviation_system + delay_security + delay_late_aircraft_arrival), 0), 2) AS percent_of_total_delay
FROM 
    all_airlines_departure_data_hnl
GROUP BY 
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'Security' AS delay_type,
    ROUND(SUM(delay_security) * 100.0 / NULLIF(SUM(delay_carrier + delay_weather + delay_national_aviation_system + delay_security + delay_late_aircraft_arrival), 0), 2) AS percent_of_total_delay
FROM 
    all_airlines_departure_data_hnl
GROUP BY 
    carrier_code

UNION ALL

SELECT 
    carrier_code,
    'Late Aircraft Arrival' AS delay_type,
    ROUND(SUM(delay_late_aircraft_arrival) * 100.0 / NULLIF(SUM(delay_carrier + delay_weather + delay_national_aviation_system + delay_security + delay_late_aircraft_arrival), 0), 2) AS percent_of_total_delay
FROM 
    all_airlines_departure_data_hnl
GROUP BY 
    carrier_code
ORDER BY 
    carrier_code, delay_type;