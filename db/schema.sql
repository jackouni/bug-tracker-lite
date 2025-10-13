CREATE TABLE users(
  id serial PRIMARY KEY,
  username varchar(50) NOT NULL UNIQUE,
  hashed_password text NOT NULL
);

CREATE TABLE projects(
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name varchar(50) NOT NULL,
  description varchar(250),
  created_at timestamp NOT NULL DEFAULT NOW(),
  updated_at timestamp NOT NULL DEFAULT NOW(),
  deadline timestamp
);

CREATE TABLE bugs(
  id serial PRIMARY KEY,
  project_id integer NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  number integer NOT NULL,
  description varchar(50),
  name varchar(50) NOT NULL,
  created_at date NOT NULL DEFAULT NOW(),
  updated_at timestamp NOT NULL DEFAULT NOW(),
  deadline timestamp
);
