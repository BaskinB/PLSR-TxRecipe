SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS `character_app_profiles` (
  `sid` bigint(20) unsigned NOT NULL,
  `app` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `picture` varchar(512) DEFAULT NULL,
  `meta` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`sid`,`app`),
  UNIQUE KEY `app` (`app`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `app_profile_history` (
  `sid` bigint(20) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `app` varchar(32) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `picture` varchar(2048) DEFAULT NULL,
  `meta` longtext DEFAULT NULL,
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `tokens` (
    `account` VARCHAR(255) NOT NULL,
    `tokens` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`account`),
    CONSTRAINT `tokens` CHECK (json_valid(`tokens`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bans` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `account` INT(11) DEFAULT NULL,
    `identifier` VARCHAR(255) DEFAULT NULL,
    `expires` INT(11) NOT NULL,
    `reason` TEXT NOT NULL,
    `issuer` VARCHAR(255) NOT NULL,
    `active` TINYINT(1) NOT NULL DEFAULT 1,
    `started` INT(11) NOT NULL,
    `tokens` LONGTEXT DEFAULT NULL,
    `unbanned` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `account` (`account`),
    KEY `identifier` (`identifier`),
    KEY `active` (`active`),
    KEY `expires` (`expires`),
    CONSTRAINT `tokens` CHECK (json_valid(`tokens`)),
    CONSTRAINT `unbanned` CHECK (json_valid(`unbanned`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sequence` (
  `id` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `sequence` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `changelogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `component` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `level` (`level`),
  KEY `component` (`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `jobs` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Workplaces` longtext DEFAULT NULL,
  `Grades` longtext DEFAULT NULL,
  `Salary` int(11) NOT NULL DEFAULT 0,
  `SalaryTier` int(11) NOT NULL DEFAULT 0,
  `LastUpdated` bigint(20) NOT NULL DEFAULT 0,
  `Data` longtext DEFAULT NULL,
  `Owner` int(11) DEFAULT NULL,
  `Custom` tinyint(1) DEFAULT 0,
  `Hidden` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `Type` (`Type`),
  KEY `Owner` (`Owner`),
  CONSTRAINT `Workplaces` CHECK (json_valid(`Workplaces`)),
  CONSTRAINT `Grades` CHECK (json_valid(`Grades`)),
  CONSTRAINT `Data` CHECK (json_valid(`Data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VIN` varchar(50) NOT NULL,
  `Type` int(11) NOT NULL DEFAULT 0,
  `Make` varchar(100) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `RegisteredPlate` varchar(20) NOT NULL,
  `RegistrationDate` int(11) DEFAULT 0,
  `OwnerType` int(11) NOT NULL DEFAULT 0,
  `OwnerId` varchar(255) NOT NULL,
  `OwnerWorkplace` varchar(255) DEFAULT NULL,
  `StorageType` int(11) DEFAULT NULL,
  `StorageId` varchar(50) DEFAULT NULL,
  `FirstSpawn` boolean DEFAULT FALSE,
  `Mileage` decimal(10,2) DEFAULT 0.00,
  `Fuel` decimal(5,2) DEFAULT 100.00,
  `DirtLevel` decimal(4,2) DEFAULT 0.00,
  `Value` int(11) DEFAULT 0,
  `Class` varchar(10) DEFAULT 'Unknown',
  `Vehicle` int(11) DEFAULT 0,
  `FakePlate` tinyint(1) NOT NULL DEFAULT 0,
  `Damage` json DEFAULT NULL,
  `DamagedParts` json DEFAULT NULL,
  `Polish` json DEFAULT NULL,
  `PurgeColor` json DEFAULT NULL,
  `PurgeLocation` varchar(50) DEFAULT '',
  `Harness` int(11) DEFAULT 0,
  `Nitrous` int(11) DEFAULT 0,
  `NeonsDisabled` boolean DEFAULT FALSE,
  `WheelFitment` json DEFAULT NULL,
  `Donator` boolean DEFAULT FALSE,
  `Seized` boolean DEFAULT FALSE,
  `SeizedTime` int(11) DEFAULT 0,
  `Properties` longtext DEFAULT NULL,
  `Created` datetime NOT NULL DEFAULT current_timestamp(),
  `LastSave` bigint(20) DEFAULT NULL,
  `ModelType` varchar(50) DEFAULT 'automobile',
  `OwnerLevel` INT(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `VIN` (`VIN`),
  KEY `OwnerType` (`OwnerType`),
  KEY `OwnerId` (`OwnerId`),
  KEY `RegisteredPlate` (`RegisteredPlate`),
  CONSTRAINT `Properties` CHECK (json_valid(`Properties`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `storage_units` (
    `_id` INT(11) NOT NULL AUTO_INCREMENT,
    `label` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
    `owner` INT(11) NULL DEFAULT -1,
    `level` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
    `location` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
    `managedBy` VARCHAR(255) NULL DEFAULT NULL,
    `lastAccessed` DATETIME NULL DEFAULT NULL,
    `passcode` VARCHAR(255) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
    PRIMARY KEY (`_id`) USING BTREE,
    CONSTRAINT `location` CHECK (json_valid(`location`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `sold` tinyint(1) NOT NULL DEFAULT 0,
  `owner` varchar(255) DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `upgrades` longtext DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 1,
  `keys` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `foreclosed` tinyint(1) NOT NULL DEFAULT 0,
  `soldAt` int(11) DEFAULT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `owner` (`owner`),
  KEY `sold` (`sold`),
  CONSTRAINT `location` CHECK (json_valid(`location`)),
  CONSTRAINT `upgrades` CHECK (json_valid(`upgrades`)),
  CONSTRAINT `keys` CHECK (json_valid(`keys`)),
  CONSTRAINT `data` CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `properties_furniture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(255) NOT NULL,
  `furniture` longtext DEFAULT NULL,
  `updatedTime` int(11) DEFAULT NULL,
  `updatedBy` longtext DEFAULT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `property` (`property`),
  CONSTRAINT `furniture` CHECK (json_valid(`furniture`)),
  CONSTRAINT `updatedBy` CHECK (json_valid(`updatedBy`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;