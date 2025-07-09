{{
    config(materialized='table')
}}
Select
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID,
    LOAD_TIME
from {{source('hr','departments')}}