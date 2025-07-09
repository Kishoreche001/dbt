{{
    config(
        materialized = 'incremental',
        unique_key = 'employee_id',
        incremental_strategy = 'delete+insert',
        tags = ['fct'],
        schema = 'fct'
        )
}}

{% set x = "(select coalesce(max(load_time),'1900-01-01') from "~this~")" %}

select
    emp.employee_id,
    job.job_id,
    dep.department_id,
    loc.location_id,
    con.country_id,
    reg.region_id,
    salary_date,
    emp.salary,
    hra,
    allowances,
    pf,
    (emp.salary+hra+allowances+pf) as gross_salary,
    (emp.salary+hra+allowances) as net_salary,
    current_timestamp as load_time
from {{ref('stg_salary')}} as sal 
left join {{ref('dim_employees')}} as emp
on sal.employee_id = emp.employee_id 
left join {{ref('dim_departments')}} as dep
on emp.department_id = dep.department_id
left join {{ref("dim_locations")}} as loc
on dep.location_id = loc.location_id
left join {{ref('dim_countries')}} as con
on loc.country_id = con.country_id
left join {{ref('dim_regions')}} as reg
on con.region_id = reg.region_id
left join {{ref('dim_jobs')}} as job
on job.job_id = emp.job_id

{% if is_incremental() %}

where sal.load_time > {{x}}

or emp.load_time > {{x}}

or dep.load_time > {{x}}

or loc.load_time > {{x}}

or con.load_time > {{x}}

or reg.load_time > {{x}}

or job.load_time > {{x}}

{% endif %}