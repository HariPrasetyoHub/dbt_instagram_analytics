select
    cast(id as bigint) as id,
    cast(user_id as bigint) as user_id,
    media_type,
    media_product_type,
    is_story,
    cast(
        replace(created_time, ' Z', ' Zulu')
        as timestamptz
    ) as created_time
FROM {{source('raw_data', 'media_history')}}