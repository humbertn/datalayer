\c app

CREATE TABLE Country (
    country_code CHAR(2) PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL
);

CREATE TABLE State (
    state_id SERIAL PRIMARY KEY,
    country_code CHAR(2),
    state VARCHAR(255) NOT NULL,
    population INT,
    counties INT,
    detail TEXT,
    FOREIGN KEY (country_code) REFERENCES Country(country_code),
    UNIQUE (state_id)
);

CREATE TABLE County (
    county_id SERIAL PRIMARY KEY,
    state_id INT,
    county VARCHAR(255) NOT NULL,
    population INT,
    FOREIGN KEY (state_id) REFERENCES State(state_id)
);

