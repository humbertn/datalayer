\c app

CREATE TABLE Country (
    country_code CHAR(2) PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL
);

CREATE TABLE State (    
    state VARCHAR(255) PRIMARY KEY,
    country_code CHAR(2),    
    population INT,
    counties INT,
    detail TEXT,
    FOREIGN KEY (country_code) REFERENCES Country(country_code)
);

CREATE TABLE County (
    county_id SERIAL PRIMARY KEY,
    state VARCHAR(255),
    county VARCHAR(255) NOT NULL,
    population INT,
    FOREIGN KEY (state) REFERENCES State(state)
);

