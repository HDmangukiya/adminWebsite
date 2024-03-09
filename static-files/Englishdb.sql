/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`my_blog_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `my_blog_db`;

/*Table structure for table `generator_test` */

DROP TABLE IF EXISTS `generator_test`;

CREATE TABLE `generator_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `test` varchar(100) NOT NULL COMMENT 'test field',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `generator_test` */

/*Table structure for table `jdbc_test` */

DROP TABLE IF EXISTS `jdbc_test`;

CREATE TABLE `jdbc_test` (
  `type` varchar(100) DEFAULT NULL COMMENT 'type',
  `name` varchar(100) DEFAULT NULL COMMENT 'name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jdbc_test` */

insert  into `jdbc_test`(`type`,`name`) values ('com.zaxxer.hikari.HikariDataSource','hikari data source');
insert  into `jdbc_test`(`type`,`name`) values ('org.apache.commons.dbcp2.BasicDataSource','dbcp2 data source');
insert  into `jdbc_test`(`type`,`name`) values ('test','test class');
insert  into `jdbc_test`(`type`,`name`) values ('type2','test class2');

/*Table structure for table `tb_admin_user` */

DROP TABLE IF EXISTS `tb_admin_user`;

CREATE TABLE `tb_admin_user` (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'admin id',
  `login_user_name` varchar(50) NOT NULL COMMENT 'admin login name',
  `login_password` varchar(50) NOT NULL COMMENT 'admin login password',
  `nick_name` varchar(50) NOT NULL COMMENT 'admin display nickname',
  `locked` tinyint(4) DEFAULT '0' COMMENT '0-not locked 1-locked cannot login',
  PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_admin_user` */

insert  into `tb_admin_user`(`admin_user_id`,`login_user_name`,`login_password`,`nick_name`,`locked`) values (1,'admin','e10adc3949ba59abbe56e057f20f883e','Hardik Mangukiya',0);

/*Table structure for table `tb_blog` */

DROP TABLE IF EXISTS `tb_blog`;

CREATE TABLE `tb_blog` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key id of blog table',
  `blog_title` varchar(200) NOT NULL COMMENT 'blog title',
  `blog_sub_url` varchar(200) NOT NULL COMMENT 'custom url of blog',
  `blog_cover_image` varchar(200) NOT NULL COMMENT 'blog cover image',
  `blog_content` mediumtext NOT NULL COMMENT 'blog content',
  `blog_category_id` int(11) NOT NULL COMMENT 'blog category id',
  `blog_category_name` varchar(50) NOT NULL COMMENT 'blog category (redundant field)',
  `blog_tags` varchar(200) NOT NULL COMMENT 'blog tags',
  `blog_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-draft 1-published',
  `blog_views` bigint(20) NOT NULL DEFAULT '0' COMMENT 'views count',
  `enable_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-allow comments 1-do not allow comments',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=no 1=yes',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation time',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'modification time',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Data for the table `tb_blog` */
INSERT INTO `tb_blog`(`blog_id`,`blog_title`,`blog_sub_url`,`blog_cover_image`,`blog_content`,`blog_category_id`,`blog_category_name`,`blog_tags`,`blog_status`,`blog_views`,`enable_comment`,`is_deleted`,`create_time`,`update_time`)
VALUES
(1,'I am Hardik Mangukiya','about','/admin/dist/img/rand/33.jpg','## About me\n\nI am Hardik Mangukiya, a Java developer. My technical skills are average, and my experiences are ordinary. However, I have always been eager to progress and strive to live a fulfilling life. I hope to continuously engage in activities I enjoy and share insights and superficial experiences in my spare time. When I am too old to do so, I will say that the story has been told, without expecting perfection.\n\nIf you are reading this, you probably know that learning is an extremely tedious and boring process, sometimes even feeling helpless. I also want to tell you that growth is a harsh reality. Any success does not come overnight; it requires perseverance, dedication, and your resilience. Short-term gains may not be visible because it takes time for a caterpillar to become a butterfly.\n\n## Contact\n\n- My email: hardik.mangukiya.003@gmail.com\n- QQ Technical Communication groups: 796794009\n- My website: http://13blog.site\n\n## Quote\n\n- Steve Jobs\n\n> Stay hungry, Stay foolish\n\n- Kahlil Gibran\n\n> The first time when I saw her being meek that she might attain height.<br>\nThe second time when I saw her limping before the crippled.<br>\nThe third time when she was given to choose between the hard and the easy, and she chose the easy.<br>\nThe fourth time when she committed a wrong, and comforted herself that others also commit wrong.<br>\nThe fifth time when she forbore for weakness, and attributed her patience to strength.<br>\nThe sixth time when she despised the ugliness of a face, and knew not that it was one of her own masks.<br>\nAnd the seventh time when she sang a song of praise, and deemed it a virtue.',20,'About','There is someone very lovely in the world, and that person is reading this sentence right now',1,219,0,0,'2017-03-12 00:31:15','2018-11-12 00:31:15'),
(2,'Introduction to AI','intro-ai','/admin/dist/img/rand/22.jpg','## Introduction to Artificial Intelligence\n\nArtificial Intelligence (AI) is revolutionizing the way we interact with technology. It enables machines to learn from experience, adapt to new inputs, and perform tasks like humans. From virtual assistants to self-driving cars, AI is increasingly becoming a part of our daily lives.\n\n### Key Concepts\n\n- Machine Learning: A subset of AI that enables machines to learn from data without being explicitly programmed.\n- Neural Networks: Algorithms inspired by the structure and function of the human brain, used in deep learning.\n- Natural Language Processing (NLP): AI techniques for understanding and generating human language.\n\n### Applications\n\n- Healthcare: AI is used to analyze medical data, assist in diagnostics, and personalize treatment plans.\n- Finance: AI algorithms are employed for fraud detection, risk management, and algorithmic trading.\n- Autonomous Vehicles: Self-driving cars use AI to perceive their environment and make driving decisions.\n\n### Challenges\n\nWhile AI holds immense potential, it also poses ethical and societal challenges. Issues such as bias in algorithms, job displacement, and privacy concerns need to be addressed as AI continues to advance.\n\n### Conclusion\n\nArtificial Intelligence is a powerful tool that has the potential to transform industries and improve lives. By understanding its capabilities and limitations, we can harness the benefits of AI while mitigating its risks.',21,'Technology','Artificial Intelligence, AI, Machine Learning, Neural Networks, NLP',1,543,1,0,'2019-05-20 08:15:30','2019-05-20 08:15:30'),
(3,'Exploring Blockchain','blockchain','/admin/dist/img/rand/45.jpg','## Exploring Blockchain Technology\n\nBlockchain is a decentralized, distributed ledger technology that underpins cryptocurrencies like Bitcoin. It enables secure, transparent, and immutable record-keeping, making it suitable for a wide range of applications beyond finance.\n\n### How Blockchain Works\n\n- Distributed Ledger: Transactions are recorded across multiple nodes, creating a shared database that is accessible to all participants.\n- Consensus Mechanism: Nodes must agree on the validity of transactions through mechanisms like Proof of Work or Proof of Stake.\n- Cryptography: Transactions are encrypted and linked together to form a chain of blocks, ensuring tamper-resistance.\n\n### Use Cases\n\n- Supply Chain Management: Blockchain can track the provenance and authenticity of goods throughout the supply chain, reducing counterfeiting and improving transparency.\n- Digital Identity: Blockchain-based identity systems offer individuals greater control over their personal data and reduce the risk of identity theft.\n- Smart Contracts: Self-executing contracts coded on the blockchain automate agreement enforcement, reducing the need for intermediaries.\n\n### Challenges\n\nScalability, interoperability, and regulatory compliance are among the challenges facing widespread blockchain adoption. Addressing these issues will be crucial for unlocking the full potential of blockchain technology.\n\n### Conclusion\n\nBlockchain has the potential to revolutionize industries by enhancing trust, transparency, and efficiency. As organizations explore its capabilities, collaboration and innovation will drive the evolution of blockchain applications.',22,'Blockchain','Blockchain, Cryptocurrency, Bitcoin, Distributed Ledger, Smart Contracts',1,732,1,0,'2020-09-10 11:45:20','2020-09-10 11:45:20'),
(4,'Guide to Python','python-guide','/admin/dist/img/rand/12.jpg','## Beginner\'s Guide to Python Programming\n\nPython is a versatile programming language known for its simplicity and readability. Whether you\'re a beginner or an experienced developer, Python offers a wide range of applications, from web development to data analysis.\n\n### Getting Started\n\n- Installation: Python can be installed on Windows, macOS, and Linux platforms. You can download the latest version from the official Python website.\n- Integrated Development Environments (IDEs): IDEs like PyCharm, VS Code, and Jupyter Notebook provide a convenient environment for writing and executing Python code.',23,'Programming','Python, Programming, Beginner\'s Guide, Development',1,651,1,0,'2021-02-15 09:30:45','2021-02-15 09:30:45'),
(5,'Data Science Essentials','data-science','/admin/dist/img/rand/78.jpg','## Essential Concepts in Data Science\n\nData Science is an interdisciplinary field that uses scientific methods, algorithms, and systems to extract knowledge and insights from structured and unstructured data. It encompasses a variety of techniques, including statistics, machine learning, and data visualization, to uncover patterns, make predictions, and drive decision-making.\n\n### Core Concepts\n\n- Data Collection: Gathering raw data from various sources, including databases, files, and sensors.\n- Data Cleaning: Preprocessing and transforming raw data to remove errors, inconsistencies, and missing values.\n- Exploratory Data Analysis (EDA): Analyzing and visualizing data to understand its structure, relationships, and distributions.\n\n### Tools and Technologies\n\n- Programming Languages: Python and R are widely used for data manipulation, analysis, and visualization.\n- Machine Learning Libraries: Frameworks like scikit-learn, TensorFlow, and PyTorch provide tools for building and deploying machine learning models.\n- Data Visualization Tools: Platforms like Tableau, Matplotlib, and Seaborn help create interactive visualizations to communicate insights effectively.\n\n### Applications\n\n- Predictive Analytics: Forecasting future trends and behaviors based on historical data to support decision-making.\n- Recommendation Systems: Personalizing product recommendations and content suggestions for users based on their preferences and behavior.\n- Fraud Detection: Identifying suspicious activities and anomalies in financial transactions to prevent fraudulent behavior.\n\n### Challenges and Opportunities\n\nData Privacy, ethical considerations, and the interpretability of machine learning models are among the key challenges facing the field of Data Science. However, as organizations continue to invest in data-driven strategies, there are ample opportunities for skilled professionals to make a meaningful impact.\n\n### Conclusion\n\nData Science plays a crucial role in today\'s data-driven world, enabling organizations to derive actionable insights and drive innovation. By mastering essential concepts and staying abreast of emerging technologies, individuals can unlock exciting career opportunities in this dynamic field.',24,'Data Science','Data Science, Machine Learning, Data Analysis, Python, R, Data Visualization',1,876,1,0,'2022-01-20 13:55:10','2022-01-20 13:55:10');


/*Table structure for table `tb_blog_category` */

DROP TABLE IF EXISTS `tb_blog_category`;

CREATE TABLE `tb_blog_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key of the category table',
  `category_name` varchar(50) NOT NULL COMMENT 'Name of the category',
  `category_icon` varchar(50) NOT NULL COMMENT 'Icon of the category',
  `category_rank` int(11) NOT NULL DEFAULT '1' COMMENT 'Sort order of the category. The more it is used, the larger the value',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether deleted 0=no 1=yes',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_category` */

insert  into `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) values (20,'About','/admin/dist/img/category/10.png',8,0,'2018-11-12 00:28:49');
insert  into `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) values (22,'Advanced SSM Integration','/admin/dist/img/category/02.png',19,0,'2018-11-12 10:42:25');
insert  into `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) values (24,'Daily Essays','/admin/dist/img/category/06.png',22,0,'2018-11-12 10:43:21');

/*Table structure for table `tb_blog_comment` */

DROP TABLE IF EXISTS `tb_blog_comment`;

CREATE TABLE `tb_blog_comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary key id',
  `blog_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Associated blog primary key',
  `commentator` varchar(50) NOT NULL DEFAULT '' COMMENT 'Commenter name',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT 'Commenter email',
  `website_url` varchar(50) NOT NULL DEFAULT '' COMMENT 'Website URL',
  `comment_body` varchar(200) NOT NULL DEFAULT '' COMMENT 'Comment content',
  `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Comment submission time',
  `commentator_ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'IP address at the time of commenting',
  `reply_body` varchar(200) NOT NULL DEFAULT '' COMMENT 'Reply content',
  `reply_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Reply time',
  `comment_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether approved 0=not approved 1=approved',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT 'Whether deleted 0=not deleted 1=deleted',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_comment` */

insert  into `tb_blog_comment`(`comment_id`,`blog_id`,`commentator`,`email`,`website_url`,`comment_body`,`comment_create_time`,`commentator_ip`,`reply_body`,`reply_create_time`,`comment_status`,`is_deleted`) values (26,4,'Hardik Mangukiya','224683568@qq.com','','First comment','2019-05-13 10:12:19','','','2019-05-12 21:13:31',1,0);

/*Table structure for table `tb_blog_tag` */

DROP TABLE IF EXISTS `tb_blog_tag`;

CREATE TABLE `tb_blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key id of the tag table',
  `tag_name` varchar(100) NOT NULL COMMENT 'Tag name',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether deleted 0=no 1=yes',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_tag` */

insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (57,'There is a lovely person in the world',0,'2018-11-12 00:31:15');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (58,'Now this person is reading this sentence',0,'2018-11-12 00:31:15');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (66,'Spring',0,'2018-11-12 10:55:14');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (67,'SpringMVC',0,'2018-11-12 10:55:14');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (68,'MyBatis',0,'2018-11-12 10:55:14');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (69,'easyUI',0,'2018-11-12 10:55:14');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (127,'Table of contents',0,'2019-04-24 15:41:39');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (128,'AdminLte3',0,'2019-04-24 15:46:16');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (130,'SpringBoot',0,'2019-05-13 09:58:54');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (131,'Getting started tutorial',0,'2019-05-13 09:58:54');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (132,'Practical tutorial',0,'2019-05-13 09:58:54');
insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (133,'Enterprise-level development with spring-boot',0,'2019-05-13 09:58:54');

/*Table structure for table `tb_blog_tag_relation` */

DROP TABLE IF EXISTS `tb_blog_tag_relation`;

CREATE TABLE `tb_blog_tag_relation` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Relation table id',
  `blog_id` bigint(20) NOT NULL COMMENT 'Blog id',
`tag_id` int(11) NOT NULL COMMENT 'Tag id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Addition time',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_tag_relation` */

insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (266,1,57,'2019-05-13 09:45:42');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (267,1,58,'2019-05-13 09:45:42');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (269,2,127,'2019-05-13 09:56:49');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (270,4,130,'2019-05-13 09:58:54');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (271,4,131,'2019-05-13 09:58:54');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (272,4,132,'2019-05-13 09:58:54');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (273,4,133,'2019-05-13 09:58:54');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (274,3,66,'2019-05-13 10:07:27');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (275,3,67,'2019-05-13 10:07:27');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (276,3,68,'2019-05-13 10:07:27');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (277,3,69,'2019-05-13 10:07:27');
insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (278,3,128,'2019-05-13 10:07:27');

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Name of the configuration item',
  `config_value` varchar(200) NOT NULL DEFAULT '' COMMENT 'Value of the configuration item',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Modification time',
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_config` */

insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerAbout','your Personal Blog. have fun.','2018-11-11 20:33:23','2018-11-12 11:58:06');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerCopyRight','2019 Hardik Mangukiya','2018-11-11 20:33:31','2018-11-12 11:58:06');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerICP','Zhejiang ICP No. 17008806-3','2018-11-11 20:33:27','2018-11-12 11:58:06');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerPoweredBy','https://github.com/ZHENFENG13','2018-11-11 20:33:36','2018-11-12 11:58:06');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerPoweredByURL','https://github.com/ZHENFENG13','2018-11-11 20:33:39','2018-11-12 11:58:06');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('websiteDescription','Personal Blog is a Personal Blog website built with SpringBoot2+Thymeleaf+Mybatis. SpringBoot practical blog source code. Personal Blog construction','2018-11-11 20:33:04','2018-11-11 22:05:14');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('websiteIcon','/admin/dist/img/favicon.png','2018-11-11 20:33:11','2018-11-11 22:05:14');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('websiteLogo','/admin/dist/img/logo2.png','2018-11-11 20:33:08','2018-11-11 22:05:14');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('websiteName','Personal Blog','2018-11-11 20:33:01','2018-11-11 22:05:14');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('yourAvatar','/admin/dist/img/13.png','2018-11-11 20:33:14','2019-05-07 21:56:23');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('yourEmail','hardik.mangukiya.003@gmail.com','2018-11-11 20:33:17','2019-05-07 21:56:23');
insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('yourName','13','2018-11-11 20:33:20','2019-05-07 21:56:23');

/*Table structure for table `tb_link` */

DROP TABLE IF EXISTS `tb_link`;

CREATE TABLE `tb_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key ID of the link list',
  `link_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Friend chains category 0-Friend chains 1-Recommendation 2-Personal website',
  `link_name` varchar(50) NOT NULL COMMENT 'Website name',
  `link_url` varchar(100) NOT NULL COMMENT 'Website link',
  `link_description` varchar(100) NOT NULL COMMENT 'Website description',
  `link_rank` int(11) NOT NULL DEFAULT '0' COMMENT 'Used for list sorting',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether deleted 0-Not deleted 1-Deleted',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Addition time',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_link` */

insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (1,0,'tqr','rqwe','rqw',0,1,'2018-10-22 18:57:52');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (2,2,'Hardik Mangukiya GitHub','https://github.com/ZHENFENG13','Hardik Mangukiya place to share code',1,0,'2018-10-22 19:41:04');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (3,2,'Hardik Mangukiya Blog','http://13blog.site','Personal independent blog 13blog',14,0,'2018-10-22 19:53:34');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (4,1,'CSDN Graphic Class','https://gitchat.csdn.net','High-quality content platform for IT',6,0,'2018-10-22 19:55:55');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (5,2,'Hardik Mangukiya Blog Park','https://www.cnblogs.com/han-1034683568','The place where I started blogging',17,0,'2018-10-22 19:56:14');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (6,1,'CSDN','https://www.csdn.net/','CSDN-Professional IT technology community official website',4,0,'2018-10-22 19:56:47');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (7,0,'Liang Guizhao Blog','http://blog.720ui.com','Backend siege lion',1,0,'2018-10-22 20:01:38');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (8,0,'Ape World','http://cxytiandi.com','A comprehensive website, mainly for programmer users, providing various development-related content',12,0,'2018-10-22 20:02:41');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (9,0,'Giraffe Home','https://yemengying.com/','Giraffe Home',0,0,'2018-10-22 20:27:04');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (10,0,'Pure Smile','http://www.ityouknow.com','Share technology, share life',3,0,'2018-10-22 20:27:16');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (11,0,'afsdf','http://localhost:28080/admin/links','fad',0,1,'2018-10-22 20:27:26');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (12,1,'afsdf','http://localhost','fad1',0,1,'2018-10-24 14:04:18');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (13,0,'Guo Zhaohui','http://guozh.net/','Lao Guo San Di',0,0,'2019-04-24 15:30:19');
insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (14,0,'dalaoyang','http://dalaoyang.cn/','Algorithm and data structure tutorial blog',0,0,'2019-04-24 15:31:20');


/*Table structure for table `tb_test` */

DROP TABLE IF EXISTS `tb_test`;

CREATE TABLE `tb_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `test_info` varchar(50) NOT NULL COMMENT '测试内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_test` */

insert  into `tb_test`(`id`,`test_info`) values (1,'SpringBoot-MyBatis测试');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
