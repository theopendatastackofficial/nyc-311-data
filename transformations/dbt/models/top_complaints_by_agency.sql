WITH complaint_counts AS (
    SELECT 
        agency_name,
        complaint_type,
        COUNT(*) AS complaint_count,
        RANK() OVER (PARTITION BY agency_name ORDER BY COUNT(*) DESC) AS rank
    FROM {{ source('main', 'nyc_threeoneone_requests') }}
    WHERE year = 2024 -- Hive partitioning for efficiency
      AND agency_name IS NOT NULL
      AND complaint_type IS NOT NULL
    GROUP BY agency_name, complaint_type
)
SELECT 
    agency_name,
    complaint_type,
    complaint_count,
    rank
FROM complaint_counts
WHERE rank <= 5
ORDER BY agency_name, rank
