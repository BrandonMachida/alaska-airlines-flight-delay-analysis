WITH ranked_routes AS (
    SELECT 
        carrier_code,
        destination_airport AS route,
        COUNT(CASE WHEN departure_delay >= 15 THEN 1 END) * 100.0 / COUNT(*) AS percent_delayed,
        ROW_NUMBER() OVER (PARTITION BY carrier_code ORDER BY COUNT(CASE WHEN departure_delay >= 15 THEN 1 END) * 100.0 / COUNT(*) DESC) AS rank
    FROM 
        all_airlines_departure_data_hnl
    GROUP BY 
        carrier_code, destination_airport
    HAVING 
        COUNT(*) > 10 -- Ensures the route has a significant number of flights
)
SELECT 
    carrier_code,
    route,
    percent_delayed
FROM 
    ranked_routes
WHERE 
    rank <= 5
ORDER BY 
    carrier_code, percent_delayed DESC;