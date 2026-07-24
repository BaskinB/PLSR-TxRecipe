SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `License` varchar(255) DEFAULT NULL,
  `User` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SID` int(11) NOT NULL AUTO_INCREMENT,
  `First` varchar(255) DEFAULT NULL,
  `Last` varchar(255) DEFAULT NULL,
  `Gender` int(11) NOT NULL DEFAULT 0,
  `New` tinyint(1) NOT NULL DEFAULT 1,
  `Jailed` tinyint(1) NOT NULL DEFAULT 0,
  `Origin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Apps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Wardrobe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `DOB` longtext DEFAULT NULL,
  `Cash` bigint(20) DEFAULT NULL,
  `LastPlayed` longtext DEFAULT NULL,
  `Jobs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Apartment` int(11) DEFAULT NULL,
  `PhoneSettings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Crypto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Licenses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Alias` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `PhonePermissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `PhonePosition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Addiction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Animations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Armor` int(11) NOT NULL DEFAULT 0,
  `BankAccount` int(11) DEFAULT NULL,
  `CryptoWallet` varchar(255) DEFAULT NULL,
  `HP` int(11) DEFAULT 200,
  `HPReductions` int(11) DEFAULT 0,
  `States` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Callsign` varchar(255) DEFAULT NULL,
  `MDTHistory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Flags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Qualifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `LastClockOn` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Salary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `TimeClockedOn` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Reputations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `GangChain` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Bio` varchar(255) DEFAULT NULL,
  `JailedData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ICU` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Deleted` tinyint(1) DEFAULT 0,
  `Status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Parole` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `MDTSystemAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `LaptopSettings` longtext DEFAULT NULL,
  `LaptopPermissions` longtext DEFAULT NULL,
  `LaptopApps` longtext DEFAULT NULL,
  `HUDConfig` longtext DEFAULT NULL,
  `Mugshot` varchar(255) DEFAULT NULL,
  `Attorney` tinyint(1) DEFAULT 0,
  `MDTSuspension` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
  `DrugStates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CasinoChips` LONGTEXT DEFAULT NULL,
  `LSUNDGInviter` JSON DEFAULT NULL,
  `LSUNDGBan` JSON DEFAULT NULL,
  PRIMARY KEY (`SID`) USING BTREE,
  CONSTRAINT `Origin` CHECK (json_valid(`Origin`)),
  CONSTRAINT `Apps` CHECK (json_valid(`Apps`)),
  CONSTRAINT `Wardrobe` CHECK (json_valid(`Wardrobe`)),
  CONSTRAINT `Jobs` CHECK (json_valid(`Jobs`)),
  CONSTRAINT `PhoneSettings` CHECK (json_valid(`PhoneSettings`)),
  CONSTRAINT `Crypto` CHECK (json_valid(`Crypto`)),
  CONSTRAINT `Licenses` CHECK (json_valid(`Licenses`)),
  CONSTRAINT `Alias` CHECK (json_valid(`Alias`)),
  CONSTRAINT `PhonePermissions` CHECK (json_valid(`PhonePermissions`)),
  CONSTRAINT `Addiction` CHECK (json_valid(`Addiction`)),
  CONSTRAINT `Animations` CHECK (json_valid(`Animations`)),
  CONSTRAINT `States` CHECK (json_valid(`States`)),
  CONSTRAINT `MDTHistory` CHECK (json_valid(`MDTHistory`)),
  CONSTRAINT `Flags` CHECK (json_valid(`Flags`)),
  CONSTRAINT `Qualifications` CHECK (json_valid(`Qualifications`)),
  CONSTRAINT `LastClockOn` CHECK (json_valid(`LastClockOn`)),
  CONSTRAINT `Salary` CHECK (json_valid(`Salary`)),
  CONSTRAINT `TimeClockedOn` CHECK (json_valid(`TimeClockedOn`)),
  CONSTRAINT `Reputations` CHECK (json_valid(`Reputations`)),
  CONSTRAINT `GangChain` CHECK (json_valid(`GangChain`)),
  CONSTRAINT `JailedData` CHECK (json_valid(`JailedData`)),
  CONSTRAINT `ICU` CHECK (json_valid(`ICU`)),
  CONSTRAINT `Status` CHECK (json_valid(`Status`)),
  CONSTRAINT `Parole` CHECK (json_valid(`Parole`)),
  CONSTRAINT `DrugStates` CHECK (json_valid(`DrugStates`)),
  CONSTRAINT `CasinoChips` CHECK (json_valid(`CasinoChips`)),
  CONSTRAINT `LSUNDGInviter` CHECK (json_valid(`LSUNDGInviter`)),
  CONSTRAINT `MDTSuspension` CHECK (json_valid(`MDTSuspension`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `character_app_profiles`;
CREATE TABLE IF NOT EXISTS `character_app_profiles` (
  `sid` bigint(20) unsigned NOT NULL,
  `app` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `picture` varchar(512) DEFAULT NULL,
  `meta` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`sid`,`app`),
  UNIQUE KEY `app` (`app`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `app_profile_history`;
CREATE TABLE IF NOT EXISTS `app_profile_history` (
  `sid` bigint(20) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `app` varchar(32) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `picture` varchar(2048) DEFAULT NULL,
  `meta` longtext DEFAULT NULL,
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
    `account` VARCHAR(255) NOT NULL,
    `tokens` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`account`),
    CONSTRAINT `tokens` CHECK (json_valid(`tokens`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `bans`;
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

DROP TABLE IF EXISTS `sequence`;
CREATE TABLE IF NOT EXISTS `sequence` (
  `id` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `sequence` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `changelogs`;
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

DROP TABLE IF EXISTS `logs`;
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

DROP TABLE IF EXISTS `jobs`;
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

DROP TABLE IF EXISTS `vehicles`;
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

DROP TABLE IF EXISTS `storage_units`;
CREATE TABLE `storage_units` (
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

DROP TABLE IF EXISTS `properties`;
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

DROP TABLE IF EXISTS `properties_furniture`;
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