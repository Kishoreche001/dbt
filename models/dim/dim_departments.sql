{{
    config(materialized='incremental',
    unique_key = 'DEPARTMENT_ID',
    incremental_strategy = 'delete+insert',
    tags = ['dim'],
    schema = 'dim')
}}
Select
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID,
     current_timestamp as LOAD_TIME
from {{ ref('stg_departments')}}

{% if is_incremental() %}

{{ incr() }}

{% endif %}