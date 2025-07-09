{% macro incr() %}

where LOAD_TIME >(Select coalesce(max(LOAD_TIME), '1900-01-01') from {{this}})

{% endmacro %}  