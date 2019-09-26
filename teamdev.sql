--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.1.22.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 09.26.2019 1:25:39 PM
-- Версия сервера: 5.5.25
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE teamdev;

--
-- Удалить таблицу `marks`
--
DROP TABLE IF EXISTS marks;

--
-- Удалить таблицу `presences`
--
DROP TABLE IF EXISTS presences;

--
-- Удалить таблицу `subjects`
--
DROP TABLE IF EXISTS subjects;

--
-- Удалить таблицу `pupils`
--
DROP TABLE IF EXISTS pupils;

--
-- Удалить таблицу `classes`
--
DROP TABLE IF EXISTS classes;

--
-- Установка базы данных по умолчанию
--
USE teamdev;

--
-- Создать таблицу `classes`
--
CREATE TABLE classes (
  ID int(11) NOT NULL AUTO_INCREMENT,
  Number int(2) NOT NULL,
  Letter varchar(1) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `pupils`
--
CREATE TABLE pupils (
  ID int(11) NOT NULL AUTO_INCREMENT,
  FIO varchar(255) NOT NULL,
  birthDate date NOT NULL,
  ClassID int(11) NOT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE pupils
ADD CONSTRAINT FK_pupil_ClassID FOREIGN KEY (ClassID)
REFERENCES classes (ID) ON DELETE NO ACTION;

--
-- Создать таблицу `subjects`
--
CREATE TABLE subjects (
  ID int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(50) NOT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `presences`
--
CREATE TABLE presences (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PupilID int(11) NOT NULL,
  SubjectID int(11) NOT NULL,
  Date datetime NOT NULL,
  Presence tinyint(1) NOT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE presences
ADD CONSTRAINT FK_presences_SubjectID FOREIGN KEY (SubjectID)
REFERENCES subjects (ID) ON DELETE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE presences
ADD CONSTRAINT FK_presences_PupilID FOREIGN KEY (PupilID)
REFERENCES pupils (ID) ON DELETE NO ACTION;

--
-- Создать таблицу `marks`
--
CREATE TABLE marks (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PupilID int(11) NOT NULL,
  SubjectID int(11) NOT NULL,
  Mark int(1) NOT NULL,
  Date datetime NOT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE marks
ADD CONSTRAINT FK_marks_SubjectID FOREIGN KEY (SubjectID)
REFERENCES subjects (ID) ON DELETE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE marks
ADD CONSTRAINT FK_marks_PupilID FOREIGN KEY (PupilID)
REFERENCES pupils (ID) ON DELETE NO ACTION;

-- 
-- Вывод данных для таблицы classes
--
-- Таблица teamdev.classes не содержит данных

-- 
-- Вывод данных для таблицы subjects
--
-- Таблица teamdev.subjects не содержит данных

-- 
-- Вывод данных для таблицы pupils
--
-- Таблица teamdev.pupils не содержит данных

-- 
-- Вывод данных для таблицы presences
--
-- Таблица teamdev.presences не содержит данных

-- 
-- Вывод данных для таблицы marks
--
-- Таблица teamdev.marks не содержит данных

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;