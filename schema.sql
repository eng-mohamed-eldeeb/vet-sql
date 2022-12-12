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


CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (
	species_id INT,
	vet_id INT,
  PRIMARY KEY (species_id, vet_id),
  -- CONSTRAINT fk_species 
    FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE,
  -- CONSTRAINT fk_vets
	  FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE
);

CREATE TABLE visits (
  id INT GENERATED ALWAYS AS IDENTITY,
	animal_id INT,
	vet_id INT,
  visit_date DATE,
  PRIMARY KEY (id),
	CONSTRAINT fk_animals 
    FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_vets_visits
	  FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

--Update visits table to add id column
ALTER TABLE visits ADD COLUMN id INT GENERATED ALWAYS AS IDENTITY;

-- Add Non-clustered index for tables
CREATE INDEX animal_id_index ON visits (animal_id);
CREATE INDEX vet_id_id_index ON visits (vet_id);
CREATE INDEX email_id_index ON owners (email);