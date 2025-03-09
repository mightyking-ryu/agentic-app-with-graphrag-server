CREATE DATABASE IF NOT EXISTS agentic_app;

DROP USER IF EXISTS 'graphrag'@'%';
CREATE USER 'graphrag'@'%' IDENTIFIED BY 'nvidia';
GRANT ALL PRIVILEGES ON agentic_app.* TO 'graphrag'@'%';
FLUSH PRIVILEGES;

USE agentic_app;

CREATE TABLE IF NOT EXISTS survey (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    result TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS question_queue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    question_id CHAR(36) NOT NULL,
    question TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS response_queue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    question_id CHAR(36) NOT NULL,
    response TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    question_id CHAR(36) NOT NULL,
    question TEXT NOT NULL,
    response TEXT NOT NULL
);