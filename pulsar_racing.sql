SET FOREIGN_KEY_CHECKS=0;

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

CREATE TABLE IF NOT EXISTS `blueline_tracks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `distance` varchar(256) NOT NULL,
  `type` varchar(16) NOT NULL,
  `checkpoints` longtext NOT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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

CREATE TABLE IF NOT EXISTS `redline_tracks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `distance` varchar(256) NOT NULL,
  `type` varchar(16) NOT NULL,
  `checkpoints` longtext NOT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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

