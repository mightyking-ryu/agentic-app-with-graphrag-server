CREATE DATABASE IF NOT EXISTS agentic_app;

DROP USER IF EXISTS 'graphrag'@'%';
CREATE USER 'graphrag'@'%' IDENTIFIED WITH mysql_native_password BY 'nvidia';
GRANT ALL PRIVILEGES ON agentic_app.* TO 'graphrag'@'%';
FLUSH PRIVILEGES;

USE agentic_app;

CREATE TABLE IF NOT EXISTS survey (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id BINARY(16) NOT NULL,
    result JSON NOT NULL
);

CREATE TABLE IF NOT EXISTS question_queue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id BINARY(16) NOT NULL,
    question_id BINARY(16) NOT NULL,
    question TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS response_queue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id BINARY(16) NOT NULL,
    question_id BINARY(16) NOT NULL,
    response TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id BINARY(16) NOT NULL,
    question_id BINARY(16) NOT NULL,
    question TEXT NOT NULL,
    response TEXT NOT NULL
);