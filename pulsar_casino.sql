SET FOREIGN_KEY_CHECKS=0;

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

