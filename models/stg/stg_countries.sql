{{
    config(materialized='table')
}}
Select
    COUNTRY_ID,
    COUNTRY_NAME,
    REGION_ID,
    current_timestamp as LOAD_TIME
from {{source('hr','countries')}}