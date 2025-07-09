{{
    config(materialized='incremental',
    unique_key = 'JOB_ID',
    incremental_strategy = 'delete+insert',
    tags = ['dim'],
    schema = 'dim')
}}
Select
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY,
    MAX_SALARY,
    current_timestamp as LOAD_TIME
from {{ref('stg_jobs')}}

{% if is_incremental()%}

{{incr()}}

{% endif %}