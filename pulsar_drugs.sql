SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS `bench_schematics` (
  `bench` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `schematic` char(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  KEY `bench` (`bench`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `character_schematics` (
  `sid` int(11) DEFAULT NULL,
  `bench` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `schematic` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  KEY `sid` (`sid`,`bench`),
  KEY `schematic` (`schematic`,`bench`,`sid`),
  KEY `sid_schem` (`sid`,`schematic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `crafting_cooldowns` (
  `bench` varchar(64) NOT NULL,
  `id` varchar(64) NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `meth_tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tier` int(11) NOT NULL DEFAULT 1,
  `created` bigint(20) NOT NULL,
  `cooldown` bigint(20) DEFAULT NULL,
  `recipe` varchar(512) NOT NULL,
  `active_cook` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `moonshine_barrels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quality` int(11) NOT NULL,
  `drinks` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `moonshine_stills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `tier` int(11) NOT NULL,
  `cooldown` int(11) DEFAULT NULL,
  `active_cook` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`active_cook`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `placed_meth_tables` (
  `table_id` int(11) NOT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `placed` bigint(20) NOT NULL DEFAULT 0,
  `expires` bigint(20) NOT NULL DEFAULT 0,
  `coords` varchar(255) NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

CREATE TABLE IF NOT EXISTS `placed_moonshine_stills` (
  `still_id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `placed` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `heading` float NOT NULL,
  PRIMARY KEY (`still_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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


