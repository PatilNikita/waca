-- Creates the emailtemplate table, changes the closes view to use it, and adds the templates from the previous 
-- system to the emailtemplate table.
DROP VIEW IF EXISTS `closes`;
CREATE TABLE `closes` (
`CONCAT("Closed ",mail_id)` varchar(18)
,`mail_desc` varchar(255)
);
DROP TABLE IF EXISTS `emailtemplate`;
CREATE TABLE `emailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Table key',
  `name` varchar(255) NOT NULL COMMENT 'Name of the Email template',
  `text` blob NOT NULL COMMENT 'Text of the Email template',
  `jsquestion` mediumtext NOT NULL COMMENT 'Question in Javascript popup presented to the user when they attempt to use this template',
  `oncreated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if this template is used for declined requests. 1 if it is used for accepted requests. Default 0',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 if the template should be an available option to users. Default 1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Email templates' AUTO_INCREMENT=8 ;

INSERT INTO `emailtemplate` (`id`, `name`, `text`, `jsquestion`, `oncreated`, `active`) VALUES
(1, 'Created!', 'Many thanks for your interest in joining Wikipedia. I''ve gone ahead and created the account for you. You will receive a separate automated e-mail from wiki@wikimedia.org with your login credentials. You can use these to log in for the first time, when you will be prompted to create a new password.\r\n\r\nWhen you have successfully logged in, you may find the &quot;getting started&quot; section of our help pages useful (http://en.wikipedia.org/wiki/Help:Contents/Getting_started). Of particular interest may be the introduction to Wikipedia (http://en.wikipedia.org/wiki/Wikipedia:Introduction) which has some information to help you get up to speed with the way things work on the encyclopedia.\r\n\r\nOne useful hint: when you have logged in for the first time and created your own password, go to your preferences (the link for them is right at the top of the screen), and ensure your email address is set where indicated. Should you forget your password, then this will allow you to have a new one sent to you!\r\n\r\nI wish you all the best and hope you enjoy your time on Wikipedia.\r\n\r\n*If you did not make this request, please ignore this email. If you wish to report this, please send an email to accounts-enwiki-l@lists.wikimedia.org with a copy of the original email.*', 'Are you sure that you want to create?', 1, 1),
(2, 'Too Similar', 'Many thanks for your interest in joining Wikipedia. Unfortunately the username that you have requested is too similar to an active account, which may make it difficult for other contributors to distinguish you from the other user.\r\n\r\nPlease take a look at our username policy (http://en.wikipedia.org/wiki/Wikipedia:Username_policy) and choose a different username. You may be able to create the account with the new name you have chosen yourself at http://en.wikipedia.org/w/index.php?title=Special:Userlogin&amp;type=signup. If so, I wish you all the best and hope you enjoy your time on Wikipedia.\r\n\r\nIf you are still unable to create the name yourself, we will gladly process your new request here, and I look forward to hearing from you again with your new choice of username.\r\n\r\n*If you did not make this request, please ignore this email. If you wish to report this, please send an email to accounts-enwiki-l@lists.wikimedia.org with a copy of the original email.*', 'This action will send an email to the user. Are you sure that there is a conflict?', 0, 1),
(3, 'Taken', 'Many thanks for your interest in joining Wikipedia.  Unfortunately the username that you have requested is already taken.  Please choose another username (unless you had created the account yourself after requesting it).  After you have chosen another username, you may be able to create the account with the new name you have chosen yourself at http://en.wikipedia.org/w/index.php?title=Special:Userlogin&amp;type=signup. If so, I wish you all the best and hope you enjoy your time on Wikipedia. If you are still unable to create the account yourself, we will gladly process your new request here, so feel free to submit another request.\r\n\r\n*If you did not make this request, please ignore this email. If you wish to report this, please send an email to accounts-enwiki-l@lists.wikimedia.org with a copy of the original email.*', 'his action will send an email to the user. Have you checked that the account is already taken?', 0, 1),
(4, 'UPolicy', 'Many thanks for your interest in joining Wikipedia. Unfortunately the username that you have requested does not comply with our username policy, and so I am unable to create this account for you.\r\n\r\nPlease take a look at our username policy (http://en.wikipedia.org/wiki/Wikipedia:Username_policy) and choose a different username. You may be able to create the account with the new name you have chosen yourself at http://en.wikipedia.org/w/index.php?title=Special:Userlogin&amp;type=signup. If so, I wish you all the best and hope you enjoy your time on Wikipedia.\r\n\r\nIf you are still unable to create the name yourself, we will gladly process your new request here, and I look forward to hearing from you again with your new choice of username.\r\n\r\n*If you did not make this request, please ignore this email. If you wish to report this, please send an email to accounts-enwiki-l@lists.wikimedia.org with a copy of the original email.*', 'This action will send an email to the user. Are you sure that this request is a violation? Please read [[WP:UPOL]] completely before deciding.', 0, 1),
(5, 'Invalid', 'Many thanks for your interest in joining Wikipedia. Unfortunately we are unable to process your request due to technical restrictions on usernames.\r\n\r\nPlease bear in mind that it is not possible to create usernames containing any of the characters # / | [ ] { } &lt; &gt; @ % : , consisting only of numbers, or ending with an underscore ( _ ) or a space.\r\n\r\nPlease choose a username which does not contain any of these characters and then you can create an account by visiting http://en.wikipedia.org/wiki/Special:UserLogin/signup\r\n\r\n*If you did not make this request, please ignore this email. If you wish to report this, please send an email to accounts-enwiki-l@lists.wikimedia.org with a copy of the original email.*', 'This action will send an email to the user. Are you sure that the requested username is invalid?', 0, 1),
(6, 'SUL Taken', 'Many thanks for your interest in joining Wikipedia.  Unfortunately the username that you have requested is already a part of a single user login (SUL) account, meaning that someone else has reserved that name through another one of our websites.\r\n\r\nPlease choose another username (unless you had created the account yourself after requesting it), or look at http://meta.wikimedia.org/wiki/Help:Unified_login for more information on SUL.  After you have chosen another username, you may be able to create the account yourself at http://en.wikipedia.org/w/index.php?title=Special:Userlogin&amp;type=signup. If so, I wish you all the best and hope you enjoy your time on Wikipedia. If you are still unable to create the account yourself, we will gladly process your new request here, so feel free to submit another request.\r\n\r\n*If you did not make this request, please ignore this email. If you wish to report this, please send an email to accounts-enwiki-l@lists.wikimedia.org with a copy of the original email.*', 'This action will send an email to the user. Have you checked that the account is already taken?', 0, 1),
(7, 'Password Reset', 'Thank you for your interest in joining the English Wikipedia. At this time, we have not created your account as there are similar usernames that already exist on Wikipedia.\r\n\r\nWe have sent password reset emails to them in case you may have forgotten your password. If you do not receive any emails with a temporary password reset, it is possible that you do not own these accounts.\r\n\r\nIf that is so, please email us back and let us know.\r\n\r\n*If you did not make this request, please ignore this email. If you wish to report this, please send an email to accounts-enwiki-l@lists.wikimedia.org with a copy of the original email.*', 'This action will send an email to the user. Are you sure that the requester owned the original reset account?', 0, 1);
DROP TABLE IF EXISTS `closes`;

CREATE ALGORITHM=UNDEFINED DEFINER=current_user SQL SECURITY INVOKER VIEW `closes` AS select concat('Closed ',cast(`emailtemplate`.`id` AS char)) AS `CONCAT("Closed ",mail_id)`,`emailtemplate`.`name` AS `mail_desc` from `emailtemplate` union select 'Closed 0' AS `Closed 0`,'Dropped' AS `Dropped` union select 'Closed custom' AS `Closed custom`,'Closed custom' AS `Closed custom` union select 'Closed custom-n' AS `Closed custom-n`,'Closed custom - Not created' AS `Closed custom - Not created` union select 'Closed custom-y' AS `Closed custom-y`,'Closed custom - Created' AS `Closed custom - Created`;
