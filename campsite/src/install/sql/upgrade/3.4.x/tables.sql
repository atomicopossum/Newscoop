-- Create table for template cache db handler
CREATE TABLE IF NOT EXISTS `Cache` (
  `language` int(11) default NULL,
  `publication` int(11) default NULL,
  `issue` int(11) default NULL,
  `section` int(11) default NULL,
  `article` int(11) default NULL,
  `params` varchar(128) default NULL,
  `template` varchar(128) NOT NULL,
  `expired` int(11) NOT NULL,
  `content` mediumtext,
  UNIQUE KEY `index` (`language`,`publication`,`issue`,`section`,`article`,`params`,`template`),
  KEY `expired` (`expired`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Add CacheLifetime column for template cache handler
ALTER TABLE `Templates` ADD `CacheLifetime` INT NULL DEFAULT '0';


ALTER TABLE `Authors` ADD `type` INT NULL ,
ADD `skype` VARCHAR( 255 ) NULL ,
ADD `jabber` VARCHAR( 255 ) NULL ,
ADD `aim` VARCHAR( 255 ) NULL ,
ADD `biography` TEXT NULL ,
ADD `image` INT NULL;
DROP TABLE IF EXISTS `Authorsaliases`;
CREATE TABLE `Authorsaliases` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`IdAuthor` INT NOT NULL ,
`alias` VARCHAR( 255 ) NOT NULL
) ENGINE = MYISAM ;
DROP TABLE IF EXISTS `Authorbiography`;
CREATE TABLE `Authorbiography` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`IdAuthor` INT NOT NULL ,
`IdLanguage` INT NOT NULL ,
`biography` TEXT NOT NULL,
`first_name` VARCHAR( 255 ) NULL ,
`last_name` VARCHAR( 255 ) NULL
) ENGINE = MYISAM ;


ALTER TABLE `ArticleAuthors` CHANGE `fk_article_number` `fk_article_number` INT( 10 ) UNSIGNED NULL ,
CHANGE `fk_language_id` `fk_language_id` INT( 10 ) UNSIGNED NULL ,
CHANGE `fk_author_id` `fk_author_id` INT( 10 ) UNSIGNED NULL,
ADD `fk_type_id` INT NULL ;

CREATE TABLE `AuthorsTypes` (
`id` INT NULL AUTO_INCREMENT PRIMARY KEY ,
`type` VARCHAR( 255 ) NULL
) ENGINE = MYISAM ;
CREATE TABLE `AuthorsAuthorsTypes` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`fk_author_id` INT NOT NULL ,
`fk_type_id` INT NOT NULL
) ENGINE = MYISAM ;

ALTER TABLE `liveuser_users` ADD COLUMN `password_reset_token` VARCHAR(85) NULL  AFTER `isActive` ;


ALTER TABLE Images ADD FULLTEXT(Description);
ALTER TABLE Images ADD FULLTEXT(Photographer);
ALTER TABLE Images ADD FULLTEXT(Place);
ALTER TABLE Images ADD FULLTEXT(Caption);
