{# TODO: Freshness anomalies should not return if there's no timestamp column. #}
{% set recommended_tests = [
    ("elementary", "volume_anomalies"),
    ("elementary", "freshness_anomalies"),
] %}

with
    tables_criticality as (
        select
            id,
            lower(database_name) as database_name,
            lower(schema_name) as schema_name,
            lower(table_name) as table_name,
            resource_name,
            source_name,
            tags,
            owner,
            depends_on_count,
            dependant_on_count,
            exposure_count,
            table_type
        from {{ ref("tables_criticality") }}
    ),

    potentinal_recommended_tests as (
        select id, test_namespace, short_name
        from tables_criticality
        cross join
            (
                {% for recommended_test in recommended_tests %}
                    select
                        '{{ recommended_test[0] }}' as test_namespace,
                        '{{ recommended_test[1] }}' as short_name
                    {% if not loop.last %}
                        union all
                    {% endif %}
                {% endfor %}
            ) rt
    ),

    existing_recommended_tests as (
        select parent_model_unique_id, test_namespace, short_name
        from {{ ref("elementary", "dbt_tests") }}
    ),

    pending_recommended_tests as (
        select id, test_namespace, short_name
        from potentinal_recommended_tests
        where
            (id, test_namespace, short_name) not in (
                select parent_model_unique_id, test_namespace, short_name
                from existing_recommended_tests
            )
    ),

    timestamp_columns as (
        select database_name, schema_name, table_name, timestamp_column
        from {{ ref("table_timestamp_columns") }}
    ),

    pending_tests_with_table_info as (
        select
            resource_name,
            source_name,
            test_namespace,
            short_name as test_name,
            timestamp_column,
            tags,
            owner,
            depends_on_count,
            dependant_on_count,
            exposure_count,
            table_type
        from pending_recommended_tests
        join tables_criticality using (id)
        left join timestamp_columns using (database_name, schema_name, table_name)
    )

select *
from pending_tests_with_table_info
