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

