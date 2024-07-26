# Before start

## I'm using MySQL for this task, to check the code, I used VS Code with SQLTools extension,

## If you will be using VS Code and SQlTools to test the assignment, in the .vscode folder in the settings.json file, add your MySql server username and password to the username and password field to ensure that the database connection is established through the SQLTools extension.

## Data for testing

Also in the ddl folder, in addition to the [`movie_database.sql`] file with instructions for creating the database, I added the [`test_data.sql`] file along with the insert queries that add data to the database tables and help test database queries, using the test data from the [`test_data.sql`] file, all queries should return data.

# Movie Database ER Diagram

```mermaid
erDiagram
    FILE {
        INT id PK
        VARCHAR file_name
        VARCHAR mime_type
        VARCHAR key
        VARCHAR url
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    COUNTRIES {
        INT id PK
        VARCHAR name
    }

    USER {
        INT id PK
        VARCHAR username
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR email
        VARCHAR password
        INT avatar_id FK
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    USER ||--o{ FILE : "has avatar"

    PERSONS {
        INT id PK
        VARCHAR first_name
        VARCHAR last_name
        TEXT biography
        DATE birth_date
        ENUM gender
        INT country_id FK
        INT primary_photo_id FK
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    PERSONS }o--|| COUNTRIES : "belongs to"
    PERSONS }o--|| FILE : "has photo"

    MOVIE {
        INT id PK
        VARCHAR title
        TEXT description
        DECIMAL budget
        DATE release_date
        INT duration
        INT director_id FK
        INT country_id FK
        INT poster_id FK
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
    MOVIE }o--|| PERSONS : "directed by"
    MOVIE }o--|| COUNTRIES : "originates from"
    MOVIE }o--|| FILE : "has poster"

    GENRES {
        INT id PK
        VARCHAR name
    }

    MOVIE_GENRES {
        INT movie_id PK, FK
        INT genre_id PK, FK
    }
    MOVIE_GENRES }o--|| MOVIE : "associated with"
    MOVIE_GENRES }o--|| GENRES : "categorized as"

    CHARACTERS {
        INT id PK
        VARCHAR name
        TEXT description
        ENUM role
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    MOVIE_CHARACTERS {
        INT movie_id PK, FK
        INT character_id PK,FK
        INT person_id FK
    }
    MOVIE_CHARACTERS }o--|| MOVIE : "features"
    MOVIE_CHARACTERS }o--|| CHARACTERS : "portrays"
    MOVIE_CHARACTERS }o--|| PERSONS : "played by"

    FAVORITE_MOVIE {
        INT user_id PK, FK
        INT movie_id PK, FK
    }
    FAVORITE_MOVIE }o--|| USER : "favorited by"
    FAVORITE_MOVIE }o--|| MOVIE : "includes"
```
