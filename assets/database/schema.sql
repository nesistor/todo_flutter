
-- Users table
CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  bio TEXT,
  profilePic TEXT,
  createdAt TEXT,
  phoneNumber TEXT,
  uid TEXT NOT NULL
);


-- Tasks table
CREATE TABLE tasks (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  date TEXT NOT NULL
);

CREATE TABLE shared_with (
  id INTEGER PRIMARY KEY,
  task_id INTEGER NOT NULL,
  friend_name TEXT NOT NULL,
  FOREIGN KEY (task_id) REFERENCES tasks (id)
);
