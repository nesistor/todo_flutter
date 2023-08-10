
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
CREATE TABLE IF NOT EXISTS tasks (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  due_date TEXT,
  is_completed INTEGER DEFAULT 0
);

-- Teams table
CREATE TABLE IF NOT EXISTS teams (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);

-- Friends table
CREATE TABLE IF NOT EXISTS friends (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  friend_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (friend_id) REFERENCES users (id)
);
