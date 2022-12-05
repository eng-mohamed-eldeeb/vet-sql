select *
from animals
where name like '%mon';
select *
from animals
where date_of_birth between '2016-1-1' and '2019-1-1';
select *
from animals
where neutered = true and escape_attempts < 3;
select date_of_birth
from animals
where name in ('Agumon','Pikachu');
select date_of_birth, escape_attempts
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