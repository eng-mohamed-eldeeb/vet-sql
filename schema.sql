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