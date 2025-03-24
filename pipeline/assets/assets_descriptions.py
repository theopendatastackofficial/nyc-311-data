descriptions_nyc_threeoneone_requests = {
    "unique_key": "Unique identifier of a Service Request (SR) in the open data set.",
    "created_date": "Date SR was created.",
    "closed_date": "Date SR was closed by responding agency.",
    "agency": "Acronym of responding City Government Agency.",
    "agency_name": "Full Agency name of responding City Government Agency.",
    "complaint_type": "This is the first level of a hierarchy identifying the topic of the incident or condition. Complaint Type may have a corresponding Descriptor or may stand alone.",
    "descriptor": "This is associated to the Complaint Type and provides further detail on the incident or condition.",
    "location_type": "Describes the type of location used in the address information.",
    "incident_zip": "Incident location zip code, provided by geo validation.",
    "incident_address": "House number of incident address provided by submitter.",
    "street_name": "Street name of incident address provided by the submitter.",
    "cross_street_1": "First Cross street based on the geo validated incident location.",
    "cross_street_2": "Second Cross Street based on the geo validated incident location.",
    "intersection_street_1": "First intersecting street based on geo validated incident location.",
    "intersection_street_2": "Second intersecting street based on geo validated incident location.",
    "address_type": "Type of incident location information available.",
    "city": "City of the incident location provided by geovalidation.",
    "landmark": "If the incident location is identified as a Landmark, the name of the landmark will display here.",
    "facility_type": "If available, this field describes the type of city facility associated to the SR.",
    "status": "Status of SR submitted.",
    "due_date": "Date when responding agency is expected to update the SR based on Complaint Type and internal SLAs.",
    "resolution_description": "Describes the last action taken on the SR by the responding agency. May describe next or future steps.",
    "resolution_action_updated_date": "Date when responding agency last updated the SR.",
    "community_board": "Provided by geovalidation.",
    "bbl": "Borough Block and Lot, provided by geovalidation. Parcel number to identify the location of buildings and properties in NYC.",
    "borough": "Provided by the submitter and confirmed by geovalidation.",
    "x_coordinate_state_plane": "Geo validated, X coordinate of the incident location.",
    "y_coordinate_state_plane": "Geo validated, Y coordinate of the incident location.",
    "open_data_channel_type": "Indicates how the SR was submitted to 311 (e.g., Phone, Online, Mobile, Other, Unknown).",
    "park_facility_name": "If the incident location is a Parks Dept facility, the Name of the facility will appear here.",
    "park_borough": "The borough of incident if it is a Parks Dept facility.",
    "vehicle_type": "If the incident is a taxi, this field describes the type of TLC vehicle.",
    "taxi_company_borough": "If the incident is identified as a taxi, this field will display the borough of the taxi company.",
    "taxi_pick_up_location": "If the incident is identified as a taxi, this field displays the taxi pick-up location.",
    "bridge_highway_name": "If the incident is identified as a Bridge/Highway, the name will be displayed here.",
    "bridge_highway_direction": "If the incident is identified as a Bridge/Highway, the direction where the issue took place would be displayed here.",
    "road_ramp": "If the incident location was Bridge/Highway, this column differentiates if the issue was on the Road or the Ramp.",
    "bridge_highway_segment": "Additional information on the section of the Bridge/Highway where the incident took place.",
    "latitude": "Geo-based latitude of the incident location.",
    "longitude": "Geo-based longitude of the incident location.",
    "location": "Combination of the geo-based latitude & longitude of the incident location.",
    "is_excel_date_error": "Marker: 1 if closed_date equals '1900-01-01' (Excel error date), 0 otherwise.",
    "resolution_time_hours": "Resolution time in hours, calculated as (closed_date - created_date) if both dates exist; otherwise null.",
    "is_invalid_resolution_time": "Marker: 1 if closed_date exists and is earlier than created_date, 0 otherwise.",
    "cd_number": "Community district number extracted from community_board, with borough-specific offsets (e.g., Manhattan: 100+, Bronx: 200+).",
    "is_invalid_cd_number": "Marker: 1 if cd_number is null (invalid community_board), 0 otherwise."
}


# Automatically generate table_descriptions
table_descriptions = {
    var_name.replace('descriptions_', ''): var_value
    for var_name, var_value in globals().items()
    if var_name.startswith('descriptions_')
}
