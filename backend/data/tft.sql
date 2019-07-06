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
  range INT
);
