{{
	config(
		materialized='incremental',
		unique_key='event_id',
		on_schema_change='sync_all_columns',
		partition_by={
			"field": "created_at",
			"data_type": "tiemstamp",
			"granularity": "day"
		}

	)
}}

with source as (
      select * from {{ source('thelook_ecommerce', 'events') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("user_id") }},
        {{ adapter.quote("sequence_number") }},
        {{ adapter.quote("session_id") }},
        {{ adapter.quote("created_at") }},
        {{ adapter.quote("ip_address") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("state") }},
        {{ adapter.quote("postal_code") }},
        {{ adapter.quote("browser") }},
        {{ adapter.quote("traffic_source") }},
        {{ adapter.quote("uri") }},
        {{ adapter.quote("event_type") }}

    from source
)
select * from renamed

 {% if is_incremental() %}
   where created_at > (select max(created_at) from {{ this }})

 {% endif %}