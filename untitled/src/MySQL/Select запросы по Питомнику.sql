USE human_friends;


-- Удалим содержимое таблицы Верблюды
DELETE FROM camels;

SELECT * from camels;

-- Объеденим таблицы Лошади и Ослики
SELECT id, (select family from pack_animals where pack_animals_id = pack_animals.id) as `family`,
    name, orders, birthdate FROM horses
UNION SELECT id, (select family from pack_animals where pack_animals_id = pack_animals.id) as `family`,
    name, orders, birthdate FROM donkeys;


CREATE Table young_animals As
SELECT id, (select family from home_animals where home_animals_id = home_animals.id) as `family`,
    name, orders, birthdate, TIMESTAMPDIFF(MONTH, dogs.birthdate, CURDATE()) AS age_months
FROM dogs
WHERE TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) < 3
AND TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) > 1
UNION
SELECT id, (select family from pack_animals where pack_animals_id = pack_animals.id) as `family`,
    name, orders, birthdate, TIMESTAMPDIFF(MONTH, horses.birthdate, CURDATE()) AS age_months
FROM horses
WHERE TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) < 3
AND TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) > 1
UNION
SELECT id, (select family from home_animals where home_animals_id = home_animals.id) as `family`,
    name, orders, birthdate, TIMESTAMPDIFF(MONTH, cats.birthdate, CURDATE()) AS age_months
FROM cats
WHERE TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) < 3
AND TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) > 1
UNION
SELECT id, (select family from home_animals where home_animals_id = home_animals.id) as `family`,
    name, orders, birthdate, TIMESTAMPDIFF(MONTH, hamsters.birthdate, CURDATE()) AS age_months
FROM hamsters
WHERE TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) < 3
AND TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) > 1
UNION
SELECT id, (select family from pack_animals where pack_animals_id = pack_animals.id) as `family`,
    name, orders, birthdate, TIMESTAMPDIFF(MONTH, camels.birthdate, CURDATE()) AS age_months
FROM camels
WHERE TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) < 3
AND TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) > 1
UNION
SELECT id, (select family from pack_animals where pack_animals_id = pack_animals.id) as `family`,
    name, orders, birthdate, TIMESTAMPDIFF(MONTH, donkeys.birthdate, CURDATE()) AS age_months
FROM donkeys
WHERE TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) < 3
AND TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) > 1;
SELECT * FROM young_animals;


CREATE Table all_animals As
SELECT id, (select family from home_animals where home_animals_id = home_animals.id) as `family`, name, orders, birthdate
FROM dogs
UNION
SELECT id, (select family from pack_animals where pack_animals_id = pack_animals.id) as `family`, name, orders, birthdate
FROM horses
UNION
SELECT id, (select family from home_animals where home_animals_id = home_animals.id) as `family`, name, orders, birthdate
FROM cats
UNION
SELECT id, (select family from home_animals where home_animals_id = home_animals.id) as `family`, name, orders, birthdate
FROM hamsters
UNION
SELECT id, (select family from pack_animals where pack_animals_id = pack_animals.id) as `family`, name, orders, birthdate
FROM camels
UNION
SELECT id, (select family from pack_animals where pack_animals_id = pack_animals.id) as `family`, name, orders, birthdate
FROM donkeys;

SELECT * FROM all_animals;