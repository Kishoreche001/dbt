{{
    config(materialized='table')
}}
Select
    REGION_ID,
    REGION_NAME,
    LOAD_TIME
from {{source('hr','regions')}}