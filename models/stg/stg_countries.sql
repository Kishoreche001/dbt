{{
    config(materialized='table')
}}
Select
    COUNTRY_ID,
    COUNTRY_NAME,
    REGION_ID,
    LOAD_TIME
from {{source('hr','countries')}}