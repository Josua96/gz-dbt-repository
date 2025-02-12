with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        cast(ship_cost as FLOAT64) as ship_cost

    from source

)

select * from renamed
