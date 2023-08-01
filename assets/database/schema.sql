PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS user_tasks (uuid TEXT PRIMARY KEY NOT NULL,
                                  		owned_by TEXT NOT NULL,
                                  		title TEXT,
                                        artist TEXT,
                                  		text TEXT,
                             	  		lyric_cover_id INTEGER,
                                  		created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                                        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                                        FOREIGN KEY (owned_by) REFERENCES users(uuid) ON DELETE CASCADE);