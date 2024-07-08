
{% snapshot snapshot__distribution_centers %}

{{
	config(
		target_schema='dbt_snapshots',
		unique_key='id',
		strategy='check',
		check_cols=['name', 'latitude', 'longitude']
	)
}}

SELECT
	id,
	name,
	latitude,
	longitude

FROM {{ ref('seed_distribution_centers') }}

{% endsnapshot %}
