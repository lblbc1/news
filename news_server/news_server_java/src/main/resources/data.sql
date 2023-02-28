CREATE TABLE `news_category` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `news_category` (`id`, `name`)
VALUES
	('1','推荐'),
	('2','科技'),
	('3','视频'),
	('4','财经'),
	('5','热点'),
	('6','国际'),
	('7','美食'),
	('8','军事'),
	('9','体育'),
	('10','娱乐');

CREATE TABLE `news_news` (
  `id` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `img_url` varchar(200) ,
  `author` varchar(500),
  `link` varchar(500),
  `comment_count` int,
  `publish_time` bigint,
  PRIMARY KEY (`id`)
);

INSERT INTO `news_news` (`id`, `title`, `img_url`, `author`, `comment_count`, `link`, `publish_time`)
VALUES
	('1','在家自制糖葫芦！不用费力熬糖，一口嘎嘣脆，开胃又美味','https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/TSQ3ojzGbrXWO4~tplv-tt-cs0:640:360.jpg?_iz=31826&from=feed&x-expires=1678803420&x-signature=sO%2BR%2Fo9rt8bs%2F%2F9zi05sMsfjUgI%3D','光明网',20,'https://www.toutiao.com/article/7186526756885496332',1677545601520),
	('2','中国航母数量要猛增！从海军招飞政策大变，就能看出来','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/896dab62b3d243838ab0022d55f8f1a0~tplv-tt-cs0:1000:666.jpg?_iz=31826&from=feed&x-expires=1678803420&x-signature=DF1mE8n4yG4ZeywvgwLSwSbxQ3c%3D','利刃号',30,'https://www.toutiao.com/article/7203284876672713248',1677545601520),
	('3','KJ600舰载预警机至少需要量产60架？','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/280d32f2e8fa4dcaa417b89d105ce7f1~noop.image?_iz=58558&from=article.pc_detail&x-expires=1678112580&x-signature=OUuFkYxwJzuYmj8MVgO57UDQhU4%3D','匈奴狼山',5,'https://www.toutiao.com/article/7204811185890542119',1677545601520),
	('4','如何debug一个正在运行的go进程','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/18d5d81c26644d86a6f173d831b61c47~noop.image?_iz=58558&from=article.pc_detail&x-expires=1678112643&x-signature=5IaMcziSLLdZVFI9vXi5ze%2B0898%3D','SuperOps',6,'https://www.toutiao.com/article/7204667855978693178',1677545601520),
	('5','“双985+双注”大佬：垃圾设计，毁我一生！','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/6be94144627b4427bd5e2c50fd3e5372~noop.image?_iz=58558&from=article.pc_detail&x-expires=1678112689&x-signature=7RTbXpcU36ztegjuCssTcrXhEMo%3D','迟英',5,'https://www.toutiao.com/article/7204668921067340323',1677545601520),
	('6','江苏南京一中学3男孩课间操跳出男团既视感，网友：建议原地出道','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/8caa7c9c52634bd5aa8eafa81b035a90~tplv-tt-cs0:640:360.jpg?_iz=31826&from=feed&x-expires=1678803926&x-signature=%2Bk%2F2hGMEdyRgj57z7f742xPOw5w%3D','中原网',69,'https://www.toutiao.com/article/7204697838926987809/',1677545601520),
	('7','成都警方通报：全力抓捕！','https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/TX4CKMvEIHsEpO~noop.image?_iz=58558&from=article.pc_detail&x-expires=1678112812&x-signature=5fM7UTnJ7uI7I3V8dc6nzO6%2Bi%2BM%3D','光明网',44,'https://www.toutiao.com/article/7204813067124179490/',1677545601520),
	('8','下午18点！中国足协正式官宣，24人国足名单出炉，李铁嫡系全开除','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/0c17da15996e43e187ee7bddb803757e~noop.image?_iz=58558&from=article.pc_detail&x-expires=1678112846&x-signature=lW3emM1wYCzMoxeyvZ6YmYfM%2FNM%3D','花县仔体育汇',43,'https://www.toutiao.com/article/7204779292331442703/',1677545601520),
	('9','多家美企看好中国市场继续扩大在华业务','https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/SibQols6AL0wbv~noop.image?_iz=58558&from=article.pc_detail&x-expires=1678112915&x-signature=b0jKugVZmJi86N%2B1jLggkdP%2FoHo%3D','北青网',32,'https://www.toutiao.com/article/7204820959491162639/',1677545601520),
	('10','高并发系统设计的 15 个锦囊妙招','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/91d79e5e2fdb4dc5892ad846953169b0~noop.image?_iz=58558&from=article.pc_detail&x-expires=1678112964&x-signature=64INvPGZ7Gzta4K3HYWRGOo5RHw%3D','dbaplus社群',34,'https://www.toutiao.com/article/7204653550830895650/',1677545601520),
    ('11','3.6万公里之外的隔空传电，太空三峡工程，发电效率超越地球十倍','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/fb1ba03d731543e6b3caf46ea8a95e24~noop.image?_iz=58558&from=article.pc_detail&x-expires=1678113020&x-signature=wAHm4DAr6WIjxXfXO3nP%2BRMH6Q8%3D','求知百科',45,'https://www.toutiao.com/article/7174327481661669928/',1677545601520),
    ('12','一名IT程序员的转行历程','https://p3-sign.toutiaoimg.com/tos-cn-i-qvj2lq49k0/6d50189f181c4b6fae8827bcff12122a~tplv-tt-cs0:640:360.jpg?_iz=31826&from=feed&x-expires=1678804207&x-signature=aytNGULPit6bNkhnT5LgUlq4%2BZo%3D','荣哥说险',56,'https://www.toutiao.com/article/7192880624531751424/',1677545601520);


CREATE TABLE `news_news_category` (
  `id` varchar(50) NOT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `news_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


INSERT INTO `news_news_category` (`id`, `category_id`, `news_id`) VALUES
	('1', '1', '1'),
	('2', '1', '2'),
	('3', '1', '3'),
	('4', '1', '4'),
	('5', '1', '5'),
	('6', '1', '6'),
	('7', '1', '7'),
	('8', '1', '8'),
	('9', '1', '9'),
	('10', '1', '10'),
	('11', '2', '11'),
	('12', '2', '12'),
	('13', '2', '13');