WITH intervals AS (
  SELECT
    EXTRACT(YEAR FROM created_date) AS request_year,
    complaint_type,
    CASE
      WHEN resolution_time_hours < 24 THEN 'Under 24 Hours'
      WHEN resolution_time_hours < 72 THEN '24–72 Hours'
      WHEN resolution_time_hours < 168 THEN '72 Hours – 1 Week'
      WHEN resolution_time_hours < 336 THEN '1 Week – 2 Weeks'
      WHEN resolution_time_hours < 720 THEN '2 Weeks – 1 Month'
      WHEN resolution_time_hours < 1440 THEN '1 Month – 2 Months'
      WHEN resolution_time_hours < 4320 THEN '2 Months – 6 Months'
      ELSE 'More than 6 Months'
    END AS resolution_interval,
    CASE
      WHEN resolution_time_hours < 24 THEN 1
      WHEN resolution_time_hours < 72 THEN 2
      WHEN resolution_time_hours < 168 THEN 3
      WHEN resolution_time_hours < 336 THEN 4
      WHEN resolution_time_hours < 720 THEN 5
      WHEN resolution_time_hours < 1440 THEN 6
      WHEN resolution_time_hours < 4320 THEN 7
      ELSE 8
    END AS interval_order
  FROM {{ source('main', 'nyc_threeoneone_requests') }}
  WHERE is_excel_date_error = 0
    AND is_invalid_resolution_time = 0
)
SELECT
  request_year,
  complaint_type,
  resolution_interval,
  COUNT(*) AS request_count
FROM intervals
GROUP BY request_year, complaint_type, resolution_interval, interval_order
ORDER BY request_year, complaint_type, interval_order
