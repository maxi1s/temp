DROP TABLE IF EXISTS TotalChecks;
DROP TABLE IF EXISTS AdditionalProductsPurchase;
DROP TABLE IF EXISTS AdditionalProducts;
DROP TABLE IF EXISTS BouquetsPurchase;
DROP TABLE IF EXISTS Bouquets;
DROP TABLE IF EXISTS FlowersPurchase;
DROP TABLE IF EXISTS Flowers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS LoyaltyCards;

-- Создание таблицы "Flowers"
CREATE TABLE Flowers (
    FlowersID SERIAL PRIMARY KEY,
    FlowersName VARCHAR(255) NOT NULL,
    FlowerLifeSpan INT NOT NULL DEFAULT 7,
    FlowerStock INT NOT NULL DEFAULT 0,
    FlowersPrice NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "AdditionalProducts"
CREATE TABLE AdditionalProducts (
    AdditionalProductsID SERIAL PRIMARY KEY,
    AdditionalProductName VARCHAR(255) NOT NULL,
    AdditionalProductStock INT NOT NULL DEFAULT 0,
    AdditionalProductPrice NUMERIC(10, 2) NOT NULL
);

CREATE TABLE AdditionalProductsPurchase (
    AdditionalProductsPurchaseID SERIAL PRIMARY KEY,
    AdditionalProductsID INT NOT NULL REFERENCES AdditionalProducts(AdditionalProductsID),
    AdditionalProductsQuantity INT NOT NULL,
    AdditionalProductsPrice NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "Bouquets"
CREATE TABLE Bouquets (
    BouquetsID SERIAL PRIMARY KEY,
    BouquetName VARCHAR(255) NOT NULL,
    BouquetLifeSpan INT NOT NULL DEFAULT 7,
    BouquetInfo VARCHAR(255) NOT NULL,
    BouquetStock INT NOT NULL DEFAULT 0,
    BouquetPrice NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "BouquetsPurchase"
CREATE TABLE BouquetsPurchase (
    BouquetsPurchaseID SERIAL PRIMARY KEY,
    BouquetID INT NOT NULL REFERENCES Bouquets(BouquetsID),
    BouquetQuantity INT NOT NULL,
    BouquetPrice NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "FlowersPurchase"
CREATE TABLE FlowersPurchase (
    FlowersPurchaseID SERIAL PRIMARY KEY,
    FlowerID INT NOT NULL REFERENCES Flowers(FlowersID),
    FlowerQuantity INT NOT NULL,
    FlowerPrice NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "TotalChecks"
CREATE TABLE TotalChecks (
    TotalChecksID SERIAL PRIMARY KEY,
    FlowersPurchaseID INT REFERENCES FlowersPurchase(FlowersPurchaseID),
    BouquetsPurchaseID INT REFERENCES BouquetsPurchase(BouquetsPurchaseID),
    AdditionalProductsPurchaseID INT REFERENCES AdditionalProductsPurchase(AdditionalProductsPurchaseID),
    PurchaseDate DATE NOT NULL,
    TotalCost NUMERIC(10, 2) NOT NULL
);

-- Создание таблицы "Employees"
CREATE TABLE Employees (
   EmployeesID SERIAL PRIMARY KEY,
   EmployeeName VARCHAR(255) NOT NULL,
   EmployeePosition VARCHAR(255) NOT NULL,
   EmployeeSalaries NUMERIC(10, 2)
);

-- Создание таблицы "LoyaltyCards"
CREATE TABLE LoyaltyCards (
   CardsID SERIAL PRIMARY KEY,
   Summ NUMERIC(10, 2) NOT NULL,
   Discount NUMERIC(3, 2) NOT NULL
);

-- Создание таблицы "Customers"
CREATE TABLE Customers (
   CustomersID SERIAL PRIMARY KEY,
   CustomerName VARCHAR(255) NOT NULL,
   CustomerAdress VARCHAR(255),
   CustomerCardsID INT REFERENCES LoyaltyCards(CardsID),
   CustomerPhone VARCHAR(255) NOT NULL
);

-- Вставка данных в таблицу "AdditionalProducts"
INSERT INTO AdditionalProducts (AdditionalProductName, AdditionalProductPrice) VALUES
('Открытка', 100),
('Лента', 50),
('Карта покупателя', 300);

-- Вставка данных в таблицу "Bouquets"
INSERT INTO Bouquets (BouquetName, BouquetPrice, BouquetInfo) VALUES
('Букет Летний', 1000, 'Ландыши с Дольками цитруса'),
('Букет Романтический бриз', 700,'Розы с пиалками'),
('Букет Красная Осень', 1200,'Гиперикум и Хризантемы');

-- Вставка данных в таблицу "BouquetsPurchase"
INSERT INTO BouquetsPurchase (BouquetID, BouquetQuantity, BouquetPrice) VALUES
(1, 2, 2000),
(2, 1, 700),
(3, 3, 3600);

INSERT INTO Flowers (FlowersName, FlowersPrice) VALUES
('Роза', 150),
('Тюльпан', 100),
('Ромашка', 40);

-- Вставка данных в таблицу "FlowersPurchase"
INSERT INTO FlowersPurchase (FlowerID, FlowerQuantity, FlowerPrice) VALUES
(1, 10, 1500), 
(2, 15, 1500), 
(3, 20, 800); 

INSERT INTO AdditionalProductsPurchase (AdditionalProductsID ,AdditionalProductsQuantity ,AdditionalProductsPrice )VALUES 
                                                                  (1 ,10 ,1000 ), 
                                                                  (2 ,15 ,750 ),
                                                                   (3 ,20 ,500 );


INSERT INTO TotalChecks (FlowersPurchaseID, BouquetsPurchaseID, AdditionalProductsPurchaseID, PurchaseDate, TotalCost) VALUES
(1, NULL, NULL, '2023-02-14', 15000),
(1, 1, NULL, '2023-02-14', 35000),
(1, 1, 1, '2023-02-14', 41000);
 
INSERT INTO Employees (EmployeeName, EmployeePosition, EmployeeSalaries) VALUES
('Иванов Иван Иванович', 'Продавец', 32000),
('Петровна Мария Сергеевна', 'Менеджер', 39000), 
('Сидоров Сергей Владимирович', 'Администратор', 49000);

INSERT INTO Customers (CustomerName, CustomerPhone) VALUES
('Кузнецов Илья О.', '89031434567'),
('Смирнова Ольга С.', '89032343378'), 
('Попов Дмитрий А.', '89033436789');
 
INSERT INTO LoyaltyCards (Summ, Discount) VALUES
(1000, 0.1),
(1500, 0.15),
(200, 0.2);

SELECT * FROM AdditionalProducts;
SELECT * FROM AdditionalProductsPurchase;
SELECT * FROM Bouquets;
SELECT * FROM TotalChecks;

/*DELETE FROM TotalChecks;
DELETE FROM Employees;
DELETE FROM AdditionalProductsPurchase;
DELETE FROM AdditionalProducts;
DELETE FROM BouquetsPurchase;
DELETE FROM FlowersPurchase;
DELETE FROM Flowers;
DELETE FROM Bouquets;
DELETE FROM LoyaltyCards;
DELETE FROM Customers;
*/