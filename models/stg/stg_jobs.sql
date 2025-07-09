{{
    config(materialized='table')
}}
Select
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY,
    MAX_SALARY,
    current_timestamp as LOAD_TIME
from {{source('hr','jobs')}}