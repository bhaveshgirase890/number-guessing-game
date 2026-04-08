--
-- PostgreSQL database dump
--

\connect postgres

DROP DATABASE IF EXISTS number_guess;

CREATE DATABASE number_guess WITH TEMPLATE = template0;

\connect number_guess

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(22) NOT NULL UNIQUE,
    games_played INT DEFAULT 0,
    best_game INT
);

SELECT pg_catalog.setval('users_user_id_seq', 1, false);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    guesses INT NOT NULL
);

SELECT pg_catalog.setval('games_game_id_seq', 1, false);
