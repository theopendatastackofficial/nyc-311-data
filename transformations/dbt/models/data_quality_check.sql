SELECT 
    COUNT(*) AS total_requests,
    SUM(is_excel_date_error) AS excel_date_errors,
    SUM(is_invalid_resolution_time) AS invalid_resolution_times,
    SUM(is_invalid_cd_number) AS invalid_cd_numbers
FROM {{ source('main', 'nyc_threeoneone_requests') }}
