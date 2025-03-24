---
title: Top Complaint Type per Location
---

## Complaint Map

```complaints
select 
* 
from top_2024_complaint_locations
```


<PointMap 
    data={complaints} 
    lat=latitude 
    long=longitude 
    pointName=top_complaint
    value=total_complaints
    name=my_point_map
    tooltipType=hover
    tooltip={[
        {id: 'top_complaint', showColumnName: false, valueClass: 'text-xl font-semibold'}    
    ]}
    height=1000
/>

