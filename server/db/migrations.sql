CREATE DATABASE overwatch;

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(255), 
					password_digest VARCHAR(255);

CREATE TABLE games (id SERIAL PRIMARY KEY, hero VARCHAR(255),
					 map VARCHAR(255), result VARCHAR(255), user_id INT references users(id));