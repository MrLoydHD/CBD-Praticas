use pokemon_world;

-- indexes:
CREATE INDEX IF NOT EXISTS ON pokemon_world.pokemon (name);
CREATE INDEX IF NOT EXISTS ON pokemon_world.trainers (age);
CREATE INDEX IF NOT EXISTS ON pokemon_world.gyms (type);
CREATE INDEX IF NOT EXISTS ON pokemon_world.gym_battles (result);

-- 5 updates
    -- Adicionar um novo movimento ao Bulbasaur e evoluí-lo para Ivysaur
UPDATE pokemon_world.pokemon
SET moves = moves + {'Solar Beam': (120, 100)}, name = 'Ivysaur', evolution = ('Venusaur', 32)
WHERE generation = 1 AND pokemon_id = 1 AND type = ('Grass', 'Poison');

-- Adicionar um novo movimento ao Charmander e evoluí-lo para Charmeleon
UPDATE pokemon_world.pokemon
SET moves = moves + {'Flamethrower': (90, 100)}, name = 'Charmeleon', evolution = ('Charizard', 36)
WHERE generation = 1 AND pokemon_id = 4 AND type = ('Fire', null);

-- Adicionar um novo movimento ao Squirtle e evoluí-lo para Wartortle
UPDATE pokemon_world.pokemon
SET moves = moves + {'Water Pulse': (60, 100)}, name = 'Wartortle', evolution = ('Blastoise', 36)
WHERE generation = 1 AND pokemon_id = 7 AND type = ('Water', null);

UPDATE pokemon_world.move SET name = 'Stomp' WHERE type = 'Normal' AND power = 40 AND accuracy = 100;
UPDATE pokemon_world.pokemon_by_type SET level = 50 WHERE type = ('Grass', 'Poison') AND pokemon_id = 1;

-- 5 deletes
DELETE FROM pokemon_world.pokemon WHERE generation = 1 AND pokemon_id = 1 AND type = ('Grass', 'Poison');
DELETE FROM pokemon_world.move WHERE type = 'Normal' AND power = 40 AND accuracy = 100;
DELETE FROM pokemon_world.pokemon_by_type WHERE type = ('Grass', 'Poison') AND pokemon_id = 1;
DELETE FROM pokemon_world.pokemon_by_ability WHERE ability = 'Overgrow' AND pokemon_id = 1;
DELETE FROM pokemon_world.trainers WHERE trainer_id = 1;

-- 10 Select queries:

-- 1. Lista os 10 primeiros pokemons da primeira geração
SELECT * FROM pokemon_world.pokemon WHERE generation = 1 LIMIT 10;

-- 2. Todos as estatisticas do Aggron que possa aprender o movimento Headbutt da 3ª geração (stats: hp, attack, defense, special_attack, special_defense, speed)
--primeiro saber o id do aggron

SELECT * FROM pokemon_world.pokemon WHERE name = 'Aggron';
SELECT stats as Hp_Attack_Defense_SpAttack_SpDefense_Speed FROM pokemon_world.pokemon WHERE generation = 3 AND pokemon_id=306 AND moves contains key 'Headbutt' ALLOW FILTERING;
-- outra forma de fazer seria a partir da aplicação

-- 3. Todos os moves distintos do tipo normal por ordem decrescente de power e accuracy
SELECT * FROM pokemon_world.move WHERE type = 'Normal' ORDER BY power DESC, accuracy DESC;

-- 4. Todos os moves do tipo water ou fire com power 110, 120 ou 150 e accuracy maior ou igual a 80
SELECT * FROM pokemon_world.move WHERE type in ('Water', 'Fire') AND power in (110, 120, 150) AND accuracy >= 80;

-- 5. Quantidade de pokemon de cada tipo
SELECT type, count(*) FROM pokemon_world.pokemon_by_type group by type;

-- 6. Todos os pokemons do tipo eletrico por ordem descendente de Ids
SELECT * FROM pokemon_world.pokemon_by_type WHERE type = ('Electric', null) ORDER BY pokemon_id DESC;

-- 7. Os primeiros 8 pokemons que possam aprender o movimento Fire Blast ou Hyper Beam
SELECT * FROM pokemon_world.pokemon_by_ability WHERE ability IN ('Fire Blast', 'Hyper Beam') LIMIT 8;

-- 8. Idade do treinador mais velho, mais novo e media de idades
select max(age) as Treinador_mais_velho, min(age) as Treinador_mais_novo, avg(age) as media_idades from pokemon_world.trainers;

-- 9. Lista de ginásios eletricos e seus lideres
SELECT location, leader_name FROM pokemon_world.gyms WHERE type = 'Electric';

-- 10. Lutas ganhas pelo treinador contra o lider do ginásio (result = win)
SELECT * FROM pokemon_world.gym_battles WHERE gym_id = 1 AND generation=1 and result = 'win';














