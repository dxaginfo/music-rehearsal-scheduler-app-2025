CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password_hash TEXT,
    role VARCHAR(64),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    owner_id INTEGER REFERENCES users(id)
);

CREATE TABLE band_members (
    id SERIAL PRIMARY KEY,
    band_id INTEGER REFERENCES bands(id),
    user_id INTEGER REFERENCES users(id)
);

CREATE TABLE rehearsal_sessions (
    id SERIAL PRIMARY KEY,
    band_id INTEGER REFERENCES bands(id),
    room_id INTEGER,
    scheduled_start TIMESTAMP,
    scheduled_end TIMESTAMP,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    rehearsal_session_id INTEGER REFERENCES rehearsal_sessions(id),
    user_id INTEGER REFERENCES users(id),
    attended BOOLEAN
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255),
    capacity INTEGER
);