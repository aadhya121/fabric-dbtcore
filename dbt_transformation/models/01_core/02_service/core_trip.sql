

select distinct
            table_schema as "table_schema",
            table_name as "table_name",
            
            case table_type
                when 'BASE TABLE' then 'table'
                when 'EXTERNAL TABLE' then 'external'
                when 'MATERIALIZED VIEW' then 'materializedview'
                else lower(table_type)
            end as "table_type"

        from dwh_core.information_schema.tables
        where table_schema like 'dbo'
        and table_name like '%'
        and table_name not like ''