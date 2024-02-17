use pokemon_world;

-- Inserção de pokemons na tabela pokemon

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (1, 'Bulbasaur', ('Grass', 'Poison'), {'Tackle': (40, 100), 'Growl': (0, 100)}, [45, 49, 49, 65, 65, 45], 5, ('Ivysaur', 16), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (4, 'Charmander', ('Fire', null), {'Scratch': (40, 100), 'Growl': (0, 100)}, [39, 52, 43, 60, 50, 65], 5, ('Charmeleon', 16), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (7, 'Squirtle', ('Water', null), {'Tackle': (40, 100), 'Tail Whip': (0, 100)}, [44, 48, 65, 50, 64, 43], 5, ('Wartortle', 16), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (25, 'Pikachu', ('Electric', null), {'Thunder Shock': (40, 100), 'Growl': (0, 100), 'Quick Attack': (40, 100), 'Electro Ball': (0, 100)}, [35, 55, 40, 50, 50, 90], 20, ('Raichu', null), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (133, 'Eevee', ('Normal', null), {'Tackle': (40, 100), 'Tail Whip': (0, 100), 'Bite': (60, 100), 'Quick Attack': (40, 100)}, [55, 55, 50, 45, 65, 55], 25, (null, null), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (150, 'Mewtwo', ('Psychic', null), {'Psycho Cut': (70, 100), 'Psychic': (90, 100), 'Aura Sphere': (80, 100), 'Recover': (0, 100)}, [106, 110, 90, 154, 90, 130], 70, (null, null), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (200, 'Gyarados', ('Water', 'Flying'), {'Hydro Pump': (110, 80), 'Hyper Beam': (150, 90)}, [95, 125, 79, 60, 100, 81], 40, (null, null), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (201, 'Aerodactyl', ('Rock', 'Flying'), {'Rock Slide': (75, 90), 'Hyper Beam': (150, 90)}, [80, 105, 65, 60, 75, 130], 40, (null, null), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (202, 'Lapras', ('Water', 'Ice'), {'Ice Beam': (90, 100), 'Hydro Pump': (110, 80)}, [130, 85, 80, 85, 95, 60], 40, (null, null), 1);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (300, 'Skitty', ('Normal', null), {'Tackle': (40, 100), 'Growl': (0, 100), 'Tail Whip': (0, 100), 'Double Slap': (15, 85)}, [50, 45, 45, 35, 35, 50], 15, ('Delcatty', null), 3);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (303, 'Mawile', ('Steel', 'Fairy'), {'Astonish': (30, 100), 'Bite': (60, 100), 'Sweet Scent': (0, 100), 'Vice Grip': (55, 100)}, [50, 85, 85, 55, 55, 50], 18, (null, null), 3);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (306, 'Aggron', ('Steel', 'Rock'), {'Tackle': (40, 100), 'Harden': (0, 100), 'Mud-Slap': (20, 100), 'Headbutt': (70, 100)}, [70, 110, 180, 60, 60, 50], 42, (null, null), 3);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (309, 'Electrike', ('Electric', null), {'Tackle': (40, 100), 'Thunder Wave': (0, 90), 'Leer': (0, 100), 'Howl': (0, 100)}, [40, 45, 40, 65, 40, 65], 20, ('Manectric', 26), 3);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (312, 'Minun', ('Electric', null), {'Growl': (0, 100), 'Thunder Wave': (0, 90), 'Quick Attack': (40, 100), 'Helping Hand': (0, 100)}, [60, 40, 50, 75, 85, 95], 30, (null, null), 3);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (152, 'Chikorita', ('Grass', null), {'Tackle': (40, 100), 'Growl': (0, 100)}, [45, 49, 65, 49, 65, 45], 5, ('Bayleef', 16), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (155, 'Cyndaquil', ('Fire', null), {'Tackle': (40, 100), 'Leer': (0, 100)}, [39, 52, 43, 60, 50, 65], 5, ('Quilava', 14), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (158, 'Totodile', ('Water', null), {'Scratch': (40, 100), 'Leer': (0, 100)}, [50, 65, 64, 44, 48, 43], 5, ('Croconaw', 18), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (161, 'Sentret', ('Normal', null), {'Scratch': (40, 100), 'Foresight': (0, 100)}, [35, 46, 34, 35, 45, 20], 5, ('Furret', 15), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (163, 'Hoothoot', ('Normal', 'Flying'), {'Tackle': (40, 100), 'Growl': (0, 100)}, [60, 30, 30, 36, 56, 50], 5, ('Noctowl', 20), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (165, 'Ledyba', ('Bug', 'Flying'), {'Tackle': (40, 100), 'Supersonic': (0, 55)}, [40, 20, 30, 40, 80, 55], 5, ('Ledian', 18), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (167, 'Spinarak', ('Bug', 'Poison'), {'Poison Sting': (15, 100), 'String Shot': (0, 95)}, [40, 60, 40, 40, 40, 30], 5, ('Ariados', 22), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (170, 'Chinchou', ('Water', 'Electric'), {'Bubble': (40, 100), 'Thunder Wave': (0, 90)}, [75, 38, 38, 56, 56, 67], 5, ('Lanturn', 27), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (172, 'Pichu', ('Electric', null), {'Thunder Shock': (40, 100), 'Charm': (0, 100)}, [20, 40, 15, 35, 35, 60], 5, ('Pikachu', null), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (173, 'Cleffa', ('Fairy', null), {'Pound': (40, 100), 'Charm': (0, 100)}, [50, 25, 28, 45, 55, 15], 5, ('Clefairy', null), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (174, 'Igglybuff', ('Normal', 'Fairy'), {'Sing': (0, 55), 'Charm': (0, 100)}, [90, 30, 15, 40, 20, 15], 5, ('Jigglypuff', null), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (175, 'Togepi', ('Fairy', null), {'Growl': (0, 100), 'Charm': (0, 100)}, [35, 20, 65, 40, 65, 20], 5, ('Togetic', null), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (176, 'Togetic', ('Fairy', 'Flying'), {'Magical Leaf': (60, 0), 'Charm': (0, 100)}, [55, 40, 85, 80, 105, 40], 5, ('Togekiss', null), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (177, 'Natu', ('Psychic', 'Flying'), {'Peck': (35, 100), 'Leer': (0, 100)}, [40, 50, 45, 70, 45, 70], 5, ('Xatu', 25), 2);

INSERT INTO pokemon_world.pokemon (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (178, 'Xatu', ('Psychic', 'Flying'), {'Air Slash': (75, 95), 'Confuse Ray': (0, 100)}, [65, 75, 70, 95, 70, 95], 5, (null, null), 2);

INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (1, 'Tackle', 40, 100, 'Normal');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (2, 'Growl', 0, 100, 'Normal');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (3, 'Scratch', 40, 100, 'Normal');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (4, 'Ember', 40, 100, 'Fire');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (5, 'Water Gun', 40, 100, 'Water');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (6, 'Vine Whip', 45, 100, 'Grass');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (7, 'Thunder Shock', 40, 100, 'Electric');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (8, 'Peck', 35, 100, 'Flying');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (9, 'Double Kick', 30, 100, 'Fighting');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (10, 'Confusion', 50, 100, 'Psychic');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (11, 'Quick Attack', 40, 100, 'Normal');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (12, 'Slam', 80, 75, 'Normal');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (13, 'Fire Blast', 110, 85, 'Fire');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (14, 'Hydro Pump', 110, 80, 'Water');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (15, 'Solar Beam', 120, 100, 'Grass');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (16, 'Thunder', 110, 70, 'Electric');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (17, 'Drill Peck', 80, 100, 'Flying');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (18, 'High Jump Kick', 130, 90, 'Fighting');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (19, 'Psycho Cut', 70, 100, 'Psychic');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (20, 'Giga Impact', 150, 90, 'Normal');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (21, 'Flare Blitz', 120, 100, 'Fire');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (22, 'Hydro Cannon', 150, 90, 'Water');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (23, 'Frenzy Plant', 150, 90, 'Grass');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (24, 'Bolt Strike', 130, 85, 'Electric');
INSERT INTO pokemon_world.move (move_id, name, power, accuracy, type) VALUES (25, 'Brave Bird', 120, 100, 'Flying');

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (1, 'Bulbasaur', ('Grass', 'Poison'), {'Tackle': (40, 100), 'Growl': (0, 100)}, [45, 49, 49, 65, 65, 45], 5, ('Ivysaur', 16), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (4, 'Charmander', ('Fire', null), {'Scratch': (40, 100), 'Growl': (0, 100)}, [39, 52, 43, 60, 50, 65], 5, ('Charmeleon', 16), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (7, 'Squirtle', ('Water', null), {'Tackle': (40, 100), 'Tail Whip': (0, 100)}, [44, 48, 65, 50, 64, 43], 5, ('Wartortle', 16), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (25, 'Pikachu', ('Electric', null), {'Thunder Shock': (40, 100), 'Growl': (0, 100), 'Quick Attack': (40, 100), 'Electro Ball': (0, 100)}, [35, 55, 40, 50, 50, 90], 20, ('Raichu', null), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (133, 'Eevee', ('Normal', null), {'Tackle': (40, 100), 'Tail Whip': (0, 100), 'Bite': (60, 100), 'Quick Attack': (40, 100)}, [55, 55, 50, 45, 65, 55], 25, (null, null), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (150, 'Mewtwo', ('Psychic', null), {'Psycho Cut': (70, 100), 'Psychic': (90, 100), 'Aura Sphere': (80, 100), 'Recover': (0, 100)}, [106, 110, 90, 154, 90, 130], 70, (null, null), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (200, 'Gyarados', ('Water', 'Flying'), {'Hydro Pump': (110, 80), 'Hyper Beam': (150, 90)}, [95, 125, 79, 60, 100, 81], 40, (null, null), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (201, 'Aerodactyl', ('Rock', 'Flying'), {'Rock Slide': (75, 90), 'Hyper Beam': (150, 90)}, [80, 105, 65, 60, 75, 130], 40, (null, null), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (202, 'Lapras', ('Water', 'Ice'), {'Ice Beam': (90, 100), 'Hydro Pump': (110, 80)}, [130, 85, 80, 85, 95, 60], 40, (null, null), 1);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (300, 'Skitty', ('Normal', null), {'Tackle': (40, 100), 'Growl': (0, 100), 'Tail Whip': (0, 100), 'Double Slap': (15, 85)}, [50, 45, 45, 35, 35, 50], 15, ('Delcatty', null), 3);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (303, 'Mawile', ('Steel', 'Fairy'), {'Astonish': (30, 100), 'Bite': (60, 100), 'Sweet Scent': (0, 100), 'Vice Grip': (55, 100)}, [50, 85, 85, 55, 55, 50], 18, (null, null), 3);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (306, 'Aggron', ('Steel', 'Rock'), {'Tackle': (40, 100), 'Harden': (0, 100), 'Mud-Slap': (20, 100), 'Headbutt': (70, 100)}, [70, 110, 180, 60, 60, 50], 42, (null, null), 3);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (309, 'Electrike', ('Electric', null), {'Tackle': (40, 100), 'Thunder Wave': (0, 90), 'Leer': (0, 100), 'Howl': (0, 100)}, [40, 45, 40, 65, 40, 65], 20, ('Manectric', 26), 3);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (312, 'Minun', ('Electric', null), {'Growl': (0, 100), 'Thunder Wave': (0, 90), 'Quick Attack': (40, 100), 'Helping Hand': (0, 100)}, [60, 40, 50, 75, 85, 95], 30, (null, null), 3);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (152, 'Chikorita', ('Grass', null), {'Tackle': (40, 100), 'Growl': (0, 100)}, [45, 49, 65, 49, 65, 45], 5, ('Bayleef', 16), 2);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (155, 'Cyndaquil', ('Fire', null), {'Tackle': (40, 100), 'Leer': (0, 100)}, [39, 52, 43, 60, 50, 65], 5, ('Quilava', 14), 2);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (158, 'Totodile', ('Water', null), {'Scratch': (40, 100), 'Leer': (0, 100)}, [50, 65, 64, 44, 48, 43], 5, ('Croconaw', 18), 2);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (161, 'Sentret', ('Normal', null), {'Scratch': (40, 100), 'Foresight': (0, 100)}, [35, 46, 34, 35, 45, 20], 5, ('Furret', 15), 2);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (163, 'Hoothoot', ('Normal', 'Flying'), {'Tackle': (40, 100), 'Growl': (0, 100)}, [60, 30, 30, 36, 56, 50], 5, ('Noctowl', 20), 2);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (165, 'Ledyba', ('Bug', 'Flying'), {'Tackle': (40, 100), 'Supersonic': (0, 55)}, [40, 20, 30, 40, 80, 55], 5, ('Ledian', 18), 2);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (167, 'Spinarak', ('Bug', 'Poison'), {'Poison Sting': (15, 100), 'String Shot': (0, 95)}, [40, 60, 40, 40, 40, 30], 5, ('Ariados', 22), 2);

INSERT INTO pokemon_world.pokemon_by_type (pokemon_id, name, type, moves, stats, level, evolution, generation)
VALUES (170, 'Chinchou', ('Water', 'Electric'), {'Bubble': (40, 100), 'Thunder Wave': (0, 90)}, [75, 38, 38, 56, 56, 67], 5, ('Lanturn', 27), 2);


INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Fire Blast', 100, 1, 1, 'Bulbasaur', ('Grass', 'Poison'), 16, ('Ivysaur', 32));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Hyper Beam', 100, 1, 2, 'Ivysaur', ('Grass', 'Poison'), 32, ('Venusaur', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Fire Blast', 100, 1, 4, 'Charmander', ('Fire', null), 16, ('Charmeleon', 36));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Hyper Beam', 100, 1, 5, 'Charmeleon', ('Fire', null), 36, ('Charizard', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Fire Blast', 100, 1, 7, 'Squirtle', ('Water', null), 16, ('Wartortle', 36));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Hyper Beam', 100, 1, 8, 'Wartortle', ('Water', null), 36, ('Blastoise', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Fire Blast', 100, 1, 10, 'Caterpie', ('Bug', null), 7, ('Metapod', 10));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Hyper Beam', 100, 1, 11, 'Metapod', ('Bug', null), 10, ('Butterfree', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Fire Blast', 100, 1, 13, 'Weedle', ('Bug', 'Poison'), 7, ('Kakuna', 10));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Hyper Beam', 100, 1, 14, 'Kakuna', ('Bug', 'Poison'), 10, ('Beedrill', null));

-- 10 more inserts with different abilities
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Tackle', 100, 1, 16, 'Pidgey', ('Normal', 'Flying'), 18, ('Pidgeotto', 36));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Growl', 100, 1, 17, 'Pidgeotto', ('Normal', 'Flying'), 36, ('Pidgeot', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Scratch', 100, 1, 19, 'Rattata', ('Normal', null), 20, ('Raticate', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Bite', 100, 1, 21, 'Spearow', ('Normal', 'Flying'), 20, ('Fearow', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Tackle', 100, 1, 23, 'Ekans', ('Poison', null), 22, ('Arbok', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Growl', 100, 1, 25, 'Pikachu', ('Electric', null), 20, ('Raichu', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Scratch', 100, 1, 27, 'Sandshrew', ('Ground', null), 22, ('Sandslash', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Bite', 100, 1, 29, 'Nidoran♀', ('Poison', null), 16, ('Nidorina', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Tackle', 100, 1, 32, 'Nidoran♂', ('Poison', null), 16, ('Nidorino', null));
INSERT INTO pokemon_world.pokemon_by_ability (ability, efficacy, generation, pokemon_id, name, type, level, evolution) VALUES ('Growl', 100, 1, 35, 'Clefairy', ('Fairy', null), 20, ('Clefable', null));

INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (1, 'Ash', 10, {'Boulder', 'Cascade'}, [1, 4, 7], {'Poke Ball': 10, 'Potion': 5});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (21, 'Brock', 15, {'Boulder'}, [74, 95, 111], {'Poke Ball': 5, 'Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (22, 'Misty', 16, {'Cascade'}, [120, 121], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (23, 'Lt. Surge', 28, {'Thunder'}, [100, 101, 125], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (24, 'Erika', 16, {'Rainbow'}, [43, 44, 45], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (25, 'Koga', 29, {'Soul'}, [48, 49, 109, 110], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (26, 'Sabrina', 21, {'Marsh'}, [63, 64, 65], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (27, 'Blaine', 42, {'Volcano'}, [37, 38, 58, 59], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (28, 'Giovanni', 41, {'Earth'}, [50, 51, 53, 112, 113], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (29, 'Lorelei', 26, {'Elite Four'}, [87, 91, 131, 144], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (30, 'Bruno', 30, {'Elite Four'}, [56, 57, 106, 107], {'Poke Ball': 5, 'Super Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (31, 'Lance', 25, {'Elite Four'}, [147, 148, 149], {'Poke Ball': 5, 'Hyper Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (32, 'Gary', 10, {'Boulder', 'Cascade', 'Thunder', 'Rainbow', 'Soul', 'Marsh', 'Volcano', 'Earth'}, [1, 4, 7, 25, 133, 150], {'Poke Ball': 10, 'Potion': 5, 'Revive': 2});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (33, 'May', 10, {'Stone', 'Knuckle', 'Dynamo', 'Heat', 'Balance', 'Feather', 'Mind', 'Rain'}, [252, 255, 258, 300, 303, 306], {'Poke Ball': 10, 'Potion': 5, 'Revive': 2});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (34, 'Dawn', 10, {'Coal', 'Forest', 'Relic', 'Cobble', 'Fen', 'Mine', 'Icicle', 'Beacon'}, [387, 390, 393, 441, 447, 449], {'Poke Ball': 10, 'Potion': 5, 'Revive': 2});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (35, 'Iris', 10, {'Trio', 'Basic', 'Insect', 'Bolt', 'Quake', 'Jet', 'Freeze', 'Legend'}, [495, 498, 501, 504, 506, 509], {'Poke Ball': 10, 'Potion': 5, 'Revive': 2});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (36, 'Cilan', 15, {'Trio'}, [495, 511], {'Poke Ball': 5, 'Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (37, 'Chili', 15, {'Trio'}, [498, 513], {'Poke Ball': 5, 'Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (38, 'Cress', 15, {'Trio'}, [501, 515], {'Poke Ball': 5, 'Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (39, 'Lenora', 35, {'Basic'}, [506, 507, 508], {'Poke Ball': 5, 'Potion': 3});
INSERT INTO pokemon_world.trainers (trainer_id, name, age, badges, pokemon_list, inventory) VALUES (40, 'Burgh', 20, {'Insect'}, [540, 541, 542], {'Poke Ball': 5, 'Potion': 3});


INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (1, 'Pewter City', 'Brock', 'Rock', 'Boulder Badge', 1);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (2, 'Cerulean City', 'Misty', 'Water', 'Cascade Badge', 1);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (3, 'Vermilion City', 'Lt. Surge', 'Electric', 'Thunder Badge', 1);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (4, 'Celadon City', 'Erika', 'Grass', 'Rainbow Badge', 1);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (5, 'Fuchsia City', 'Koga', 'Poison', 'Soul Badge', 1);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (6, 'Saffron City', 'Sabrina', 'Psychic', 'Marsh Badge', 1);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (7, 'Cinnabar Island', 'Blaine', 'Fire', 'Volcano Badge', 1);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (8, 'Viridian City', 'Giovanni', 'Ground', 'Earth Badge', 1);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (9, 'Violet City', 'Falkner', 'Flying', 'Zephyr Badge', 2);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (10, 'Azalea Town', 'Bugsy', 'Bug', 'Hive Badge', 2);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (11, 'Goldenrod City', 'Whitney', 'Normal', 'Plain Badge', 2);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (12, 'Ecruteak City', 'Morty', 'Ghost', 'Fog Badge', 2);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (13, 'Cianwood City', 'Chuck', 'Fighting', 'Storm Badge', 2);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (14, 'Olivine City', 'Jasmine', 'Steel', 'Mineral Badge', 2);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (15, 'Mahogany Town', 'Pryce', 'Ice', 'Glacier Badge', 2);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (16, 'Blackthorn City', 'Clair', 'Dragon', 'Rising Badge', 2);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (17, 'Rustboro City', 'Roxanne', 'Rock', 'Stone Badge', 3);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (18, 'Dewford Town', 'Brawly', 'Fighting', 'Knuckle Badge', 3);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (19, 'Mauville City', 'Wattson', 'Electric', 'Dynamo Badge', 3);
INSERT INTO pokemon_world.gyms (gym_id, location, leader_name, type, badge_name, generation) VALUES (20, 'Lavaridge Town', 'Flannery', 'Fire', 'Heat Badge', 3);

INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (1, 1, 1, 'win', 1, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (2, 1, 1, 'loss', 1, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (3, 1, 2, 'win', 1, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (4, 1, 2, 'win', 1, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (5, 5, 3, 'loss', 1, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (6, 6, 3, 'win', 1, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (7, 7, 4, 'win', 1, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (8, 8, 4, 'loss', 1, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (9, 1, 5, 'win', 2, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (10, 2, 5, 'loss', 2, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (11, 3, 6, 'win', 2, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (12, 4, 6, 'win', 2, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (13, 5, 7, 'loss', 2, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (14, 6, 7, 'win', 2, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (15, 7, 8, 'win', 2, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (16, 8, 8, 'loss', 2, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (17, 1, 9, 'win', 3, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (18, 2, 9, 'loss', 3, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (19, 3, 10, 'win', 3, toTimestamp(now()));
INSERT INTO pokemon_world.gym_battles (battle_id, gym_id, trainer_id, result, generation, battle_date) VALUES (20, 4, 10, 'win', 3, toTimestamp(now()));