WITH location_complaint_counts AS (
    SELECT 
        ROUND(latitude, 4) AS latitude,
        ROUND(longitude, 4) AS longitude,
        complaint_type,
        COUNT(*) AS complaint_count,
        RANK() OVER (PARTITION BY ROUND(latitude, 4), ROUND(longitude, 4) ORDER BY COUNT(*) DESC, complaint_type ASC) AS rank -- Ensures uniqueness
    FROM {{ source('main', 'nyc_threeoneone_requests') }}
    WHERE year = 2024 
      AND latitude IS NOT NULL 
      AND longitude IS NOT NULL
      AND complaint_type IS NOT NULL
    GROUP BY ROUND(latitude, 4), ROUND(longitude, 4), complaint_type
),
top_locations AS (
    SELECT 
        latitude,
        longitude,
        SUM(complaint_count) AS total_complaints
    FROM location_complaint_counts
    GROUP BY latitude, longitude
    ORDER BY total_complaints DESC
    LIMIT 1000
)
SELECT 
    tl.latitude,
    tl.longitude,
    tl.total_complaints,
    lcc.complaint_type AS top_complaint
FROM top_locations tl
JOIN location_complaint_counts lcc 
    ON tl.latitude = lcc.latitude 
    AND tl.longitude = lcc.longitude
WHERE lcc.rank = 1 -- Ensures only the top complaint per location is selected
ORDER BY tl.total_complaints DESC
