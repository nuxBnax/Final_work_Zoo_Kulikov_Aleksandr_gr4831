DROP DATABASE IF EXISTS human_friends;
CREATE DATABASE human_friends;
USE human_friends;

DROP TABLE IF EXISTS animals;
CREATE TABLE animals (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(25)
) COMMENT 'Родительский класс - Животные';
INSERT INTO `animals` (`id`, `type`) VALUES ('1', 'Домашние животные');
INSERT INTO `animals` (`id`, `type`) VALUES ('2', 'Вьючные животные');

DROP TABLE IF EXISTS home_animals;
CREATE TABLE home_animals (
    id SERIAL,
    animals_id BIGINT UNSIGNED NOT NULL,
    family VARCHAR(25),
    FOREIGN KEY (animals_id) REFERENCES animals(id)
) COMMENT 'Домашние животные';
INSERT INTO `home_animals` (`id`, `animals_id`, `family`) VALUES ('1', '1', 'Собаки');
INSERT INTO `home_animals` (`id`, `animals_id`, `family`) VALUES ('2', '1', 'Кошки');
INSERT INTO `home_animals` (`id`, `animals_id`, `family`) VALUES ('3', '1', 'Хомяки');

DROP TABLE IF EXISTS pack_animals;
CREATE TABLE pack_animals (
    id SERIAL,
    animals_id BIGINT UNSIGNED NOT NULL,
    family VARCHAR(25),
    FOREIGN KEY (animals_id) REFERENCES animals(id)
) COMMENT 'Вьючные животные';
INSERT INTO `pack_animals` (`id`, `animals_id`, `family`) VALUES ('1', '2', 'Лошади');
INSERT INTO `pack_animals` (`id`, `animals_id`, `family`) VALUES ('2', '2', 'Верблюды');
INSERT INTO `pack_animals` (`id`, `animals_id`, `family`) VALUES ('3', '2', 'Ослики');

DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs (
    id SERIAL,
    home_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(25),
    orders VARCHAR(25),
    birthdate DATE,
    FOREIGN KEY (home_animals_id) REFERENCES home_animals(id)
) COMMENT 'Собаки';
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('1', '1',  'Шарик', 'Сидеть', '2023-09-18');
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('2', '1',  'Бобик', 'Сидеть', '2015-09-18');
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('3', '1',  'Бобик', 'Сидеть', '2017-11-18');
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('4', '1',  'Шарик',  'Лежать', '2022-01-18');
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('5', '1',  'Тузик', 'Лежать', '2021-01-18');
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('6', '1',  'Белка', 'Плавать', '2018-02-18');
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('7', '1',  'Белка', 'Лежать', '2015-03-18');
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('8', '1',  'Туман', 'Лежать', '2022-02-18');
INSERT INTO `dogs` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('9', '1',  'Полкан', 'Сидеть', '2022-06-18');


DROP TABLE IF EXISTS cats;
CREATE TABLE cats (
    id SERIAL,
    home_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(25),
    orders VARCHAR(25),
    birthdate DATE,
    FOREIGN KEY (home_animals_id) REFERENCES home_animals(id)
) COMMENT 'Кошки';
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('1', '2',  'Мурка', 'Кис-кис', '2023-01-18');
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('2', '2',  'Кеша', 'Мяу', '2015-02-18');
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('3', '2',  'Васька', 'Спать', '2022-10-18');
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('4', '2',  'Рыжик', 'Кис-кис', '2021-02-18');
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('5', '2',  'Белка', 'Спать', '2021-03-18');
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('6', '2',  'Пушистик', 'Кис-кис', '2018-02-18');
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('7', '2',  'Пухлик', 'Спать', '2022-07-18');
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('8', '2',  'Мохнатик', 'Кис-кис', '2019-09-18');
INSERT INTO `cats` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('9', '2',  'Чарли', 'Спать', '2017-11-18');


DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters (
    id SERIAL,
    home_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(25),
    orders VARCHAR(25),
    birthdate DATE,
    FOREIGN KEY (home_animals_id) REFERENCES home_animals(id)
) COMMENT 'Хомяки';
INSERT INTO `hamsters` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('1', '3',  'Хома', 'Есть', '2023-01-18');
INSERT INTO `hamsters` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('2', '3',  'Кеша', 'Спать', '2015-02-18');
INSERT INTO `hamsters` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('4', '3',  'Рыжик', 'Есть', '2021-02-18');
INSERT INTO `hamsters` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('5', '3',  'Беляк', 'Спать', '2021-03-18');
INSERT INTO `hamsters` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('6', '3',  'Пушистик', 'Спать', '2018-02-18');
INSERT INTO `hamsters` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('7', '3',  'Пухлик', 'Спать', '2015-07-18');
INSERT INTO `hamsters` (`id`, `home_animals_id`, `name`, `orders`, `birthdate`) VALUES ('8', '3',  'Мохнатик', 'Есть', '2019-09-18');



DROP TABLE IF EXISTS horses;
CREATE TABLE horses (
    id SERIAL,
    pack_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(25),
    orders VARCHAR(25),
    birthdate DATE,
    FOREIGN KEY (pack_animals_id) REFERENCES pack_animals(id)
) COMMENT 'Лошади';
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('1', '1',  'Молния', 'Скакать', '2013-09-18');
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('2', '1',  'Ворон', 'Рысью', '2011-09-18');
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('3', '1',  'Рудольф', 'Кушать', '2022-11-18');
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('4', '1',  'Поджарый',  'Скакать', '2021-01-18');
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('5', '1',  'Снег', 'Кушать', '2011-01-18');
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('6', '1',  'Белка', 'Кушать', '2013-02-18');
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('7', '1',  'Вичер', 'Рысью', '2015-03-18');
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('8', '1',  'Туман', 'Скакать', '2019-02-18');
INSERT INTO `horses` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('9', '1',  'Скорый', 'Скакать', '2022-06-18');


DROP TABLE IF EXISTS camels;
CREATE TABLE camels (
    id SERIAL,
    pack_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(25),
    orders VARCHAR(25),
    birthdate DATE,
    FOREIGN KEY (pack_animals_id) REFERENCES pack_animals(id)
) COMMENT 'Верблюды';
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('1', '2',  'Калик', 'Скакать', '2011-09-18');
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('2', '2',  'Мустафир', 'Рысью', '2011-03-18');
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('3', '2',  'Арип', 'Кушать', '2002-03-18');
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('4', '2',  'Горбатик',  'Скакать', '2011-01-18');
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('5', '2',  'Снежок', 'Кушать', '2011-01-18');
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('6', '2',  'Пунгар', 'Кушать', '2013-02-18');
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('7', '2',  'Вичер', 'Рысью', '2022-06-18');
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('8', '2',  'Рыжык', 'Скакать', '2022-02-18');
INSERT INTO `camels` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('9', '2',  'Ракета', 'Скакать', '2015-06-18');


DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys (
    id SERIAL,
    pack_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(25),
    orders VARCHAR(25),
    birthdate DATE,
    FOREIGN KEY (pack_animals_id) REFERENCES pack_animals(id)
) COMMENT 'Верблюды';
INSERT INTO `donkeys` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('1', '3',  'Эдди', 'Скакать', '2011-09-18');
INSERT INTO `donkeys` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('2', '3',  'Мерфи', 'Рысью', '2011-03-18');
INSERT INTO `donkeys` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('3', '3',  'Упрымый', 'Кушать', '2022-03-18');
INSERT INTO `donkeys` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('4', '3',  'Ушастик',  'Скакать', '2011-01-18');
INSERT INTO `donkeys` (`id`, `pack_animals_id`, `name`, `orders`, `birthdate`) VALUES ('5', '3',  'Снежок', 'Кушать', '2021-01-18');
