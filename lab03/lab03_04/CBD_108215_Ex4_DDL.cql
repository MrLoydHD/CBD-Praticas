CREATE KEYSPACE IF NOT EXISTS pokemon_world WITH replication = {
  'class': 'SimpleStrategy',
  'replication_factor': '1'
};

DROP TABLE IF EXISTS pokemon_world.pokemon;
CREATE TABLE IF NOT EXISTS pokemon_world.pokemon
(
    pokemon_id int,
    name       text,
    type       tuple<text, text>,          --some pokemons have 2 types, if not then the second type is null
    moves      map<text, tuple<int, int>>, --name of ability it can learn and its power
    stats      list<int>,                  -- list of stats (hp, attack, defense, special attack, special defense, speed)
    level      int,
    evolution  tuple<text, int>,           --name of evolution and the level it evolves
    generation int,
    Primary Key (generation, pokemon_id, type)
) WITH CLUSTERING ORDER BY (pokemon_id ASC);

-- SELECT * FROM pokemon_world.pokemon WHERE generation = x and pokemon_id = y LIMIT 10;

-- saber os pokemons que tem um determinado tipo e que nao evoluem
-- SELECT * FROM pokemon_world.pokemon
-- WHERE level = 40 AND evolution = (null, null) AND type != (null, null) ALLOW FILTERING;

DROP TABLE IF EXISTS pokemon_world.move;
CREATE TABLE IF NOT EXISTS pokemon_world.move
(
    move_id  int,
    name     text,
    power    int,
    accuracy int,
    type     text,
    Primary Key ((type), power, accuracy)
);

DROP TABLE IF EXISTS pokemon_world.pokemon_by_type;

CREATE TABLE IF NOT EXISTS pokemon_world.pokemon_by_type
(
    pokemon_id int,
    name       text,
    type       tuple<text, text>,          --some pokemons have 2 types, if not then the second type is null
    moves      MAP<text, tuple<int, int>>, --name of ability and its power
    stats      list<int>,                  -- list of stats
    level      int,
    evolution  tuple<text, int>,           --name of evolution and the level it evolves
    generation int,
    Primary Key ((type), pokemon_id)
) WITH CLUSTERING ORDER BY (pokemon_id ASC);

-- SELECT * FROM pokemon_world.pokemon_by_type WHERE generation = x AND type = (y, z);

DROP TABLE IF EXISTS pokemon_world.pokemon_by_ability;
CREATE TABLE IF NOT EXISTS pokemon_world.pokemon_by_ability
(
    ability text,
    efficacy int,
    generation int,
    pokemon_id int,
    name       text,
    type       tuple<text, text>,          --some pokemons have 2 types, if not then the second type is null
    level      int,
    evolution  tuple<text, int>,           --name of evolution and the level it evolves
    Primary Key ((ability), pokemon_id)
) WITH CLUSTERING ORDER BY (pokemon_id ASC);

DROP TABLE IF EXISTS pokemon_world.trainers;
CREATE TABLE IF NOT EXISTS pokemon_world.trainers (
    trainer_id int,
    name       text,
    age     int,
    badges  set<text>, -- set of badges that the trainer has
    pokemon_list list<int>, -- list of pokemon ids that the trainer has
    inventory map<text, int>, -- map of items and their quantity
    Primary Key (trainer_id)
);


DROP TABLE IF EXISTS pokemon_world.bagdes_by_trainer;
CREATE TABLE IF NOT EXISTS pokemon_world.bagdes_by_trainer (
    trainer_id int,
    name       text,
    age     int,
    badge text,
    pokemon_list list<int>, -- list of pokemon ids that the trainer has
    inventory map<text, int>, -- map of items and their quantity
    generation int,
    Primary Key ((trainer_id, generation), name)
) WITH CLUSTERING ORDER BY (name ASC);

-- SELECT trainer_id, count(*) FROM pokemon_world.bagdes_by_trainer WHERE generation = x GROUP BY trainer_id;

-- ultimos 10 treinarores que lutaram com o lider de ginasio x

DROP TABLE IF EXISTS pokemon_world.gyms;
CREATE TABLE IF NOT EXISTS pokemon_world.gyms (
    gym_id int,
    location text,
    leader_name text,
    type text,
    badge_name text,
    generation int,
    Primary Key (generation, gym_id, leader_name)
) WITH CLUSTERING ORDER BY (gym_id ASC);

-- todos as localizacoes e os seus lideres de ginasios que tem lideres do tipo x
-- criar um indice para o tipo do lider
-- CREATE INDEX IF NOT EXISTS ON pokemon_world.gyms (type);
-- SELECT location, leader_name FROM pokemon_world.gyms WHERE type = x;

-- da geracao x quais os lideres de ginasio que tem o tipo x
-- SELECT leader_name FROM pokemon_world.gyms WHERE generation = x AND type = y;

DROP TABLE IF EXISTS pokemon_world.gym_battles;
CREATE TABLE IF NOT EXISTS pokemon_world.gym_battles (
    battle_id int,
    gym_id int,
    trainer_id int,
    result text,
    generation int,
    battle_date timestamp,
    Primary Key ((gym_id, generation), battle_id)
) WITH CLUSTERING ORDER BY (battle_id DESC);

-- SELECT * FROM pokemon_world.gym_battles WHERE generation = x AND gym_id = y LIMIT 10;
