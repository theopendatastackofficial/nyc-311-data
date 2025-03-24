---
title: BBL
---

## BBL Map

```bbl
select 
* 
from top_100_bbls_by_complaints
```

<BaseMap height=700>
    <Points 
        data={bbl} 
        lat=latitude 
        long=longitude 
        pointName=bbl 
        name=my_point_map
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


<BigValue 
  data={bbl_details} 
  value=bbl
  title='BBL'
/>
<BigValue 
  data={bbl_details} 
  value=incident_address
  title='Address'
/>
<BigValue 
  data={bbl_details} 
  value=borough
  title='Borough'
/><br/>


<BigValue 
  data={bbl_details} 
  value=top_complaint
  title='Top Complaint'
/>
<BigValue 
  data={bbl_details} 
  value=total_complaints
  fmt=num0
  title='Total Complaints'
/>
<BigValue 
  data={bbl_details} 
  value=cd_number
  fmt=num0
  title='Community Board Number'
/><br/>