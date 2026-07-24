SET FOREIGN_KEY_CHECKS=0;

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

CREATE TABLE IF NOT EXISTS `character_chatter_groups` (
  `sid` bigint(20) unsigned NOT NULL,
  `chatty_group` bigint(20) unsigned NOT NULL,
  `joined_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sid`,`chatty_group`) USING BTREE,
  KEY `chatter_char_group` (`chatty_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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

CREATE TABLE IF NOT EXISTS `character_documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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

CREATE TABLE IF NOT EXISTS `character_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) NOT NULL,
  `image_url` text NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `chatter_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL DEFAULT 'Chatter Group',
  `icon` varchar(1024) DEFAULT NULL,
  `owner` bigint(20) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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

