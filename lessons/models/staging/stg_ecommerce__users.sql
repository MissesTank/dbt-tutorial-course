with source as (
      select * from {{ source('thelook_ecommerce', 'users') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("first_name") }},
        {{ adapter.quote("last_name") }},
        {{ adapter.quote("email") }},
        {{ adapter.quote("age") }},
        {{ adapter.quote("gender") }},
        {{ adapter.quote("state") }},
        {{ adapter.quote("street_address") }},
        {{ adapter.quote("postal_code") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("country") }},
        {{ adapter.quote("latitude") }},
        {{ adapter.quote("longitude") }},
        {{ adapter.quote("traffic_source") }},
        {{ adapter.quote("created_at") }}

    from source
)
select * from renamed
  