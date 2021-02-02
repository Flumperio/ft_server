-- --------------------------------------------------------
-- SQL Commands to set up the juasantodb as described in the documentation.
--
-- This file is meant for use with MySQL 5 and above!
--
-- This script expects the user juasanto to already be existing. If we would put a
-- line here to create him too many users might just use this script and end
-- up with having the same password for the controluser.
--
-- This user "juasanto" must be defined in config.inc.php (controluser/controlpass)
--
-- Please don't forget to set up the tablenames in config.inc.php
--

-- --------------------------------------------------------

--
-- Database : `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress`
  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE wordpress;

-- --------------------------------------------------------

-- Privileges
--
-- (activate this statement if necessary)
-- Crear Usuario juasanto en WordPRESS
CREATE USER 'juasanto'@'localhost' IDENTIFIED BY 'juasantopass';

GRANT ALL PRIVILEGES ON `wordpress`.* TO
  'juasanto'@localhost;
-- --------------------------------------------------------
