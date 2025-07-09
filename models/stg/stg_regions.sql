{{
    config(materialized='table')
}}
Select
    REGION_ID,
    REGION_NAME,
    current_timestamp as LOAD_TIME
from {{source('hr','regions')}}