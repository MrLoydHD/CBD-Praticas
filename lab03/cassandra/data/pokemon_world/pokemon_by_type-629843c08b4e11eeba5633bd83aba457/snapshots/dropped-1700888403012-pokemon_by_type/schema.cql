CREATE TABLE IF NOT EXISTS pokemon_world.pokemon_by_type (
    generation int,
    type frozen<tuple<text, text>>,
    pokemon_id int,
    evolution frozen<tuple<text, int>>,
    level int,
    name text,
    moves map<text, frozen<tuple<int, int>>>,
    stats list<int>,
    PRIMARY KEY ((generation, type), pokemon_id)
) WITH ID = 629843c0-8b4e-11ee-ba56-33bd83aba457
    AND CLUSTERING ORDER BY (pokemon_id ASC)
    AND additional_write_policy = '99p'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND cdc = false
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '16', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND memtable = 'default'
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND extensions = {}
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99p';
