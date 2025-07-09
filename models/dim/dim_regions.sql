{{
    config(materialized='incremental',
    unique_key = 'REGION_ID',
    incremental_strategy = 'delete+insert',
    tags = ['dim'],
    schema = 'dim')
}}
Select
    REGION_ID,
    REGION_NAME,
    current_timestamp as LOAD_TIME
from {{ref('stg_regions')}}

{% if is_incremental()%}

{{incr()}}

{% endif %}