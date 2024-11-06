-- Monthly trend of delay causes (carrier, weather, NAS, security, late aircraft)
SELECT 
    carrier_code,
    STRFTIME('%Y-%m', date) AS month, -- Extract year and month from the date
    SUM(delay_carrier) AS carrier_delay_duration,
    SUM(delay_weather) AS weather_delay_duration,
    SUM(delay_national_aviation_system) AS nas_delay_duration,
    SUM(delay_security) AS security_delay_duration,
    SUM(delay_late_aircraft_arrival) AS late_aircraft_delay_duration
FROM 
    all_airlines_departure_data_hnl
GROUP BY 
    carrier_code, STRFTIME('%Y-%m', date)
ORDER BY 
    carrier_code, month;