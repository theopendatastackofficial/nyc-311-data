---
title: Data Quality
---

Analyze some key info on the data quality of the 311 dataset

- Excel errors indicate the closed_date showed the Excel time error of 1900
- Invalid resolution times indicate when the closed_date was earlier than the created_date
- Invalid cd number indicates the community_board value did not conform to the correct format

```data_quality
select 
* 
from data_quality_check
```

<BigValue 
  data={data_quality} 
  value=excel_date_errors
  fmt=num0
  title='Excel Date Errors'
/>
<BigValue 
  data={data_quality} 
  value=invalid_resolution_times
  fmt=num0
  title='Invalid Resolution Times'
/>
<BigValue 
  data={data_quality} 
  value=invalid_cd_numbers
  fmt=num0
  title='Invalid Cd Numbers'
/>