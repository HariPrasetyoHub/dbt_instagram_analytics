with base as (
    select
        id,
        timestamp,

        unlike,
        uncomment,
        unsave,
        unshare,

        -- total diff per snapshot
        unlike + uncomment + unsave + unshare 
        as unengagement

    from {{ref('intermediate_unengagement')}}
),

agg as (
    select
        id,

        min(timestamp) as created_time,

        cast(abs(sum(unengagement)) as int) as unengagement

    from base
    group by id
)

select
    a.id,
    h.user_id,
    strftime(a.created_time, '%Y-%m-%dT%H:%M:%S.%f')|| '+07:00' as created_time,
    h.media_type,
    h.media_product_type,
    a.unengagement
from agg a
left join {{ ref('staging_media_history') }} h
    on a.id = h.id
order by a.unengagement desc