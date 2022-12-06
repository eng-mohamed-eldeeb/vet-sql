select *
from animals
where name like '%mon';


select name 
from animals
where date_of_birth between '2016-1-1' and '2019-1-1';


select name 
from animals
where neutered = true and escape_attempts < 3;


select date_of_birth
from animals
where name in ('Agumon','Pikachu');


select name, escape_attempts
from animals
where weight_kg > 10.5;


select *
from animals
where neutered = true;


select *
from animals
where name <> 'Gabumon';


select *
from animals
where weight_kg between 10.5 and 17.3;


-- set the species
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species from animals;

--  update the species
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS null;
COMMIT;
SELECT name, species from animals;

-- delete the records
BEGIN;
DELETE FROM animals;
ROLLBACK;

SELECT * from animals;
--  Do the rest of aht is required
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_after_2022;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK to delete_after_2022;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- the answer of the queries questions

SELECT COUNT(*) AS "No. of animals" FROM animals;
SELECT COUNT(*) AS "No. of animals never scaped" FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS "Animals average weight" FROM animals;
SELECT name, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE  date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;