-- Создание базы данных
CREATE DATABASE spring_security;
USE spring_security;

CREATE TABLE role
(
    id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(255) NOT NULL
);

-- Создание таблицы users
CREATE TABLE users
(
    userId   BIGINT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(15)      NOT NULL CHECK (name REGEXP '^[A-Za-zа-яёА-ЯЁ]{2,15}$'),
    surname  VARCHAR(15)      NOT NULL CHECK (surname REGEXP '^[A-Za-zа-яёА-ЯЁ]{2,15}$'),
    age      TINYINT UNSIGNED NOT NULL CHECK (age BETWEEN 0 AND 127),
    email    VARCHAR(255)     NOT NULL CHECK (email REGEXP '^([A-z0-9_.-]+)@([A-z0-9_.-]+)\\.([A-z]{2,8})$'),
    username VARCHAR(15)      NOT NULL UNIQUE CHECK (username REGEXP '^[A-Za-z]{2,15}$'),
    password VARCHAR(255)     NOT NULL,
    CONSTRAINT chk_username_length CHECK (CHAR_LENGTH(username) BETWEEN 2 AND 15),
    CONSTRAINT chk_password_length CHECK (CHAR_LENGTH(password) >= 4)
);

-- Создание таблицы users_roles для связи "многие ко многим"
CREATE TABLE users_roles
(
    userId BIGINT NOT NULL,
    roleId BIGINT NOT NULL,
    PRIMARY KEY (userId, roleId),
    FOREIGN KEY (userId) REFERENCES users (userId) ON DELETE CASCADE,
    FOREIGN KEY (roleId) REFERENCES role (id) ON DELETE CASCADE
);
