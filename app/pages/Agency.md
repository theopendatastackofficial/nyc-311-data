---
title: 311 Analysis by Agency
---

## Agency

```sql agency_no_boro
SELECT 
    agency_name,
    year,
    SUM(total_complaints) AS total_complaints
FROM complaints_agency_boro
GROUP BY agency_name, year
ORDER BY year, total_complaints DESC
```

```unique_year
SELECT DISTINCT year
FROM complaints_agency_boro
```

<Dropdown
    name=unique
    data={unique_year}
    value=year
    title="Select a year" 
    defaultValue=2024
/>

```sql complaints_agency_boro_year
select * from ${agency_no_boro} 
where year = '${inputs.unique.value}'
AND total_complaints > 1000
```

<BarChart 
    data={complaints_agency_boro_year}
    x=agency_name
    y=total_complaints
    type=grouped
/>

```unique_agency
SELECT DISTINCT agency_name
FROM top_complaints_by_agency
```

<Dropdown
    name=unique_agency
    data={unique_agency}
    value=agency_name
    title="Select an agency" 
    defaultValue="New York City Police Department" 
/>


```sql complaints
select * from top_complaints_by_agency
where agency_name = '${inputs.unique_agency.value}'
```

<BarChart 
    data={complaints}
    x=complaint_type
    y=complaint_count
    type=grouped
/>