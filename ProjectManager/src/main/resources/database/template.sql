BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS users (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(15) NOT NULL,
        password_hash VARCHAR(255) NOT NULL,
	email VARCHAR(35),
	level INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS language (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(15) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS project (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(15) NOT NULL,
	description    VARCHAR(255),
	author_id INTEGER NOT NULL,
	created	INTEGER NOT NULL DEFAULT 'time()',
	FOREIGN KEY(author_id) REFERENCES users(id)
);
CREATE TABLE IF NOT EXISTS project_language (
	language_id INTEGER NOT NULL,
	project_id INTEGER NOT NULL,
	FOREIGN KEY(language_id) REFERENCES languages(id),
	FOREIGN KEY(project_id) REFERENCES project(id)
);
CREATE TABLE IF NOT EXISTS user_project (
	user_id	INTEGER NOT NULL,
	project_id INTEGER NOT NULL,
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(project_id) REFERENCES project(id)
);
COMMIT;