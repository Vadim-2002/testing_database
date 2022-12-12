

DROP TABLE IF EXISTS `Справка+`;
CREATE TABLE `Справка+` 
(   `Слк` CHAR (3) NOT NULL
,   `Код` CHAR (6) NOT NULL
,   `Название` VARCHAR (50) NOT NULL
,   `Слк_родитель` CHAR (3) NULL
,   `Код_родитель` CHAR (3) NULL
,   CONSTRAINT `ПК\СПР` 
        PRIMARY KEY (`Слк`, `Код`)
,   CONSTRAINT `ВК1\СПР^СПР` 
        FOREIGN KEY (`Слк_родитель`, `Код_родитель`)
        REFERENCES `Справка+` (`Слк`, `Код`)
);
INSERT INTO `Справка+` VALUES 
    ("ВИД", "вид1", "вид2",  NULL, NULL)
;
SELECT "`Справка+` Table Content:" FROM `Справка+` WHERE 1=0;
SELECT * FROM `Справка+`;


DROP TABLE IF EXISTS `Тестируемый%ПЕРС`;
CREATE TABLE `Тестируемый%ПЕРС` 
(   `Код` CHAR (10) NOT NULL PRIMARY KEY
,   `Паспорт` CHAR (10) NOT NULL UNIQUE
,   `ФИО` VARCHAR (50) NOT NULL   
);
INSERT INTO `Тестируемый%ПЕРС` VALUES 
    ("001-Б", "123456", "Желудков В. Д."), 
    ("002-К", "234567", "Игнатьев Д. С.");
SELECT "`Тестируемый%ПЕРС` Table Content:" FROM `Тестируемый%ПЕРС` WHERE 1=0;
SELECT * FROM `Тестируемый%ПЕРС`;


DROP TABLE IF EXISTS `Тестирование`;
CREATE TABLE `Тестирование` 
(   `Регномер инд. направления` CHAR (10) NOT NULL PRIMARY KEY
,   `Код теста` CHAR (10) NOT NULL
,   `Код\Тес` CHAR (10) NOT NULL
,   `Время сдачи ответов` CHAR (5) NOT NULL
,   CONSTRAINT `ВК1\ТЕС^ТЕС` 
        FOREIGN KEY (`Код\Тес`)
        REFERENCES `Тестируемый%ПЕРС` (`Код`)
);

INSERT INTO `Тестирование` VALUES 
    ("11111", "77777", "002-К", "19:17");
SELECT "`Тестирование` Table Content:" FROM `Тестирование` WHERE 1=0;
SELECT * FROM `Тестирование`;


DROP TABLE IF EXISTS `Специальность`;
CREATE TABLE `Специальность` 
(   `Код` CHAR (10) NOT NULL PRIMARY KEY
);
INSERT INTO `Специальность` VALUES 
    ("ПРО"), 
    ("ПМИ"),
    ("ПИ");
SELECT "`Специальность` Table Content:" FROM `Специальность` WHERE 1=0;
SELECT * FROM `Специальность`;


DROP TABLE IF EXISTS `Дисциплина\СПЕЦ`;
CREATE TABLE `Дисциплина\СПЕЦ` 
(   `Код` CHAR (3) NOT NULL
,   `Код\Спец` CHAR (10) NOT NULL
,   `Код\Тест` CHAR (5) NOT NULL
,   CONSTRAINT `ПК\ДИС` 
        PRIMARY KEY (`Код`, `Код\Спец`)
,   CONSTRAINT `ВК1\ДИС^СПЕЦ` 
        FOREIGN KEY (`Код\Спец`)
        REFERENCES `Специальность` (`Код`)
,   CONSTRAINT `ВК2\ДИС^ТЕС` 
        FOREIGN KEY (`Код\Тест`)
        REFERENCES `Тест` (`Код`)
);
INSERT INTO `Дисциплина\СПЕЦ` VALUES 
    ("123", "ПРО", "22222")
;
SELECT "`Дисциплина\Спец` Table Content:" FROM `Дисциплина\СПЕЦ` WHERE 1=0;
SELECT * FROM `Дисциплина\СПЕЦ`;


DROP TABLE IF EXISTS `Тест`;
CREATE TABLE `Тест` 
(   `Код` CHAR (5) NOT NULL PRIMARY KEY
,  	 `Название` CHAR (10) NOT NULL
,	 `Слк_ВИД` CHAR (10) NOT NULL
,   `Код_ВИД` CHAR (10) NOT NULL

,   CONSTRAINT `ВК1\ТЕСТ^СПР` 
        FOREIGN KEY (`Слк_ВИД`, `Код_ВИД`)
        REFERENCES `Справка+` (`Слк`, `Код`)
);
INSERT INTO `Тест` VALUES 
	("22222", "physics", "ВИД",  "вид1")
;
SELECT "`Тест` Table Content:" FROM `Тест` WHERE 1=0;
SELECT * FROM `Тест`;


DROP TABLE IF EXISTS `Регистратор: СОТ`;
CREATE TABLE `Регистратор: СОТ` 
(   `Код\РЕГ^СОТ` CHAR (10) NOT NULL PRIMARY KEY
		REFERENCES `Сотрудник%ПЕРС` (`Код`)
);
INSERT INTO `Регистратор: СОТ` VALUES 
     ("001-П");
SELECT "`Регистратор: СОТ` Table Content:" FROM `Регистратор: СОТ` WHERE 1=0;
SELECT * FROM `Регистратор: СОТ`;


DROP TABLE IF EXISTS `Сотрудник%ПЕРС`;
CREATE TABLE `Сотрудник%ПЕРС` 
(   `Код` CHAR (10) NOT NULL PRIMARY KEY
,   `Паспорт` CHAR (10) NOT NULL UNIQUE
,   `ФИО` VARCHAR (50) NOT NULL
);
INSERT INTO `Сотрудник%ПЕРС` VALUES 
    ("001-П", "345678", "Желудков В. Д."), 
    ("002-П", "456789", "Игнатьев Д. С."),
    ("099-В", "567890", "Саблин В. Д.");
SELECT "`Сотрудник%ПЕРС` Table Content:" FROM `Сотрудник%ПЕРС` WHERE 1=0;
SELECT * FROM `Сотрудник%ПЕРС`;


DROP TABLE IF EXISTS `Проверяющий: СОТ`;
CREATE TABLE `Проверяющий: СОТ` 
(   `Код\ПРОВ^СОТ` CHAR (10) NOT NULL PRIMARY KEY
		REFERENCES `Сотрудник%ПЕРС` (`Код`)
);
INSERT INTO `Проверяющий: СОТ` VALUES 
     ("002-П");
SELECT "`проверяющий: СОТ` Table Content:" FROM `Проверяющий: СОТ` WHERE 1=0;
SELECT * FROM `Проверяющий: СОТ`;


DROP TABLE IF EXISTS `Ответственный: СОТ`;
CREATE TABLE `Ответственный: СОТ` 
(   `Код\ОТВ^СОТ` CHAR (10) NOT NULL PRIMARY KEY
		REFERENCES `Сотрудник%ПЕРС` (`Код`)
);
INSERT INTO `Ответственный: СОТ` VALUES 
     ("001-П");
SELECT "`Ответственный: СОТ` Table Content:" FROM `Ответственный: СОТ` WHERE 1=0;
SELECT * FROM `Ответственный: СОТ`;


DROP TABLE IF EXISTS `Ассистент: СОТ`;
CREATE TABLE `Ассистент: СОТ` 
(   `Код\АССИ^СОТ` CHAR (10) NOT NULL PRIMARY KEY
		REFERENCES `Сотрудник%ПЕРС` (`Код`)
);
INSERT INTO `Ассистент: СОТ` VALUES 
     ("099-В");
SELECT "`Ассистент: СОТ` Table Content:" FROM `Ассистент: СОТ` WHERE 1=0;
SELECT * FROM `Ассистент: СОТ`;


DROP TABLE IF EXISTS `Сеанс`;
CREATE TABLE `Сеанс` 
(   `Регномер` CHAR (5) NOT NULL PRIMARY KEY
,  	 `Дата/время начала` CHAR (14) NOT NULL
,	 `Код\РЕГ^СОТ` CHAR (10) NOT NULL

,   CONSTRAINT `ВК1\СЕАН^РЕГ` 
        FOREIGN KEY (`Код\РЕГ^СОТ`)
        REFERENCES `Регистратор: СОТ` (`Код\РЕГ^СОТ`)
);
INSERT INTO `Сеанс` VALUES 
	("12345", "25.02.22/12:00", "001-П")
;
SELECT "`Сеанс` Table Content:" FROM `Сеанс` WHERE 1=0;
SELECT * FROM `Сеанс`;


DROP TABLE IF EXISTS `Запись: СЕАН`;
CREATE TABLE `Запись: СЕАН` 
(   `Регномер\ЗАП^СЕАН` CHAR (10) NOT NULL PRIMARY KEY
		REFERENCES `Сеанс` (`Регномер`)
);
INSERT INTO `Запись: СЕАН` VALUES 
     ("12345");
SELECT "`Запись: СЕАН` Table Content:" FROM `Запись: СЕАН` WHERE 1=0;
SELECT * FROM `Запись: СЕАН`;


DROP TABLE IF EXISTS `Проведение: СЕАН`;
CREATE TABLE `Проведение: СЕАН` 
(   `Регномер\ПРО^СЕАН` CHAR (10) NOT NULL PRIMARY KEY
		REFERENCES `Сеанс` (`Регномер`)
);
INSERT INTO `Проведение: СЕАН` VALUES 
     ("12345");
SELECT "`Проведение: СЕАН` Table Content:" FROM `Проведение: СЕАН` WHERE 1=0;
SELECT * FROM `Проведение: СЕАН`;


DROP TABLE IF EXISTS `Проверка: СЕАН`;
CREATE TABLE `Проверка: СЕАН` 
(   `Регномер\ПРОВ^СЕАН` CHAR (10) NOT NULL PRIMARY KEY
		REFERENCES `Сеанс` (`Регномер`)
,   `Код\ПРОВ^СОТ` CHAR (10) NOT NULL
,   `Номер\Сер` CHAR (10) NULL
,   `Код\Класс` CHAR (10) NOT NULL

,   CONSTRAINT `ВК2\ПРОВ^ПРОВ` 
        FOREIGN KEY (`Код\ПРОВ^СОТ`)
        REFERENCES `Ассистент: СОТ` (`Код\АССИ^СОТ`)
,   CONSTRAINT `ВК3\ПРОВ^СЕР` 
        FOREIGN KEY (`Номер\Сер`)
        REFERENCES `Сертификат` (`Номер`)
,   CONSTRAINT `ВК4\ПРОВ^КЛАС` 
        FOREIGN KEY (`Код\Класс`)
        REFERENCES `Класс` (`Код`)
);
INSERT INTO `Проверка: СЕАН` VALUES 
     ("12345", "099-В", "89878", "22256");
SELECT "`Проверка: СЕАН` Table Content:" FROM `Проверка: СЕАН` WHERE 1=0;
SELECT * FROM `Проверка: СЕАН`;


DROP TABLE IF EXISTS `Сертификат`;
CREATE TABLE `Сертификат` 
(   `Номер` CHAR (10) NOT NULL PRIMARY KEY
,   `Дата выдачи`  CHAR (10) NOT NULL
);
INSERT INTO `Сертификат` VALUES 
     ("89878", "25.02.2022");
SELECT "`Сертификат` Table Content:" FROM `Сертификат` WHERE 1=0;
SELECT * FROM `Сертификат`;


DROP TABLE IF EXISTS `Класс`;
CREATE TABLE `Класс` 
(   `Код` CHAR (5) NOT NULL PRIMARY KEY
,  	 `Адрес` CHAR (50) NOT NULL
,	 `Слк_ВИД` CHAR (10) NOT NULL
,   `Код_ВИД` CHAR (10) NOT NULL

,   CONSTRAINT `ВК1\КЛАС^СПР` 
        FOREIGN KEY (`Слк_ВИД`, `Код_ВИД`)
        REFERENCES `Справка+` (`Слк`, `Код`)
);
INSERT INTO `Класс` VALUES 
	("22256", "ул.Колчака", "ВИД",  "вид1")
;
SELECT "`Класс` Table Content:" FROM `Класс` WHERE 1=0;
SELECT * FROM `Класс`;


DROP TABLE IF EXISTS `Запись на тест`;
CREATE TABLE `Запись на тест` 
(   `Регномер инд. направления` CHAR (10) NOT NULL PRIMARY KEY
,   `Регномер\ЗАП^СЕАН` CHAR (10) NOT NULL
,   `Код\Тест` CHAR (10) NOT NULL

,   CONSTRAINT `ВК1\ЗАП^ЗАП` 
        FOREIGN KEY (`Регномер\ЗАП^СЕАН`)
        REFERENCES `Запись: СЕАН` (`Регномер\ЗАП^СЕАН`)
,   CONSTRAINT `ВК2\ЗАП^ТЕСТ` 
        FOREIGN KEY (`Код\Тест`)
        REFERENCES `Тест` (`Код`)
);
INSERT INTO `Запись на тест` VALUES 
     ("555","12345", "22222");
SELECT "`Запись на тест` Table Content:" FROM `Запись на тест` WHERE 1=0;
SELECT * FROM `Запись на тест`;


DROP TABLE IF EXISTS `Ассистент тестирования: СЕАН*АССИ`;
CREATE TABLE `Ассистент тестирования: СЕАН*АССИ` 
(   `Код\АССИ^СОТ` CHAR (10) NOT NULL
,   `Регномер\ПРОВ^СЕАН` CHAR (10) NOT NULL
,   `Роль` CHAR (10) NOT NULL

,   CONSTRAINT `Код\АССИ^СОТ` 
        FOREIGN KEY (`Код\АССИ^СОТ`)
        REFERENCES `Ассистент: СОТ` (`Код\АССИ^СОТ`)
,   CONSTRAINT `Регномер\ПРОВ^СЕАН` 
        FOREIGN KEY (`Регномер\ПРОВ^СЕАН`)
        REFERENCES `Проверка: СЕАН` (`Регномер\ПРОВ^СЕАН`)
);
INSERT INTO `Ассистент тестирования: СЕАН*АССИ` VALUES 
     ("099-В","12345", "Помощник");
SELECT "`Ассистент тестирования: СЕАН*АССИ` Table Content:" FROM `Ассистент тестирования: СЕАН*АССИ` WHERE 1=0;
SELECT * FROM `Ассистент тестирования: СЕАН*АССИ`;


DROP TABLE IF EXISTS `Вопрос\ТЕСТ`;
CREATE TABLE `Вопрос\ТЕСТ` 
(   `Нпп вопроса` CHAR (10) NOT NULL PRIMARY KEY
,   `Содержание вопроса` CHAR (80) NOT NULL
,	 `Слк_ВИД` CHAR (10) NOT NULL
,   `Код_ВИД` CHAR (10) NOT NULL

,   CONSTRAINT `ВК1\ВОП^СПР` 
        FOREIGN KEY (`Слк_ВИД`, `Код_ВИД`)
        REFERENCES `Справка+` (`Слк`, `Код`)
);
INSERT INTO `Вопрос\ТЕСТ` VALUES 
     ("565656","Ответ...", "ВИД", "вид1");
SELECT "`Вопрос\ТЕСТ` Table Content:" FROM `Вопрос\ТЕСТ` WHERE 1=0;
SELECT * FROM `Вопрос\ТЕСТ`;


DROP TABLE IF EXISTS `Ответ: ПРОВ*ВОП`;
CREATE TABLE `Ответ: ПРОВ*ВОП` 
(   `Регномер\ПРОВ^СЕАН` CHAR (10) NOT NULL
,   `Нпп вопрса\Воп` CHAR (10) NOT NULL
,	 `Ответ тестируемого` CHAR (10) NOT NULL
,   `Баллы` CHAR (3) NOT NULL

,   CONSTRAINT `ВК1\ОТВ^ПРОВ` 
        FOREIGN KEY (`Регномер\ПРОВ^СЕАН`)
        REFERENCES `Проверка: СЕАН` (`Регномер\ПРОВ^СЕАН`)
,   CONSTRAINT `ВК2\ОТВ^ВОП` 
        FOREIGN KEY (`Нпп вопрса\Воп`)
        REFERENCES `Вопрос\ТЕСТ` (`Нпп вопроса`)
);
INSERT INTO `Ответ: ПРОВ*ВОП` VALUES 
     ("12345","565656", "Ответ...", "100");
SELECT "`Ответ: ПРОВ*ВОП` Table Content:" FROM `Ответ: ПРОВ*ВОП` WHERE 1=0;
SELECT * FROM `Ответ: ПРОВ*ВОП`;


