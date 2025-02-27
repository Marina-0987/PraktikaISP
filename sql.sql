-- Таблица "Категория"
CREATE TABLE Категория (
    Номер INT PRIMARY KEY,
    Категория_товара VARCHAR(255) NOT NULL,
    Назначение VARCHAR(255)
);

-- Таблица "Сотрудники"
CREATE TABLE Сотрудники (
    Номер INT PRIMARY KEY,
    ФИО VARCHAR(255) NOT NULL,
    Должность VARCHAR(255) NOT NULL,
    Номер_телефона BIGINT NOT NULL
);

-- Таблица "Товар"
CREATE TABLE Товар (
    Номер INT PRIMARY KEY,
    Наименование_товара VARCHAR(255) NOT NULL,
    Срок_годности DATE,
    Цена DECIMAL(10, 2) NOT NULL,
    Количество_в_наличии INT NOT NULL,
    Дата_поступления_на_склад DATE NOT NULL,
    Дата_продажи DATE,
    Категория_товара VARCHAR(255) NOT NULL,
    FOREIGN KEY (Категория_товара) REFERENCES Категория(Категория_товара)
);

-- Таблица "Продажа товара"
CREATE TABLE Продажа_товара (
    Код INT PRIMARY KEY,
    Наименование_товара VARCHAR(255) NOT NULL,
    Срок_годности DATE,
    Цена DECIMAL(10, 2) NOT NULL,
    Категория_товара VARCHAR(255) NOT NULL,
    Дата_продажи DATE NOT NULL,
    Сотрудник INT NOT NULL,
    FOREIGN KEY (Сотрудник) REFERENCES Сотрудники(Номер),
    FOREIGN KEY (Категория_товара) REFERENCES Категория(Категория_товара)
);

-- Таблица "Бракованные товары"
CREATE TABLE Бракованные_товары (
    Номер INT PRIMARY KEY,
    Наименование_товара VARCHAR(255) NOT NULL,
    Срок_годности DATE,
    Цена DECIMAL(10, 2) NOT NULL,
    Категория_товара VARCHAR(255) NOT NULL,
    Причина_бракованности VARCHAR(255),
    Дата_поступления_на_склад DATE NOT NULL,
    Количество_бракованных_товаров INT NOT NULL,
    FOREIGN KEY (Категория_товара) REFERENCES Категория(Категория_товара)
);

-- Таблица "Закупка товара"
CREATE TABLE Закупка_товара (
    Номер INT PRIMARY KEY,
    Наименование_товара VARCHAR(255) NOT NULL,
    Срок_годности DATE,
    Цена DECIMAL(10, 2) NOT NULL,
    Категория_товара VARCHAR(255) NOT NULL,
    Дата_покупки DATE NOT NULL,
    Сотрудник INT NOT NULL,
    FOREIGN KEY (Сотрудник) REFERENCES Сотрудники(Номер),
    FOREIGN KEY (Категория_товара) REFERENCES Категория(Категория_товара)
);
