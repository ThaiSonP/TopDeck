DROP DATABASE IF EXISTS tft;
CREATE DATABASE tft;

\c tft;

CREATE TABLE class(
  id SERIAL PRIMARY KEY,
  class VARCHAR,
  blurb VARCHAR
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
  blurb VARCHAR
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
  origin_id INT REFERENCES origin(id),
  origin_id_2 INT REFERENCES origin(id),
  class_id INT references class(id) ,
  class_id_2 INT references class(id) ,
  tier INT,
  pool_count INT
);

CREATE TABLE heroes_stats (
  id SERIAL PRIMARY KEY,
  hero_id INT REFERENCES heroes(id) ,
  level INT,
  health INT,
  mana INT,
  DPS int,
  physical_damage INT,
  critical_chance INT,
  attack_speed INT,
  attack_range INT,
  magic_resistance INT,
  armor INT,
  special VARCHAR,
  special_damage INT,
  special_health int
);

Create Table primary_items(
  id SERIAL PRIMARY KEY,
  item VARCHAR,
  blurb VARCHAR
);

CREATE TABLE combined_items(
  id SERIAL PRIMARY KEY,
  item VARCHAR,
  item1 INT REFERENCES primary_items (id),
  item2 INT REFERENCES primary_items (id),
  blurb VARCHAR
)
;
-- data needs to be updated every week

INSERT INTO class(class, blurb) VALUES
('Assassin','Assassins leap to the farthest enemy at the start of combat & deal bonus Critical Strike Damage.'),
('Blademaster','Blademasters have a chance to strike additional times each attack.'),
('Brawler','Brawlers receive Bonus Maximum Health.'),
('Elementalist','Elementalists gain mana from attacks and summons unit at the start of combat.'),
('Guardian','At the start of combat, all Guardians and adjacent allies receive armor.'),
('Gunslinger','After attacking, Gunslingers have a chance to fire additional attacks.'),
('Knight','Knights block damage from basic attacks.'),
('Ranger','Rangers have a chance to double their attack speed when attacking for the next 3 seconds.'),
('Shapeshifter','Shapeshifters gain bonus maximum Health when they transform.'),
('Sorcerer','Sorcerers gain double mana from attacking. Allies have bonus spell damage.');

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

INSERT INTO origin (origin,blurb) VALUES
('Demon','Attacks from Demons have a chance on hit to burn all of an enemys mana & deal that much as true damage.'),
('Dragon','Dragons are immune to Magic damage.'),
('Exile','If an Exile has no adjacent allies at the start of combat, they gain a shield.'),
('Glacial','Attacks from Glacial have a chance to stun for 2 seconds.'),
('Imperial','Imperials deal double damage.'),
('Noble','Noble grants +100 Armor and 35 health per attack.'),
('Ninja','Ninjas gain a percentage of Attack Damage'),
('Pirate','Earn additional gold after combat against another player by a chest left behind at the end of the round.'),
('Phantom','Curse a random enemy at the start of combat.'),
('Robot','Robots start combat at full mana.'),
('Void','All basic attacks ignore enemys Armor.'),
('Wild','Attacks generate stacks of Fury (stacks up to 5 times) with every attack. Each stack of Fury gives 8% Attack Speed.'),
('Yordle','Attacks against ally Yordles have a chance to miss.');

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

INSERT INTO heroes(champion_name,origin_id,origin_id_2,class_id ,class_id_2 ,tier,pool_count) VALUES
('Aatrox',1,null,2,null,3,21)
-- ('Ahri',12,null,10,null,2,26),
-- ('Akali',7,null,1,null,4,13),
-- ('Anivia',4,null,4,null,5,10),
-- ('Ashe',4,null,8,null,3,21),
-- ('AurelionSol',2,null,10,null,4,13),
-- ('Blitzcrank',10,null,3,null,2,26),
-- ('Brand',1,null,4,null,4,13),
-- ('Braum',4,null,5,null,2,26),
-- ('ChoGath',11,null,3,null,4,13),
-- ('Darius',5,null,7,null,1,39),
-- ('Draven',5,null,2,null,4,13),
-- ('Elise',1,null,9,null,2,26),
-- ('Evelynn',1,null,1,null,3,21),
-- ('Fiora',6,null,2,null,1,39),
-- ('Gangplank',8,null,2,6,3,21),
-- ('Garen',6,null,7,null,1,39),
-- ('Gnar',12,13,9,null,4,13),
-- ('Graves',8,null,6,null,1,39),
-- ('Karthus',9,null,10,null,5,10),
-- ('Kassadin',11,null,10,null,1,39),
-- ('Katarina',5,null,1,null,3,21),
-- ('Kayle',6,null,7,null,5,10),
-- ('Kennen',7,13,4,null,3,21),
-- ('KhaZix',11,null,1,null,1,39),
-- ('Kindred',9,null,8,null,4,13),
-- ('Leona',6,null,5,null,4,13),
-- ('Lissandra',4,null,4,null,2,26),
-- ('Lucian',6,null,6,null,2,26),
-- ('Lulu',13,null,10,null,2,26),
-- ('MissFortune',8,null,6,null,5,10),
-- ('Mordekaiser',9,null,7,null,1,39),
-- ('Morgana',1,null,10,null,3,21),
-- ('Nidalee',12,null,9,null,1,39),
-- ('Poppy',13,null,7,null,3,21),
-- ('Pyke',8,null,1,null,2,26),
-- ('RekSai',11,null,3,null,2,26),
-- ('Rengar',12,null,1,null,3,21),
-- ('Sejuani',4,null,7,null,4,13),
-- ('Shen',7,null,2,null,2,26),
-- ('Shyvana',2,null,9,null,3,21),
-- ('Swain',5,1,9,null,5,10),
-- ('Tristana',13,null,6,null,1,39),
-- ('TwistedFate',8,null,10,null,2,26),
-- ('Varus',1,null,8,null,2,26),
-- ('Vayne',6,null,8,null,1,39),
-- ('Veigar',13,null,10,null,3,21),
-- ('Volibear',4,null,3,null,3,21),
-- ('Warrick',12,null,3,null,1,39),
-- ('Yasuo',3,null,2,null,5,10),
-- ('Zed',7,null,1,null,2,26)
;

INSERT INTO heroes_stats (hero_id,level,health,mana,DPS,physical_damage,critical_chance,attack_speed,attack_range,magic_resistance,armor,special,special_damage,special_health) VALUES
(1,1,650,100,42,65,25,65,1,20,25,'Aatrox cleaves the area in front of him, dealing damage to enemies inside it.',350,null),
(1,2,1170,100,76,117,25,65,1,20,25,'Aatrox cleaves the area in front of him, dealing damage to enemies inside it.',600,null),
(1,3,2340,100,152,234,25,65,1,20,25,'Aatrox cleaves the area in front of him, dealing damage to enemies inside it.',850,null)
-- ,(2,1,450,75,28,50,25,55,3,20,20,'Ahri fires an orb in a line that returns to her, damaging enemies it passes through.',100,null),
-- (2,2,810,75,50,90,25,55,3,20,20,'Ahri fires an orb in a line that returns to her, damaging enemies it passes through.',175,null),
-- (2,3,1620,75,99,180,25,55,3,20,20,'Ahri fires an orb in a line that returns to her, damaging enemies it passes through.',250,null),
-- (3,1,700,25,53,70,25,75,1,20,20,'Akali throws shurikens in front of her, dealing damage.',200,null),
-- (3,2,1260,25,95,126,25,75,1,20,20,'Akali throws shurikens in front of her, dealing damage.',375,null),
-- (3,3,2520,25,189,252,25,75,1,20,20,'Akali throws shurikens in front of her, dealing damage.',550,null),
-- (4,1,650,100,24,40,25,60,3,20,20,'Anivia channels a large hailstorm, damaging enemies inside of it. Storm Duration: 8 seconds ',700,null),
-- (4,2,1170,100,43,72,25,60,3,20,20,'Anivia channels a large hailstorm, damaging enemies inside of it. Storm Duration: 8 seconds ',950,null),
-- (4,3,2340,100,86,144,25,60,3,20,20,'Anivia channels a large hailstorm, damaging enemies inside of it. Storm Duration: 8 seconds ',1200,null),
-- (5,1,550,100,46,65,25,70,4,20,20,'Ashe fires an arrow that travels across the map. After a long delay it stuns and damages a random enemy.',200,null),
-- (5,2,990,100,82,117,25,70,4,20,20,'Ashe fires an arrow that travels across the map. After a long delay it stuns and damages a random enemy.',400,null),
-- (5,3,1980,100,164,234,25,70,4,20,20,'Ashe fires an arrow that travels across the map. After a long delay it stuns and damages a random enemy.',600,null),
-- (16,1,700,100,33,55,25,65,1,20,20,'Gangplank periodically creates barrels. On cast, Gangplank detonates the barrels, damaging nearby enemies. (applies on-hit effects)',200,null),
-- (16,2,1180,100,59,99,25,65,1,20,20,'Gangplank periodically creates barrels. On cast, Gangplank detonates the barrels, damaging nearby enemies. (applies on-hit effects)',325,null),
-- (16,3,2260,100,119,198,25,65,1,20,20,'Gangplank periodically creates barrels. On cast, Gangplank detonates the barrels, damaging nearby enemies. (applies on-hit effects)',450,null)
;

INSERT INTO primary_items(item,blurb) VALUES
('BFSword','+ 20 Attack Damage'),
('ChainVest','+ 20 Armor'),
('GiantsBelt','+ 200 Health'),
('NeedlesslyLargeRod','+ 20 Spell Power'),
('NegatronCloak','+ 20 Magic Resist'),
('RecurveBow','+ 20 Attack Speed'),
('Spatula','You Will Get Special Ability'),
('TearOfTheGoddess','+ 20 Starting Mana')
;

INSERT INTO combined_items (item,item1,item2,blurb) VALUES
('BladeOfTheRuinedKing',6 ,7,'Attack Speed +20. Wearer is also a Blademaster'),
('TheBloodthirster',1 ,5,'Attacks heal for 50% of physical damage'),
('CursedBlade',6 ,5,'Attacks on-hit have a low chance to reduce enemy''''s star level by 1 for the rest of combat'),
('Darkin',7 ,8,'Extra Starting mana +20. Wearer is also a Demon'),
('DragonsClaw',5 ,5,'Gain 83% resistance to magic damage'),
('ForceOfNature',7 ,7,'Gain +1 team size'),
('FrozenHeart',2 ,8,'Adjacent enemies lose 25% attack speed'),
('ForzenMallet',3 ,7,'Extra HP +200. Wearer is also a Glacial'),
('GuardianAngel',1 ,2,'Wearer revives with 800 HP'),
('GuinsoosRageblade',6 ,4,'Attack grant 5% Attack Speed. Stacks infinitely'),
('HextechGunblade',1 ,4,'Heal for 33% of all damage dealt'),
('Hush',5 ,8,'33% chance on hit to prevent the enemy champion from gaining mana for 4 seconds'),
('InfinityEdge',1 ,1,'Critical Strikes deal +200 % damage'),
('IonicSpark',4 ,5,'Whenever an enemy casts a spell, they take 125 damage'),
('KnightsVow',2 ,7,'Extra Armor +20. Wearer is also a Knight'),
('LocketOfTheIronSolari',2 ,4,'On start of combat, allies two spaces to the left and right gain a shield of 250 for 6 seconds.'),
('LudensEcho',4 ,8,'Spells deal 200 splash damage on hit'),
('Morellonomicon',3 ,4,'Spells deal burn damage equal to 20% of the enemy''''s maximum health over 10s and prevent healing'),
('PhantomDancer',6 ,2,'Wearer dodges all Critical Strikes'),
('RabadonsDeathcap',4 ,4,'Wearer''''s Spell Power stat is amplified by 50%'),
('RapidFirecannon',6 ,6,'Wearer''''s attacks cannot be dodged. Attack Range is doubled'),
('RedBuff',2 ,3,'Attacks deal 13% of the enemy''''s maximum Health as burn damage over 10s and prevent healing'),
('Redemption',3 ,8,'On crossing below 25% health, heal all nearby allies for 1500 Health'),
('RunaansHurricane',5 ,7,'Summon a spirit who mirrors your attacks, dealing 75% Damage'),
('SeraphsEmbrace',8 ,8,'Wearer regains 20 mana after spellcast'),
('SpearOfShojin',1 ,8,'After casting, wearer gains 15% of its max Mana per attack'),
('StatikkShiv',6 ,8,'Every 3rd attack deals 100 splash magical damage to 3 enemies.'),
('SwordBreaker',2 ,5,'Attacks have a chance to disarm for 4s'),
('SwordOfTheDivine',6 ,1,'Each second, the wearer has a 7% chance to gain 100% Critical Strike'),
('Thornmail',2 ,2,'Reflect 100% of damage mitigated from attacks'),
('TitanicHydra',6 ,3,'Attacks deal 10% of the wearer''''s max Health as splash damage'),
('WarmogsArmor',3 ,3,'Wearer regenerates 6% max Health per second.'),
('YoumuusGhostblade',1 ,7,'Extra Attack Damage +20. Wearer is also an Assassin'),
('Yuumi',4 ,7,'Extra Spell Power +20%. Wearer is also a Sorcerer'),
('ZekesHerald',1 ,3,'At the start of combat, allies within the same row gain +15% Attack Speed for the rest of combat'),
('Zephyr',3 ,5,'On start of combat, banish an enemy for 5 seconds');
