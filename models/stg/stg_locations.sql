{{
    config(materialized='table')
}}
Select
    LOCATION_ID,
    STREET_ADDRESS,
    POSTAL_CODE,
    CITY,
    STATE_PROVINCE,
    COUNTRY_ID,
    current_timestamp as LOAD_TIME
from {{source('hr','locations')}}