CREATE TABLE animals (
    id INT PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10,2)
);
-- Add species to the table
ALTER TABLE animals
ADD species varchar(20)

-- --------- create species and owners table ----------
create table owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(20),
    age int,
    PRIMARY KEY(id)
)


create table species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(20),
    PRIMARY KEY(id)
)

-- --------- alter the animal table and set the forign keys ----------


alter table animals drop column species

ALTER TABLE animals
  ADD COLUMN species_id INT,
  ADD CONSTRAINT fk_species_id
    FOREIGN KEY (species_id)
    REFERENCES species(id)
    ON DELETE CASCADE;


ALTER TABLE animals
  ADD COLUMN owner_id INT,
  ADD CONSTRAINT fk_owner_id
    FOREIGN KEY (owner_id)
    REFERENCES owners(id)
    ON DELETE CASCADE;