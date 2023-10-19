# Description

This project has the initial information of the database using PostgreSQL running in a docker container.

# Database Name

```
app
```

# Database structure

```
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
```

# Run

To run this project it is required to have Docker installed.

First run the transformer to create the SQL files for each `state` on `/sql-files/*.sql`

```
docker compose -f docker-compose-transformer.yml up -d
```

Now you can start the database

```
docker compose -f docker-compose-database.yml up -d
```

# Specifications

This will start a container that is accesible in port `5432`.