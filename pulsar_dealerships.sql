SET FOREIGN_KEY_CHECKS=0;

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

