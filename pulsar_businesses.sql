SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS `business_configs` (
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT DEFAULT NULL,
    PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `business_documents` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `job` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `content` LONGTEXT DEFAULT NULL,
    `author` LONGTEXT DEFAULT NULL,
    `history` LONGTEXT DEFAULT NULL,
    `lastUpdated` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `job` (`job`),
    KEY `title` (`title`),
    CONSTRAINT `author` CHECK (json_valid(`author`)),
    CONSTRAINT `history` CHECK (json_valid(`history`)),
    CONSTRAINT `lastUpdated` CHECK (json_valid(`lastUpdated`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `business_notices` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `job` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `content` LONGTEXT DEFAULT NULL,
    `author` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `job` (`job`),
    CONSTRAINT `author` CHECK (json_valid(`author`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `business_phones` (
  `id` char(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `number` varchar(50) NOT NULL DEFAULT '0',
  `muted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `business_receipts` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `job` VARCHAR(255) NOT NULL,
    `customerName` VARCHAR(255) DEFAULT NULL,
    `amount` DECIMAL(15,2) DEFAULT 0,
    `items` LONGTEXT DEFAULT NULL,
    `author` LONGTEXT DEFAULT NULL,
    `history` LONGTEXT DEFAULT NULL,
    `lastUpdated` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `job` (`job`),
    KEY `customerName` (`customerName`),
    CONSTRAINT `items` CHECK (json_valid(`items`)),
    CONSTRAINT `author` CHECK (json_valid(`author`)),
    CONSTRAINT `history` CHECK (json_valid(`history`)),
    CONSTRAINT `lastUpdated` CHECK (json_valid(`lastUpdated`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `business_tvs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tv` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

