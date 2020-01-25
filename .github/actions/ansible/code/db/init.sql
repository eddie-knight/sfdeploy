CREATE DATABASE starfinder_api;

USE starfinder_api;

--
-- Race Tables
--

CREATE TABLE races (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  avg_weight TINYTEXT,
  avg_height TINYTEXT,
  age_of_maturity MEDIUMINT,
  max_age TINYTEXT,
  description TEXT,
  hit_points TINYINT,
  type TINYTEXT,
  physical_description TEXT,
  homeworld TEXT,
  society_and_alignment TEXT,
  relations TEXT,
  adventurers TEXT,
  names TEXT,
  PRIMARY KEY (id)
);

--
-- Class-Progression Tables
--

CREATE TABLE envoy_progression (
  id INT AUTO_INCREMENT,
  level TINYINT,
  base_attack_bonus TINYINT,
  fort_save_bonus TINYINT,
  ref_save_bonus TINYINT,
  will_save_bonus TINYINT,
  class_features TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE mechanic_progression LIKE envoy_progression;
CREATE TABLE mystic_progression LIKE envoy_progression;

ALTER TABLE `mystic_progression`
  ADD COLUMN spells_per_day_lvl1 TINYINT,
  ADD COLUMN spells_per_day_lvl2 TINYINT,
  ADD COLUMN spells_per_day_lvl3 TINYINT,
  ADD COLUMN spells_per_day_lvl4 TINYINT,
  ADD COLUMN spells_per_day_lvl5 TINYINT,
  ADD COLUMN spells_per_day_lvl6 TINYINT;

CREATE TABLE operative_progression LIKE envoy_progression;
CREATE TABLE solarian_progression LIKE envoy_progression;
ALTER TABLE solarian_progression
  ADD COLUMN solar_armor TINYTEXT,
  ADD COLUMN solar_weapon TINYTEXT;
  
CREATE TABLE soldier_progression LIKE envoy_progression;
CREATE TABLE technomancer_progression LIKE mystic_progression;


--
-- Class-Data Tables
--

CREATE TABLE augmentations (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  level TINYINT,
  price MEDIUMINT,
  system TINYTEXT,
  model TINYTEXT,
  biotech BOOLEAN DEFAULT 0,
  PRIMARY KEY (id)
);

CREATE TABLE abilities (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  shorthand VARCHAR(4),
  description VARCHAR(1021),
  PRIMARY KEY (id)
);

CREATE TABLE class_proficiencies (
  id INT AUTO_INCREMENT,
  feat_id INT,
  class_id TINYINT,
  PRIMARY KEY (id)
);

CREATE TABLE class_features (
  id INT AUTO_INCREMENT,
  class_id TINYINT,
  name TINYTEXT,
  level TINYINT,
  description VARCHAR(3000),
  PRIMARY KEY (id)
);

CREATE TABLE class_special_skills (
  id INT AUTO_INCREMENT,
  feature_id TINYINT,
  parent_id INT,
  name TINYTEXT,
  level TINYINT,
  description VARCHAR(3000),
  PRIMARY KEY (id)
);

CREATE TABLE classes (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  description VARCHAR(1021),
  hit_points TINYINT,
  stamina_points TINYINT,
  key_ability_score TINYTEXT,
  key_ability_score_text VARCHAR(1021),
  skills_per_level TINYINT,
  PRIMARY KEY (id)
);

CREATE TABLE feats (
  id INT AUTO_INCREMENT,
  modifier_id INT,
  name TINYTEXT,
  tagline TINYTEXT,
  prerequisite_text TEXT,
  description TEXT,
  benefit TEXT,
  extra_text TEXT,
  combat_feat BOOLEAN,
  PRIMARY KEY (id)
);

CREATE TABLE modifiers (
  id INT AUTO_INCREMENT,
  name VARCHAR(63),
  description TEXT,
  effected_stat TINYTEXT,
  modification TINYINT,
  PRIMARY KEY (id)
);

CREATE TABLE skills (
  id INT AUTO_INCREMENT,
  name VARCHAR(63),
  description VARCHAR(2045),
  ability_id TINYINT,
  untrained BOOLEAN,
  ac_penalty BOOLEAN,
  envoy BOOLEAN,
  mechanic BOOLEAN,
  mystic BOOLEAN,
  operative BOOLEAN,
  solarian BOOLEAN,
  soldier BOOLEAN,
  technomancer BOOLEAN,
  PRIMARY KEY (id)
);

--
-- Magic Tables
--

CREATE TABLE spells (
  id INT AUTO_INCREMENT,
  name VARCHAR(63),
  description TEXT,
  long_description TEXT,
  casting_time TINYTEXT,
  area TINYTEXT,
  targets TINYTEXT,
  duration TINYTEXT,
  saving_throw TINYTEXT,
  mystic_level TINYINT,
  technomancer_level TINYINT,
  school_id TINYINT,
  range_id TINYINT,
  spell_resistance BOOLEAN,
  PRIMARY KEY (id)
);

CREATE TABLE spell_descriptors (
  id INT AUTO_INCREMENT,
  spell_id INT,
  descriptor_id TINYINT,
  PRIMARY KEY (id)
);

CREATE TABLE descriptors (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  description VARCHAR(1790),
  PRIMARY KEY (id)
);

CREATE TABLE magic_schools LIKE descriptors; 
CREATE TABLE effect_ranges LIKE descriptors; 
--
-- Armor Tables
--

CREATE TABLE armor (
  id INT AUTO_INCREMENT,
  type TINYINT,
  name TINYTEXT,
  description VARCHAR(2045),
  level TINYINT,
  price MEDIUMINT,
  eac_bonus TINYINT,
  kac_bonus TINYINT,
  max_dex_bonus TINYINT,
  ac_penalty TINYINT,
  speed_penalty TINYINT,
  upgrade_slots TINYINT,
  bulk VARCHAR(2),
  PRIMARY KEY (id)
);

CREATE TABLE armor_upgrades (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  level TINYINT,
  price MEDIUMINT,
  slots TINYINT,
  armor_type TINYTEXT,
  bulk VARCHAR(2),
  PRIMARY KEY (id)
);

--
-- Weapons
--

CREATE TABLE melee_weapons (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  level TINYINT,
  hands TINYINT,
  price MEDIUMINT,
  damage TINYTEXT,
  critical TINYTEXT,
  bulk VARCHAR(2),
  special TINYTEXT,
  category TINYINT,
  powered BOOLEAN,
  operative BOOLEAN,
  description TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE ammunition (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  level TINYINT,
  price MEDIUMINT,
  charges TINYINT,
  bulk VARCHAR(2),
  special TINYTEXT,
  PRIMARY KEY (id)
);

CREATE TABLE ranged_weapons (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  category TINYINT,
  level TINYINT,
  price MEDIUMINT,
  damage TINYTEXT,
  weapon_range TINYTEXT,
  critical TINYTEXT,
  capacity TINYTEXT,
  ammo_usage VARCHAR(23),
  bulk VARCHAR(2),
  description VARCHAR(2045),
  special TINYTEXT,
  PRIMARY KEY (id)
);

CREATE TABLE weapon_categories (
  id INT AUTO_INCREMENT,
  type TINYTEXT,
  hands TINYINT,
  category VARCHAR(23),
  PRIMARY KEY (id)
);

CREATE TABLE weapon_fusions (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  level TINYINT,
  description VARCHAR(2045),
  PRIMARY KEY (id)
);

CREATE TABLE tech_items (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  type VARCHAR(23),
  level TINYINT,
  price VARCHAR(23),
  hands TINYINT,
  capacity TINYINT,
  bulk VARCHAR(15),
  item_usage VARCHAR(15),
  PRIMARY KEY (id)
);

CREATE TABLE solarian_crystals (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  price VARCHAR(23),
  level TINYINT,
  damage TINYTEXT,
  description VARCHAR(255),
  critical TINYTEXT,
  PRIMARY KEY (id)
);

CREATE TABLE equipment (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  type TINYTEXT,
  price VARCHAR(23),
  level TINYINT,
  bulk VARCHAR(7),
  PRIMARY KEY (id)
);

CREATE TABLE personal_upgrades (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  price INT,
  level TINYINT,
  boost TINYINT,
  PRIMARY KEY (id)
);

--
-- Theme Data
--

CREATE TABLE themes (
  id INT AUTO_INCREMENT,
  name TINYTEXT,
  description TEXT,
  level_1 TEXT,
  level_6 TEXT,
  level_12 TEXT,
  level_18 TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE theme_modifiers (
  id INT AUTO_INCREMENT,
  theme_id INT,
  modifier_id INT,
  PRIMARY KEY (id)
)
