WITH bbl_complaint_counts AS (
    SELECT 
        bbl,
        complaint_type,
        COUNT(*) AS complaint_count,
        cd_number,
        incident_address,
        street_name,
        borough,
        ROUND(AVG(latitude), 4) AS latitude,
        ROUND(AVG(longitude), 4) AS longitude,
        RANK() OVER (PARTITION BY bbl ORDER BY COUNT(*) DESC, complaint_type ASC) AS rank -- Ensures uniqueness
    FROM {{ source('main', 'nyc_threeoneone_requests') }}
    WHERE year = 2024 
      AND bbl IS NOT NULL
      AND complaint_type IS NOT NULL
    GROUP BY bbl, complaint_type, cd_number, incident_address, street_name, borough
),
top_bbls AS (
    SELECT 
        bbl,
        SUM(complaint_count) AS total_complaints
    FROM bbl_complaint_counts
    GROUP BY bbl
    ORDER BY total_complaints DESC
    LIMIT 100
)
SELECT 
    bc.bbl,
    tb.total_complaints,
    bc.complaint_type AS top_complaint,
    bc.cd_number,
    bc.incident_address,
    bc.street_name,
    bc.borough,
    bc.latitude,
    bc.longitude
FROM bbl_complaint_counts bc
JOIN top_bbls tb ON bc.bbl = tb.bbl
WHERE bc.rank = 1 -- Ensures only the #1 complaint type per BBL is selected
ORDER BY tb.total_complaints DESC
