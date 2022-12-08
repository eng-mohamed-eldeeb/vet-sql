INSERT INTO animals VALUES (1, 'Agumon' ,'2020-2-5', 0, true,10.23);
INSERT INTO animals VALUES (2, 'Gabumon' ,'2018-11-15', 2, true,8);
INSERT INTO animals VALUES (4, 'Pikachu' ,'2021-1-7', 1, false,15.04);
INSERT INTO animals VALUES (5, 'Devimon' ,'2017-5-12', 5, true,11);

-- new data

INSERT INTO animals VALUES (6, 'Charmander', '2020-02-08', 0, '0', -11);
INSERT INTO animals VALUES (7, 'Plantmon', '2021-11-15', 3, '0', -5.7);
INSERT INTO animals VALUES (8, 'Squirtle', '1993-04-02', 1, '1', -12.13);
INSERT INTO animals VALUES (9, 'Angemon', '2005-06-12', 1, '1', -45.13);
INSERT INTO animals VALUES (10, 'Boarmon', '2005-06-07', 7, '1', 20.4);
INSERT INTO animals VALUES (11, 'Blossom', '1998-10-13', 3, '1', 17);
INSERT INTO animals VALUES (12, 'Ditto', '2022-05-14', 4, '1', 22);

INSERT INTO owners (full_name, age) VALUES 
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38)
;

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS null;


UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');