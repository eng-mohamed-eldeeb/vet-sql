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
select * from animals;
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

-- ---------- answer the query with JOIN -----------

SELECT animals.name
FROM animals 
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals 
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

SELECT animals.name, owners.full_name
FROM animals 
RIGHT JOIN owners ON owners.id = animals.owner_id;

SELECT count(animals), species.name
FROM animals 
JOIN species ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name, species.name, owners.full_name
FROM animals 
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name, owners.full_name
FROM animals 
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals)
FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT(animals) DESC LIMIT 1;