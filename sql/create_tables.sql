-- sql/create_tables.sql

DROP TABLE IF EXISTS personal_info;
DROP TABLE IF EXISTS employment_info;
DROP TABLE IF EXISTS income_info;

CREATE TABLE personal_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    age INT,
    sex VARCHAR(10),
    race VARCHAR(50),
    native_country VARCHAR(50),
    marital_status VARCHAR(50),
    relationship VARCHAR(50)
);

CREATE TABLE employment_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    workclass VARCHAR(50),
    occupation VARCHAR(50),
    education VARCHAR(50),
    education_num INT,
    hours_per_week INT,
    capital_gain INT,
    capital_loss INT,
    fnlwgt INT
);

CREATE TABLE income_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    income VARCHAR(20)
);
