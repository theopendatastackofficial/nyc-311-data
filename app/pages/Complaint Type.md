---
title: Complaint Type
---

```sql complaint_type_resolution_times
select * from complaint_type_resolution_times 
```


<DataTable data={complaint_type_resolution_times}/>



```unique
SELECT DISTINCT request_year
FROM complaint_type_resolution_times
```

<Dropdown
    name=unique
    data={unique}
    value=request_year
    title="Select a year" 
    defaultValue=2024
/>

```sql complaint_type_resolution_times_year
select * from complaint_type_resolution_times 
where request_year = '${inputs.unique.value}'
order by request_count DESC
LIMIT 25
```


<BarChart 
    data={complaint_type_resolution_times_year}
    x=complaint_type
    y=request_count
    type=grouped
/>


```unique_complaint
SELECT DISTINCT complaint_type
FROM complaint_type_resolution_times
```
<Dropdown
    name=unique_complaint
    data={unique_complaint}
    value=complaint_type
    title="Select a Complaint Type" 
    defaultValue="HEATING"
/>

```sql complaint_type_resolution_times_complaint
select * from complaint_type_resolution_times
where complaint_type = '${inputs.unique_complaint.value}' AND
request_year = '${inputs.unique.value}' AND request_count > 10
order by request_count DESC
```

<BarChart 
    data={complaint_type_resolution_times_complaint}
    x=resolution_interval
    y=request_count
    type=grouped
/>

