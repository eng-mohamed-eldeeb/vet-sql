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


-- create the owners table

CREATE TABLE owners (
id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INT,
  PRIMARY KEY(id)
);

-- create the species table

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

--  alter the animals table

ALTER TABLE animals DROP COLUMN species;

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