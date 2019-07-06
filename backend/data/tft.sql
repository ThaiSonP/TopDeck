DROP DATABASE IF EXISTS tft;
CREATE DATABASE tft;

\c tft;

CREATE TABLE class(
  id SERIAL PRIMARY KEY,
  class VARCHAR,
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
  pool_count INT,
);

INSERT INTO class(class, requirement, output) VALUES
('Assassin',3,'Assassins leap to the farthest enemy at the start of combat and deal additional +150% critical strike damage'),
('Assassin',6,'Assassins leap to the farthest enemy at the start of combat and deal additional +350% critical strike damage'),
('Blademaster',3,'Blademasters have a 35% chance to strike additional times each attack + One additional strike'),
('Blademaster',6,'Blademasters have a 35% chance to strike additional times each attack + Two additional strike'),
('Brawler',2,'Brawlers receive bonus maximum health +300 Bonus health.'),
('Brawler',4,'Brawlers receive bonus maximum health +700 Bonus health.'),
('Elementalist',3,'Elementalists gain double mana from attacks & At the start of combat, summon an Elemental.'),
('Guardian',2,'At the start of combat, all Guardians and adjacent allies receive +30 armor.'),
('Gunslinger',2,'After attacking, Gunslingers have a 50% chance to fire additional attacks + Attack another random enemy.'),
('Gunslinger',4,'After attacking, Gunslingers have a 50% chance to fire additional attacks + Attack all enemies in range.'),
('Knight',2,'Knights block damage from basic attacks. + 20 damage blocked.'),
('Knight',4,'Knights block damage from basic attacks. + 40 damage blocked.'),
('Knight',6,'Knights block damage from basic attacks. + 80 damage blocked.'),
('Ranger',2,'Rangers have a chance to double their attack speed for the next 3s +25% chance.'),
('Ranger',4,'Rangers have a chance to double their attack speed for the next 3s +65% chance.'),
('Shapeshifter',3,'Shapeshifters gain bonus maximum Health when they transform +100% bonus max health'),
('Sorcerer',3,'Sorcerers gain double mana from attacking and allies have increased spell damage +35% spell damage'),
('Sorcerer',6,'Sorcerers gain double mana from attacking and allies have increased spell damage +100% spell damage')
