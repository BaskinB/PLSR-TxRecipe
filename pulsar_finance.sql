SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `account` int(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `balance` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`account`) USING BTREE,
  KEY `Owner` (`owner`) USING BTREE,
  KEY `Type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `bank_accounts_permissions`;
CREATE TABLE IF NOT EXISTS `bank_accounts_permissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` int(10) NOT NULL,
  `type` int(10) NOT NULL,
  `jointOwner` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `workplace` varchar(255) DEFAULT NULL,
  `jobPermissions` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job` (`job`) USING BTREE,
  KEY `workplace` (`workplace`) USING BTREE,
  KEY `jointOwner` (`jointOwner`) USING BTREE,
  KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `bank_accounts_transactions`;
CREATE TABLE IF NOT EXISTS `bank_accounts_transactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `account` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(1024) NOT NULL DEFAULT '',
  `data` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `shop_bank_accounts`;
CREATE TABLE IF NOT EXISTS `shop_bank_accounts` (
  `shop` int(10) unsigned NOT NULL,
  `bank` int(10) unsigned NOT NULL,
  PRIMARY KEY (`shop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `loans`;
CREATE TABLE IF NOT EXISTS `loans` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `Creation` INT(11) NOT NULL,
    `SID` VARCHAR(255) NOT NULL,
    `Type` VARCHAR(50) NOT NULL,
    `AssetIdentifier` VARCHAR(255) NOT NULL,
    `Defaulted` TINYINT(1) NOT NULL DEFAULT 0,
    `InterestRate` DECIMAL(5,2) NOT NULL,
    `Total` DECIMAL(15,2) NOT NULL,
    `Remaining` DECIMAL(15,2) NOT NULL,
    `Paid` DECIMAL(15,2) NOT NULL,
    `DownPayment` DECIMAL(15,2) NOT NULL,
    `TotalPayments` INT(11) NOT NULL,
    `PaidPayments` INT(11) NOT NULL,
    `MissablePayments` INT(11) NOT NULL,
    `MissedPayments` INT(11) NOT NULL,
    `TotalMissedPayments` INT(11) NOT NULL,
    `NextPayment` INT(11) NOT NULL,
    `LastPayment` INT(11) NOT NULL,
    `paymentHistory` LONGTEXT DEFAULT NULL,
    `terms` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `SID` (`SID`),
    KEY `Type` (`Type`),
    KEY `AssetIdentifier` (`AssetIdentifier`),
    CONSTRAINT `paymentHistory` CHECK (json_valid(`paymentHistory`)),
    CONSTRAINT `terms` CHECK (json_valid(`terms`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `loans_credit_scores`;
CREATE TABLE IF NOT EXISTS `loans_credit_scores` (
    `SID` VARCHAR(255) NOT NULL,
    `Score` INT(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

