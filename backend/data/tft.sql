DROP DATABASE IF EXISTS tft;
CREATE DATABASE tft;

\c tft;

CREATE TABLE class(
  id SERIAL PRIMARY KEY,
  class VARCHAR
);

CREATE TABLE class_skills(
  id SERIAL PRIMARY KEY,
  class_id INT REFERENCES class(id),
  requirement INT,
  output VARCHAR
);

CREATE TABLE origin(
  id SERIAL PRIMARY KEY,
  origin VARCHAR,
  requirement INT,
  output VARCHAR
);

CREATE TABLE heroes (
  id SERIAL PRIMARY KEY,
  champion_name VARCHAR ,
  class_id INT references class(id) ,
  origin INT REFERENCES origin(id),
  health INT,
  armor INT,
  magic_resistance INT,
  physical_damage INT,
  attack_speed INT,
  range INT,
  tier INT,
  level INT,
  pool_count INT
);

INSERT INTO class(class) VALUES
('Assassin'),
('Blademaster'),
('Brawler'),
('Elementalist'),
('Guardian'),
('Gunslinger'),
('Knight'),
('Ranger'),
('Shapeshifter'),
('Sorcerer');

INSERT INTO class_skills(class_id, requirement, output) VALUES
(1,3,'Assassins leap to the farthest enemy at the start of combat and deal additional +150% critical strike damage'),
(1,6,'Assassins leap to the farthest enemy at the start of combat and deal additional +350% critical strike damage'),
(2,3,'Blademasters have a 35% chance to strike additional times each attack + One additional strike'),
(2,6,'Blademasters have a 35% chance to strike additional times each attack + Two additional strike'),
(3,2,'Brawlers receive bonus maximum health +300 Bonus health.'),
(3,4,'Brawlers receive bonus maximum health +700 Bonus health.'),
(4,3,'Elementalists gain double mana from attacks & At the start of combat, summon an Elemental.'),
(5,2,'At the start of combat, all Guardians and adjacent allies receive +30 armor.'),
(6,2,'After attacking, Gunslingers have a 50% chance to fire additional attacks + Attack another random enemy.'),
(6,4,'After attacking, Gunslingers have a 50% chance to fire additional attacks + Attack all enemies in range.'),
(7,2,'Knights block damage from basic attacks. + 20 damage blocked.'),
(7,4,'Knights block damage from basic attacks. + 40 damage blocked.'),
(7,6,'Knights block damage from basic attacks. + 80 damage blocked.'),
(8,2,'Rangers have a chance to double their attack speed for the next 3s +25% chance.'),
(8,4,'Rangers have a chance to double their attack speed for the next 3s +65% chance.'),
(9,3,'Shapeshifters gain +100% bonus max health when they transform '),
(10,3,'Sorcerers gain double mana from attacking and allies have increased +35% spell damage'),
(10,6,'Sorcerers gain double mana from attacking and allies have increased +100% spell damage');

INSERT INTO origin (origin,requirement,output) VALUES
('Demon',2,'Attacks from Demons have a 40% chance to burn all of an enemys mana and deal that much true damage'),
('Demon',4,'Attacks from Demons have a 60% chance to burn all of an enemys mana and deal that much true damage.'),
('Demon',6,'Attacks from Demons have a 80% chance to burn all of an enemys mana and deal that much true damage.'),
('Dragon',2,'Dragons are immune to Magic damage'),
('Exile',1,'If an Exile has no adjacent allies at the start of combat, they gain a shield equal to a 100% max health.'),
('Glacial',2,'On hit, Glacials have a 20% chance to stun for 2s.'),
('Glacial',4,'On hit, Glacials have a 30% chance to stun for 2s.'),
('Glacial',6,'On hit, Glacials have a 45% chance to stun for 2s.'),
('Imperial',2,'1 random Imperial deals Double Damage.'),
('Imperial',4,'All Imperials deal Double Damage.'),
('Noble',3,'Nobles grant +100 Armor and heal for 35 on hit to 1 random ally'),
('Noble',6,'Nobles grant +100 Armor and heal for 35 on hit to all allies'),
('Ninja',1,'1 Ninja only: Ninja gains +40% Attack Damage'),
('Ninja',4,'4 Ninjas: All Ninjas gain +60% Attack Damage'),
('Pirate',3,'Earn up to 4 additional gold after combat against another player.'),
('Phantom',2,'Curse a random enemy at the start of combat, setting their HP to 100.'),
('Robot',1,'Robots start combat at full mana'),
('Void',3,'Your teams basic attacks ignore 50% of the enemys Armor'),
('Wild',2,'Attacks generate stacks of Fury (up to 5). Each stack of Fury grants 7% Attack Speed - Wild allies only'),
('Wild',4,'Attacks generate stacks of Fury (up to 5). Each stack of Fury grants 7% Attack Speed - All allies'),
('Yordle',3,'Attacks against ally Yordles have a 25% chance to miss.'),
('Yordle',6,'Attacks against ally Yordles have a 60% chance to miss.');

-- INSERT INTO  heroes (champion_name, class_id, origin, health, armor, magic_resistance, physical_damage, attack_speed, range, tier, level, pool_count) VALUES
-- ('Aatrox',)
