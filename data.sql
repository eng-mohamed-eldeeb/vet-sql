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

-- -------- owners and species data

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

INSERT INTO vets (name, age, date_of_graduation) VALUES 
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08') 
;


INSERT INTO specializations (vet_id, species_id) VALUES 
  (1, 1),
  (3, 1),
  (3, 2),
  (4, 2)
;


INSERT INTO visits (animal_id, vet_id, visit_date) VALUES 
  (1, 1, '2020-05-24'),
  (1, 3, '2020-07-22'),
  (2, 4, '2021-02-02'),
  (4, 2, '2020-01-05'),
  (4, 2, '2020-03-08'),
  (4, 2, '2020-05-14'),
  (5, 3, '2021-05-04'),
  (6, 4, '2021-02-24'),
  (7, 2, '2019-12-21'),
  (7, 1, '2020-08-10'),
  (7, 2, '2021-04-07'),
  (8, 3, '2019-09-29'),
  (9, 4, '2020-10-03'),
  (9, 4, '2020-11-04'),
  (10, 2, '2019-01-24'),
  (10, 2, '2019-05-15'),
  (10, 2, '2020-02-27'),
  (10, 2, '2020-08-03'),
  (11, 3, '2020-05-24'),
  (11, 1, '2021-01-11')
;

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';