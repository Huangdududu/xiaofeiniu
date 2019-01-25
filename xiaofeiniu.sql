SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu CHARSET=UTF8;
USE xiaofeiniu;

CREATE TABLE xfn_admin (
  aid INT PRIMARY KEY AUTO_INCREMENT,
  aname VARCHAR(32) UNIQUE,
  apwd VARCHAR(64)
);

INSERT INTO xfn_admin VALUES 
  (NULL,'admin',PASSWORD('123')),
  (NULL,'boss',PASSWORD('123'));



#全局设置
CREATE TABLE xfn_settings (
  sid INT PRIMARY KEY AUTO_INCREMENT,
  appName VARCHAR(32),
  apiUrl VARCHAR(64),
  adminUrl VARCHAR(64),
  appUrl VARCHAR(64),
  icp VARCHAR(64),
  copyright VARCHAR(128)

);

INSERT INTO xfn_settings VALUES 
  ();


CREATE TABLE xfn_table (
  tid INT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(32),
  type VARCHAR(32),
  status INT

);

INSERT INTO xfn_table VALUES 
  (NULL,'','',1);

CREATE TABLE xfn_reservation (
  rid INT PRIMARY KEY AUTO_INCREMENT,
  contactName VARCHAR(32),
  phone VARCHAR(16),
  contactTime BIGINT,
  dinnerTime BIGINT
);




CREATE TABLE xfn_dish (
  did INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  imgUrl VARCHAR(128),
  price DECIMAL(6,2),
  detail VARCHAR(128),
  categoryId INT
);

CREATE TABLE xfn_order (
  oid INT PRIMARY KEY AUTO_INCREMENT,
  startTime BIGINT,
  endTime BIGINT,
  customerCount INT,
  tableId INT,
  FOREIGN KEY tableId REFFERENCES xfn_table(tid)
);

CREATE TABLE xfn_order_detail (
  oid INT PRIMARY KEY AUTO_INCREMENT,
  dishId INT,
  dishCount INT,
  customerName VARCHAR(32),
  orderId INT,
  FOREIGN KEY orderId REFFERENCES xfn_order(oid),
  FOREIGN KEY dishId REFFERENCES xfn_dish(did)

);



