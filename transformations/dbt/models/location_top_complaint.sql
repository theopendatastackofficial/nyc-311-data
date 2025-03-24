WITH complaint_counts AS (
    SELECT 
        EXTRACT(YEAR FROM created_date) AS request_year,
        ROUND(latitude, 2) AS latitude,
        ROUND(longitude, 2) AS longitude,
        complaint_type,
        COUNT(*) AS request_count,
        SUM(resolution_time_hours) AS total_resolution_time
    FROM {{ source('main', 'nyc_threeoneone_requests') }}
    WHERE latitude IS NOT NULL 
      AND longitude IS NOT NULL
      AND is_excel_date_error = 0
      AND is_invalid_resolution_time = 0
    GROUP BY request_year, ROUND(latitude, 2), ROUND(longitude, 2), complaint_type
),
ranked_complaints AS (
    SELECT 
        request_year,
        latitude,
        longitude,
        complaint_type,
        request_count,
        total_resolution_time,
        RANK() OVER (PARTITION BY request_year, latitude, longitude ORDER BY request_count DESC) AS rank
    FROM complaint_counts
)
SELECT 
    latitude,
    longitude,
    complaint_type,
    request_count,
    (total_resolution_time * 1.0 / request_count) AS weighted_avg_resolution_time
FROM ranked_complaints
WHERE rank = 1 AND request_year = 2024
ORDER BY request_year, latitude, longitude, rank
