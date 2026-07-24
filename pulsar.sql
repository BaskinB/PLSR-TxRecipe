SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `billboards`;
CREATE TABLE IF NOT EXISTS `billboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billboardId` varchar(50) NOT NULL,
  `billboardUrl` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `billboardId` (`billboardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `bench_schematics`;
CREATE TABLE IF NOT EXISTS `bench_schematics` (
  `bench` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `schematic` char(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  KEY `bench` (`bench`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `blueline_race_history`;
CREATE TABLE IF NOT EXISTS `blueline_race_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `host` varchar(32) NOT NULL,
  `track` int(11) unsigned NOT NULL,
  `class` varchar(4) NOT NULL,
  `racers` longtext NOT NULL DEFAULT '[]',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pd_race_history_track` (`track`) USING BTREE,
  KEY `host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `blueline_tracks`;
CREATE TABLE IF NOT EXISTS `blueline_tracks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `distance` varchar(256) NOT NULL,
  `type` varchar(16) NOT NULL,
  `checkpoints` longtext NOT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `blueline_track_history`;
CREATE TABLE IF NOT EXISTS `blueline_track_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `track` int(11) unsigned NOT NULL,
  `race` int(11) unsigned NOT NULL,
  `callsign` varchar(32) NOT NULL,
  `lap_start` int(11) NOT NULL,
  `lap_end` int(11) NOT NULL,
  `laptime` int(11) NOT NULL,
  `car` varchar(256) NOT NULL,
  `owned` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pd_track_history_track` (`track`) USING BTREE,
  KEY `pd_track_history_race` (`race`) USING BTREE,
  KEY `callsign` (`callsign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `business_configs`;
CREATE TABLE IF NOT EXISTS `business_configs` (
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT DEFAULT NULL,
    PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `business_documents`;
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

DROP TABLE IF EXISTS `business_notices`;
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

DROP TABLE IF EXISTS `business_phones`;
CREATE TABLE IF NOT EXISTS `business_phones` (
  `id` char(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `number` varchar(50) NOT NULL DEFAULT '0',
  `muted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `business_receipts`;
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

DROP TABLE IF EXISTS `business_tvs`;
CREATE TABLE IF NOT EXISTS `business_tvs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tv` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `casino_bigwins`;
CREATE TABLE IF NOT EXISTS `casino_bigwins` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `player_name` VARCHAR(255) NOT NULL,
    `game` VARCHAR(100) NOT NULL,
    `amount` DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `game` (`game`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `casino_config`;
CREATE TABLE IF NOT EXISTS `casino_config` (
    `key` VARCHAR(255) NOT NULL,
    `data` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`key`),
    CONSTRAINT `data` CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `casino_statistics`;
CREATE TABLE IF NOT EXISTS `casino_statistics` (
    `SID` VARCHAR(255) NOT NULL,
    `slots` LONGTEXT DEFAULT NULL,
    `poker` LONGTEXT DEFAULT NULL,
    `blackjack` LONGTEXT DEFAULT NULL,
    `roulette` LONGTEXT DEFAULT NULL,
    `AmountWon` LONGTEXT DEFAULT NULL,
    `AmountLost` LONGTEXT DEFAULT NULL,
    `TotalAmountWon` DECIMAL(15,2) DEFAULT 0,
    `TotalAmountLost` DECIMAL(15,2) DEFAULT 0,
    `wheel` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`SID`),
    CONSTRAINT `slots` CHECK (json_valid(`slots`)),
    CONSTRAINT `poker` CHECK (json_valid(`poker`)),
    CONSTRAINT `blackjack` CHECK (json_valid(`blackjack`)),
    CONSTRAINT `roulette` CHECK (json_valid(`roulette`)),
    CONSTRAINT `AmountWon` CHECK (json_valid(`AmountWon`)),
    CONSTRAINT `AmountLost` CHECK (json_valid(`AmountLost`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `ox_inventory`;
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

DROP TABLE IF EXISTS `character_calls`;
CREATE TABLE IF NOT EXISTS `character_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(12) NOT NULL,
  `number` varchar(12) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `method` bit(1) NOT NULL DEFAULT b'0',
  `duration` int(11) NOT NULL DEFAULT -1,
  `anonymous` bit(1) NOT NULL DEFAULT b'0',
  `decryptable` bit(1) NOT NULL DEFAULT b'0',
  `limited` bit(1) NOT NULL DEFAULT b'0',
  `unread` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `character_chatter_groups`;
CREATE TABLE IF NOT EXISTS `character_chatter_groups` (
  `sid` bigint(20) unsigned NOT NULL,
  `chatty_group` bigint(20) unsigned NOT NULL,
  `joined_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sid`,`chatty_group`) USING BTREE,
  KEY `chatter_char_group` (`chatty_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `character_contacts`;
CREATE TABLE IF NOT EXISTS `character_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NOT NULL,
  `number` varchar(12) NOT NULL,
  `name` varchar(64) NOT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `favorite` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `character_documents`;
CREATE TABLE IF NOT EXISTS `character_documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `character_documents_shared`;
CREATE TABLE IF NOT EXISTS `character_documents_shared` (
  `doc_id` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `sharer` int(10) unsigned NOT NULL,
  `sharer_name` varchar(256) DEFAULT NULL,
  `shared_date` datetime NOT NULL DEFAULT current_timestamp(),
  `signature_required` tinyint(1) NOT NULL DEFAULT 0,
  `signed` datetime DEFAULT NULL,
  `signed_name` varchar(256) DEFAULT NULL,
  UNIQUE KEY `doc_id_sid` (`doc_id`,`sid`),
  KEY `sid` (`sid`),
  KEY `sharer` (`sharer`),
  KEY `doc_sid` (`doc_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `character_emails`;
CREATE TABLE IF NOT EXISTS `character_emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL,
  `sender` varchar(256) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `body` longtext NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `unread` bit(1) NOT NULL DEFAULT b'1',
  `flags` longtext DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `character_messages`;
CREATE TABLE IF NOT EXISTS `character_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(12) NOT NULL,
  `number` varchar(12) NOT NULL,
  `method` tinyint(1) NOT NULL DEFAULT 0,
  `unread` bit(1) NOT NULL DEFAULT b'1',
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `message` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `number` (`number`),
  KEY `ownu` (`owner`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `character_parole`;
CREATE TABLE IF NOT EXISTS `character_parole` (
  `SID` int(11) NOT NULL,
  `end` datetime NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `parole` int(11) NOT NULL DEFAULT 0,
  `sentence` int(11) NOT NULL DEFAULT 0,
  `fine` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `character_photos`;
CREATE TABLE IF NOT EXISTS `character_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) NOT NULL,
  `image_url` text NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `character_schematics`;
CREATE TABLE IF NOT EXISTS `character_schematics` (
  `sid` int(11) DEFAULT NULL,
  `bench` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `schematic` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  KEY `sid` (`sid`,`bench`),
  KEY `schematic` (`schematic`,`bench`,`sid`),
  KEY `sid_schem` (`sid`,`schematic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `chatter_groups`;
CREATE TABLE IF NOT EXISTS `chatter_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL DEFAULT 'Chatter Group',
  `icon` varchar(1024) DEFAULT NULL,
  `owner` bigint(20) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `chatter_messages`;
CREATE TABLE IF NOT EXISTS `chatter_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group` bigint(20) unsigned NOT NULL,
  `author` bigint(20) unsigned NOT NULL,
  `message` varchar(256) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `chatter_msg_group` (`group`),
  KEY `chatter_msg_author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `crafting_cooldowns`;
CREATE TABLE IF NOT EXISTS `crafting_cooldowns` (
  `bench` varchar(64) NOT NULL,
  `id` varchar(64) NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `dealer_data`;
CREATE TABLE IF NOT EXISTS `dealer_data` (
  `dealership` varchar(255) NOT NULL,
  `sales` int(11) DEFAULT 0,
  `revenue` decimal(15,2) DEFAULT 0.00,
  `inventory` longtext DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `profitPercentage` decimal(5,2) DEFAULT 0.00,
  `commission` decimal(5,2) DEFAULT 0.00,
  PRIMARY KEY (`dealership`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `dealer_records`;
CREATE TABLE IF NOT EXISTS `dealer_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `seller` longtext DEFAULT NULL,
  `buyer` longtext DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  `price` decimal(15,2) DEFAULT 0.00,
  `commission` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `dealership` (`dealership`),
  KEY `time` (`time`),
  CONSTRAINT `seller` CHECK (json_valid(`seller`)),
  CONSTRAINT `buyer` CHECK (json_valid(`buyer`)),
  CONSTRAINT `vehicle` CHECK (json_valid(`vehicle`))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `dealer_records_buybacks`;
CREATE TABLE IF NOT EXISTS `dealer_records_buybacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `seller` longtext DEFAULT NULL,
  `buyer` longtext DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  `price` decimal(15,2) DEFAULT 0.00,
  `commission` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `dealership` (`dealership`),
  KEY `time` (`time`),
  CONSTRAINT `seller` CHECK (json_valid(`seller`)),
  CONSTRAINT `buyer` CHECK (json_valid(`buyer`)),
  CONSTRAINT `vehicle` CHECK (json_valid(`vehicle`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `dealer_showrooms`;
CREATE TABLE IF NOT EXISTS `dealer_showrooms` (
  `dealership` varchar(255) NOT NULL,
  `showroom` longtext DEFAULT NULL,
  PRIMARY KEY (`dealership`),
  CONSTRAINT `showroom` CHECK (json_valid(`showroom`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `dealer_stock`;
CREATE TABLE IF NOT EXISTS `dealer_stock` (
  `dealership` varchar(255) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `modelType` varchar(255) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `lastStocked` int(11) DEFAULT NULL,
  `lastPurchase` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `dealership_vehicle` (`dealership`,`vehicle`),
  KEY `dealership` (`dealership`),
  KEY `vehicle` (`vehicle`),
  CONSTRAINT `data` CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `donator_items`;
CREATE TABLE IF NOT EXISTS `donator_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player` char(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `player_id` int(10) unsigned DEFAULT NULL,
  `redeemed` tinyint(1) NOT NULL DEFAULT 0,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player` (`player`) USING BTREE,
  KEY `id_player` (`id`,`player`) USING BTREE,
  KEY `player_redeemed` (`player`,`redeemed`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `donator_plates`;
CREATE TABLE IF NOT EXISTS `donator_plates` (
  `player` varchar(255) NOT NULL,
  `pending` int(11) NOT NULL DEFAULT 0,
  `redeemed` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `donator_vehicles`;
CREATE TABLE IF NOT EXISTS `donator_vehicles` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `player` VARCHAR(255) NOT NULL,
    `class` VARCHAR(50) NOT NULL,
    `redeemed` TINYINT(1) NOT NULL DEFAULT 0,
    `data` LONGTEXT DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `player` (`player`),
    KEY `redeemed` (`redeemed`),
    CONSTRAINT `data` CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `donor_created_item`;
CREATE TABLE IF NOT EXISTS `donor_created_item` (
  `sid` int(11) NOT NULL,
  `item_id` char(50) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  KEY `sid` (`sid`) USING BTREE,
  KEY `item_id` (`item_id`) USING BTREE,
  KEY `siditem` (`sid`,`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `firearms`;
CREATE TABLE IF NOT EXISTS `firearms` (
  `police_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial` char(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `scratched` tinyint(1) NOT NULL DEFAULT 0,
  `purchased` datetime NOT NULL DEFAULT current_timestamp(),
  `model` varchar(128) NOT NULL,
  `item` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `owner_sid` int(11) unsigned DEFAULT NULL,
  `owner_name` varchar(512) DEFAULT NULL,
  `police_filed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`police_id`),
  KEY `owner_sid` (`owner_sid`) USING BTREE,
  KEY `police_filed` (`police_filed`) USING BTREE,
  KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=1956 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `firearms_flags`;
CREATE TABLE IF NOT EXISTS `firearms_flags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial` char(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `type` char(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` longtext NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `author_sid` int(11) unsigned NOT NULL,
  `author_first` varchar(128) NOT NULL,
  `author_last` varchar(128) NOT NULL,
  `author_callsign` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `firearms_projectiles`;
CREATE TABLE IF NOT EXISTS `firearms_projectiles` (
    `Id` VARCHAR(255) NOT NULL,
    `Weapon` LONGTEXT DEFAULT NULL,
    `Coords` LONGTEXT DEFAULT NULL,
    `AmmoType` VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (`Id`),
    CONSTRAINT `Weapon` CHECK (json_valid(`Weapon`)),
    CONSTRAINT `Coords` CHECK (json_valid(`Coords`))
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

DROP TABLE IF EXISTS `meth_tables`;
CREATE TABLE IF NOT EXISTS `meth_tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tier` int(11) NOT NULL DEFAULT 1,
  `created` bigint(20) NOT NULL,
  `cooldown` bigint(20) DEFAULT NULL,
  `recipe` varchar(512) NOT NULL,
  `active_cook` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `moonshine_barrels`;
CREATE TABLE IF NOT EXISTS `moonshine_barrels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quality` int(11) NOT NULL,
  `drinks` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `moonshine_stills`;
CREATE TABLE IF NOT EXISTS `moonshine_stills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `tier` int(11) NOT NULL,
  `cooldown` int(11) DEFAULT NULL,
  `active_cook` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`active_cook`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `peds`;
CREATE TABLE IF NOT EXISTS `peds` (
  `char` varchar(255) NOT NULL,
  `ped` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`char`) USING BTREE,
  CONSTRAINT `ped` CHECK (json_valid(`ped`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `whitelisted_peds`;
CREATE TABLE IF NOT EXISTS `whitelisted_peds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `model` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `placed_meth_tables`;
CREATE TABLE IF NOT EXISTS `placed_meth_tables` (
  `table_id` int(11) NOT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `placed` bigint(20) NOT NULL DEFAULT 0,
  `expires` bigint(20) NOT NULL DEFAULT 0,
  `coords` varchar(255) NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `placed_moonshine_barrels`;
CREATE TABLE IF NOT EXISTS `placed_moonshine_barrels` (
  `barrel_id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `placed` int(11) NOT NULL,
  `ready` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `heading` float NOT NULL,
  `brew_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`brew_data`)),
  PRIMARY KEY (`barrel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `placed_moonshine_stills`;
CREATE TABLE IF NOT EXISTS `placed_moonshine_stills` (
  `still_id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `placed` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `heading` float NOT NULL,
  PRIMARY KEY (`still_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `placed_props`;
CREATE TABLE IF NOT EXISTS `placed_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL DEFAULT '',
  `coords` varchar(255) NOT NULL,
  `rotation` varchar(255) NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `creator` bigint(20) NOT NULL,
  `is_frozen` tinyint(1) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `type` int(11) NOT NULL DEFAULT 0,
  `name_override` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

DROP TABLE IF EXISTS `redline_racer_history`;
CREATE TABLE IF NOT EXISTS `redline_racer_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `placing` int(11) NOT NULL,
  `winnings` text DEFAULT NULL,
  `vehicle` varchar(128) NOT NULL,
  `vehicle_class` varchar(4) NOT NULL,
  `track` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `racer_history_track` (`track`),
  KEY `racer_history` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `redline_race_history`;
CREATE TABLE IF NOT EXISTS `redline_race_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `buyin` int(11) unsigned NOT NULL DEFAULT 0,
  `host` int(11) unsigned NOT NULL,
  `track` int(11) unsigned NOT NULL,
  `class` varchar(4) NOT NULL,
  `racers` longtext NOT NULL DEFAULT '[]',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `race_history_track` (`track`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `redline_tracks`;
CREATE TABLE IF NOT EXISTS `redline_tracks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `distance` varchar(256) NOT NULL,
  `type` varchar(16) NOT NULL,
  `checkpoints` longtext NOT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `redline_track_history`;
CREATE TABLE IF NOT EXISTS `redline_track_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `track` int(11) unsigned NOT NULL,
  `race` int(11) unsigned NOT NULL,
  `sid` int(11) NOT NULL,
  `lap_start` int(11) NOT NULL,
  `lap_end` int(11) NOT NULL,
  `laptime` int(11) NOT NULL,
  `car` varchar(256) NOT NULL,
  `owned` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `track_history_track` (`track`),
  KEY `track_history_race` (`race`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `scenes`;
CREATE TABLE IF NOT EXISTS `scenes` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` text NOT NULL,
  `length` int(11) DEFAULT NULL,
  `expires` bigint(20) DEFAULT NULL,
  `staff` tinyint(1) DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `background` text DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `sequence`;
CREATE TABLE IF NOT EXISTS `sequence` (
  `id` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `sequence` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `shop_bank_accounts`;
CREATE TABLE IF NOT EXISTS `shop_bank_accounts` (
  `shop` int(10) unsigned NOT NULL,
  `bank` int(10) unsigned NOT NULL,
  PRIMARY KEY (`shop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
    `account` VARCHAR(255) NOT NULL,
    `tokens` LONGTEXT DEFAULT NULL,
    PRIMARY KEY (`account`),
    CONSTRAINT `tokens` CHECK (json_valid(`tokens`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `weed`;
CREATE TABLE IF NOT EXISTS `weed` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `is_male` TINYINT(1) NOT NULL,
  `x` DOUBLE NOT NULL,
  `y` DOUBLE NOT NULL,
  `z` DOUBLE NOT NULL,
  `growth` FLOAT NOT NULL DEFAULT 0,
  `output` FLOAT NOT NULL DEFAULT 1,
  `material` INT(11) NOT NULL,
  `planted` INT(11) NOT NULL,
  `water` FLOAT NOT NULL DEFAULT 100,
  `fertilizer_type` VARCHAR(32) DEFAULT NULL,
  `fertilizer_value` FLOAT DEFAULT NULL,
  `fertilizer_time` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

SET FOREIGN_KEY_CHECKS=1;


