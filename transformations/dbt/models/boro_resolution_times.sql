SELECT 
    borough,
    EXTRACT(YEAR FROM created_date) AS request_year,
    COUNT(*) AS total_requests,
    AVG(resolution_time_hours)/24  AS avg_resolution_time
FROM {{ source('main', 'nyc_threeoneone_requests') }}
WHERE borough IS NOT NULL
  AND is_excel_date_error = 0
  AND is_invalid_resolution_time = 0
GROUP BY borough, request_year
ORDER BY request_year, avg_resolution_time DESC
