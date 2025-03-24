---
title: NYC 311 Data Analysys
---

Analyze how well each agency correctly forecasted their 2023 expenses

<Dropdown name=granularity>
    <DropdownOption valueLabel="Boro Analysis" value="1" />
    <DropdownOption valueLabel="Complaint Type" value="2" />
    <DropdownOption valueLabel="Other" value="3" />
</Dropdown>

{#if inputs.granularity.value == 1}

```sql boro_resolution_times
select * from boro_resolution_times 
```


<DataTable data={boro_resolution_times}/>

```unique
SELECT DISTINCT request_year
FROM boro_resolution_times
```

<Dropdown
    name=unique
    data={unique}
    value=request_year
    title="Select a year" 
    defaultValue=2024
/>

```sql boro_resolution_times_year
select * from boro_resolution_times 
where request_year = '${inputs.unique.value}'
```



<BarChart 
    data={boro_resolution_times_year}
    x=borough
    y=total_requests
    type=grouped
/>

<BarChart 
    data={boro_resolution_times_year}
    x=borough
    y=avg_resolution_time
    type=grouped
/>



{:else if inputs.granularity.value == 2}


```sql complaint_type_resolution_times
select * from complaint_type_resolution_times 
```


<DataTable data={complaint_type_resolution_times}/>






{:else }





{/if}