---
title: Test
---

## Base Map

```bbl
select 
* 
from top_100_bbls_by_complaints
```

<BaseMap height={700}>
    <PointMap 
        data={bbl} 
        lat={latitude} 
        long={longitude} 
        pointName={bbl} 
        name="my_point_map"
        height={500}
        colorPalette={['yellow','orange','red','darkred']}
    />
</BaseMap>


```bbl_details
select 
* 
from top_100_bbls_by_complaints
where bbl = '${inputs.my_point_map.bbl}'
```

<DataTable data={bbl_details}/>

