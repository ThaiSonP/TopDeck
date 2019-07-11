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
  origin VARCHAR
);

CREATE TABLE origin_skills(
  id SERIAL PRIMARY KEY,
  origin_id INT REFERENCES origin(id),
  requirement INT,
  output VARCHAR
);

CREATE TABLE heroes (
  id SERIAL PRIMARY KEY,
  champion_name VARCHAR ,
  origin INT REFERENCES origin(id),
  class_id INT references class(id) ,
  class_id_2 INT references class(id) ,
  tier INT,
  pool_count INT
);

CREATE TABLE heroes_stats (
  id SERIAL PRIMARY KEY,
  hero_id INT REFERENCES heroes(id) ,
  cost INT,
  health INT,
  mana INT,
  DPS int,
  physical_damage INT,
  critical_chance INT,
  attack_speed INT,
  attack_range INT,
  magic_resistance INT,
  armor INT,
  level INT,
  special VARCHAR,
  special_damage INT
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

INSERT INTO origin (origin) VALUES
('Demon'),
('Dragon'),
('Exile'),
('Glacial'),
('Imperial'),
('Noble'),
('Ninja'),
('Pirate'),
('Phantom'),
('Robot'),
('Void'),
('Wild'),
('Yordle');

INSERT INTO origin_skills(origin_id, requirement, output) VALUES
(1,2,'Attacks from Demons have a 40% chance to burn all of an enemys mana and deal that much true damage'),
(1,4,'Attacks from Demons have a 60% chance to burn all of an enemys mana and deal that much true damage.'),
(1,6,'Attacks from Demons have a 80% chance to burn all of an enemys mana and deal that much true damage.'),
(2,2,'Dragons are immune to Magic damage'),
(3,1,'If an Exile has no adjacent allies at the start of combat, they gain a shield equal to a 100% max health.'),
(4,2,'On hit, Glacials have a 20% chance to stun for 2s.'),
(4,4,'On hit, Glacials have a 30% chance to stun for 2s.'),
(4,6,'On hit, Glacials have a 45% chance to stun for 2s.'),
(5,2,'1 random Imperial deals Double Damage.'),
(5,4,'All Imperials deal Double Damage.'),
(6,3,'Nobles grant +100 Armor and heal for 35 on hit to 1 random ally'),
(6,6,'Nobles grant +100 Armor and heal for 35 on hit to all allies'),
(7,1,'1 Ninja only: Ninja gains +40% Attack Damage'),
(7,4,'4 Ninjas: All Ninjas gain +60% Attack Damage'),
(8,3,'Earn up to 4 additional gold after combat against another player.'),
(9,2,'Curse a random enemy at the start of combat, setting their HP to 100.'),
(10,1,'Robots start combat at full mana'),
(11,3,'Your teams basic attacks ignore 50% of the enemys Armor'),
(12,2,'Attacks generate stacks of Fury (up to 5). Each stack of Fury grants 7% Attack Speed - Wild allies only'),
(12,4,'Attacks generate stacks of Fury (up to 5). Each stack of Fury grants 7% Attack Speed - All allies'),
(13,3,'Attacks against ally Yordles have a 25% chance to miss.'),
(13,6,'Attacks against ally Yordles have a 60% chance to miss.');

INSERT INTO heroes(champion_name,origin,class_id ,class_id_2 ,tier,pool_count) VALUES
('Aatrox',1,2,null,3,21),
('Ahri',12,10,null,2,26),
('Akali',7,1,null,4,13),
('Anivia',4,4,null,5,10),
('Ashe',4,8,null,3,21),
('Aurelion-Sol',2,10,null,4,13),
('Blitzcrank',10,3,null,2,26),
('Brand',1,4,null,4,13),;
