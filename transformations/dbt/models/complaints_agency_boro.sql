SELECT 
    agency_name,
    borough,
    year,
    COUNT(*) AS total_complaints,
    AVG(resolution_time_hours) AS avg_resolution_time
FROM {{ source('main', 'nyc_threeoneone_requests') }}
WHERE agency_name IS NOT NULL
  AND borough IS NOT NULL
  AND resolution_time_hours IS NOT NULL
  AND is_excel_date_error = 0
  AND is_invalid_resolution_time = 0
GROUP BY agency_name, borough, year
ORDER BY year, agency_name, borough
