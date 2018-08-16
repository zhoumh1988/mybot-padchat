/*
 Navicat Premium Data Transfer

 Source Server         : 我的腾讯云
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 58.87.74.97:3306
 Source Schema         : wechaty

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 02/07/2018 16:27:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jok
-- ----------------------------
DROP TABLE IF EXISTS `jok`;
CREATE TABLE `jok` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `content` varchar(5000) NOT NULL DEFAULT '' COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='笑话记录表';

-- ----------------------------
-- Records of jok
-- ----------------------------
BEGIN;
INSERT INTO `jok` VALUES (1, '女友不解地问男友：“为什么男人有很多女朋友会被人羡慕，而女人有很多男友会被鄙视？！”男友语重心长地说：“ 就好像是一把钥匙可以开很多锁，会被人称作万能钥匙！而一把锁若是可以被很多钥匙开，那就说明锁有问题！”');
INSERT INTO `jok` VALUES (2, '黑夜荒无人烟的公路上，一白衣女子路边挥手，司机停车载上了她。女子递给司机一颗苹果。司机不好拒绝，咬了一口。女子问：好吃吗？司机说：好吃！这时女子说：“当然好吃了，我生前最爱吃苹果”。司机吓的差点把车开到沟里去，那女子继续说：“自从孩子出生以后，我就不爱吃了”。');
INSERT INTO `jok` VALUES (3, '老婆问老公：“我要是疯了，你还会爱我吗？”老公坚定的说：“爱！”老婆沉思了一会，忧愁地说：“你果然爱的是我\'');
INSERT INTO `jok` VALUES (4, '不成熟的男人会为了理想壮烈赴死，成熟的男人会为了理想苟且偷生！');
INSERT INTO `jok` VALUES (5, '某Mopper最给力的个人年终总结：存在问题：好吃饭、好泡妞、好打牌、好喝酒。分析原因：饭好吃、妞好泡、牌好打、酒好喝。总结经验：吃饭好、泡妞好、打牌好、喝酒好。整改措施：饭吃好、妞泡好、牌打好、酒喝好。努力方向：吃好饭、泡好妞、打好牌、喝好酒。');
INSERT INTO `jok` VALUES (6, '我们常常看到的风景是：一个人总是仰望和羡慕着别人的幸福，一回头，却发现自己正被仰望和羡慕着。其实，每个人都是幸福的。只是，你的幸福，常常在别人眼里。');
INSERT INTO `jok` VALUES (7, 'Love is when you take away the feeling， the passion， the romance， and you find out you still care for that person。 —— 所谓爱，就是当感觉、热情和浪漫统统拿掉之后，你仍然珍惜对方。');
INSERT INTO `jok` VALUES (8, '年底神兽纷纷出现：大雪参、中雪参、小雪参，高树，虫貅、卦蝌、补脊鸽，春鸽，都靠你了！阿弥陀佛~');
INSERT INTO `jok` VALUES (9, '妈妈再也不用担心我的学习了！！！so easy！！！真想有个步步高打火机，拿着教科书，哪里不会点哪里！');
INSERT INTO `jok` VALUES (10, '2012年元旦，新年收到的第一条短信是“您的账户余额已不足10元请尽快充值。。。”果然时时刻刻惦记着我的只有10086 ~~o(>_<)o ~~');
INSERT INTO `jok` VALUES (11, '元旦怎么过？领导——对老婆说：吃饭！睡觉！对美女说：吃个饭，睡个觉。对情人说：吃吃饭，睡睡觉。对小蜜说：吃饭饭，睡觉觉。对员工说：吃什么饭！睡什么觉！统统加班!');
INSERT INTO `jok` VALUES (12, '某天深夜，偶起来上厕所，见一透明状东西左忽右闪~ 吾问：你是鬼？鬼曰：恩那吾：QQ号多少？鬼：.....');
INSERT INTO `jok` VALUES (13, '海上漂来一具男尸，面目模糊。只能从下体辨认。全村女人想知道是不是自家出海打渔的男人。甲妇女：“不是俺姐夫，也不是俺男人！”乙妇女：“不是村长，也不是书记！”一个年轻寡妇走上前来，盯着男尸下体看了良久，长嘘一口气，对着众妇女挥了挥手说：都回去吧，不是咱村的!');
INSERT INTO `jok` VALUES (14, '一般的女秘书会说:\"老板,早晨好!\"；优秀的女秘书则说:\"老板,早晨了!\"；更优秀的秘书会说“老板...不早了”；聪明的秘书会说“老板...不早了吧？”；体贴的秘书会说：“老板，还早呢”；有心的秘书会说：“老板，还早吧？”失败的秘书会说：“老板，太早了吧？！”...');
INSERT INTO `jok` VALUES (15, '继《让子弹飞》中国热演之际，朝韩将联合上演本年度重头大戏《让炮弹飞》，续集《让导弹飞》和终极版《让核弹飞》正在的筹备之中。而发改委前日已经紧急上映了《让油价飞》。至于何时证监会筹备《让股价飞》，目前暂无时间表。热播长篇史诗巨制《让房价飞》表示毫无压力，鸿篇巨制《让工资飞》暂无计划。');
INSERT INTO `jok` VALUES (16, '有的人穿着棉毛裤，他已经冻死了;有的人穿着黑*丝*袜，她还活着... 爱一个人的全部,包括她的棉毛裤。');
INSERT INTO `jok` VALUES (17, '英语老师为了强调词汇积累的重要性，说：“一个单词用10遍，这个词就会跟随你一辈子。”教室最后一排的女孩闻听忽然念叨起来：“money, money, money……”');
INSERT INTO `jok` VALUES (18, '能回忆从前，说明你在成长。回忆从前你笑了，说明你长大了；回忆从前你哭了，说明你成熟了；回忆从前你漠然了，说明你世故了；回忆从前你感慨了，说明你无奈了；回忆从前你淡定了，说明你开始老了。');
INSERT INTO `jok` VALUES (19, '【铁饭碗的来历】女佣不小心摔碎一碗，主人欲罚，女下跪认错时乳房暴露，主人性起即成好事。次日女佣叫醒午睡的主人，告其又打碎一碗,主人又惩罚了她。此后女佣经常打碗，然后要求主人惩罚，有时一日竟打碎四只碗,主人难以招架,遂将家中的碗碟全部换成铁碗。这就是铁饭碗的来历。');
INSERT INTO `jok` VALUES (20, '有个人问他的朋友：“你为什么一抽烟就笑,是不是烟很香啊？”朋友回答：“哪里,我刚看到书上说，抽一支香烟减寿5秒，笑一笑则长寿10秒，所以每次抽烟我就要笑一笑，为生命赚回5秒钟。”');
INSERT INTO `jok` VALUES (21, '期末考试说远也不远了，望同学们以突击为主，作弊为辅：采取师进我藏，师退我抄，迂回作战方针！送你一幅对联：考试不作弊来年当学弟，宁可没人格不能不及格。横批：死也要过。考试必要技巧：三长一短选最短；三短一长选最长；长短不一要选B；参差不齐就选D。以抄为主，以蒙为辅，蒙抄结合，一定及格！');
INSERT INTO `jok` VALUES (22, '2011年“幸福”指南：家里没病人，牢里没亲人，外头没仇人，圈里没小人，身边没坏人，看似没情人，升官有贵人，办事有熟人.');
INSERT INTO `jok` VALUES (23, '未婚者的悲哀——2010年寡妇年，2011年光棍年，2012世界末日！');
INSERT INTO `jok` VALUES (24, '在超市里，看见一只五花大绑着的螃蟹从18.9元的冰柜里往28.9元的柜子里爬，我泪流满面，你太TM有上进心了！');
INSERT INTO `jok` VALUES (25, 'Mopper根据广电总局标准翻译外国乐队名称：西部大开发歌唱团—Westlife；感冒表演乐队—Coldplay；超级小伙子组合—Super junior；屎壳郎乐队—The Beatles； 雪天城市管理者乐队——snow patrol ；广电总局乐队——Radiohead。');
INSERT INTO `jok` VALUES (26, '遇见两个法国人。一个可能是教汉语的老师，另一个应该是他学生。老师高兴地指着中国日历对学生说：看，这两个字念\'雷锋\'。这是雷锋纪念日。他在中国非常有名，因为他生前帮助过很多人）学生佩服地说：啊，你真是见多识广！说完俩人高兴地走了。我凑过去一看，见日历上写的是：“霜降。\"');
INSERT INTO `jok` VALUES (27, '“因为高考，你人生中最美好的两年被毁了。十六七岁应该是谈恋爱、建自己的乐队、去心动的地方旅游、做一切今后再也没胆量做的事情的年纪。”——一个英国本科生这样对一名中国高中生说。');
INSERT INTO `jok` VALUES (28, '北京摇号网址的域名bjhjyd是由“北京缓解拥堵”6个拼音的首字母组成的。猫扑上出现了多种版本的“解读”【预言版】北京还将拥堵；【绝望版】北京会巨拥堵；【乐观版】北京何惧拥堵；【破罐破摔版】别急回家也堵；【期待版】北京好久摇到；【怨天尤人版】不见号就怨爹。');
INSERT INTO `jok` VALUES (29, '我们都因为爱犯过错误，值得庆幸的是，这是为了我们所爱的人，不是吗？生活总是给我们很多机会，让我们从头再来，改正我们曾犯下的错误，希望你们能一直保持这份真爱，谢谢你们让我知道什么是爱。我们有缘再聚');
COMMIT;

-- ----------------------------
-- Table structure for keywords
-- ----------------------------
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE `keywords` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(500) NOT NULL DEFAULT '' COMMENT '关键词',
  `content` longtext COMMENT '回复内容',
  `mime_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回复内容格式 0：未知；1:文本 2:图片 3:音频 4:视频',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='关键字回复记录表';

-- ----------------------------
-- Records of keywords
-- ----------------------------
BEGIN;
INSERT INTO `keywords` VALUES (1, 'hello', '您好，请问有什么可以帮助您的？\n回复数字1-5会有惊喜哦。\n您还可以回复“天气”查询当地天气。\n也可以回复“天气：城市“查询其他城市天气。', 1, '2018-06-08 15:50:40', '2018-06-19 17:46:37');
INSERT INTO `keywords` VALUES (2, '列表', '关键词自动回复：\nhello\n荤段子关键词：\n1\n2\n3\n4\n5\n', 1, '2018-06-08 15:51:32', '2018-06-11 13:26:00');
INSERT INTO `keywords` VALUES (3, '1', '问：女人穿内裤，打一零食。\n答：果冻。', 1, '2018-06-08 15:51:40', '2018-06-08 15:54:42');
INSERT INTO `keywords` VALUES (4, '2', '问：女人生孩子打一句成语\n答：血口喷人', 1, '2018-06-08 15:54:08', '2018-06-08 15:54:08');
INSERT INTO `keywords` VALUES (5, '3', '有一对夫妻，他太太很喜欢看连续剧。太太：“唉，老公”(她把电视关掉)。“这些年来，你都在我旁边陪着我看连续剧，我知道，你一定是很有耐心在陪伴着我，哎呀，我不应该这么自私，这样好了，我今天不看电视剧了，你要怎么样让我，给我一个机会让我让你开心一下”。\n先生：“要开心是吧，你也知道这么多年了，我每天都在陪你看是真得很无聊，你今天终于良心发现了，我看你看这一些古装剧一大堆，臣，启禀皇上，都是这些啊，都是咬文嚼字的对不对，这样好了，我不考你太深”。\n太太：“老公，那你要考我什么”。先生：“你去找一句话，这一句话，让我要很开心，又很生气的话”。太太想了想：“对了，你的鸡鸡，是你朋友里面最大的”。', 1, '2018-06-08 15:54:12', '2018-06-08 16:02:39');
INSERT INTO `keywords` VALUES (6, '4', '蔡头：你猜猜我是哪里人?费玉清：看你短短的腿，就知道是中日混血。蔡头：没错。我爸爸是中坜的，我妈妈是日月潭的。费玉清：那我自己的出身，便不好意思讲了。蔡头：为什么?费玉清：因为我爸爸是基隆的，我妈妈是八堵人。所以就是XX混血。费玉清：为甚么要取“蔡头”当艺名呢?蔡头：因为我爸爸姓蔡，所以就叫蔡头啦。费玉清：喔!还好，你不是归亚蕾的儿子，不然岂不是要叫做……', 1, '2018-06-08 16:02:49', '2018-06-08 16:02:49');
INSERT INTO `keywords` VALUES (7, '5', '现在英语都说要从娃娃抓起，一日，在幼稚园中老师在教小朋友学习字母，老师说：“ABCD”，下面有个小朋友就是不念，老师就问：你为什么不念?小朋友答：我妈妈讲B是不好的字眼。老师就说：你妈的B和老师的B不一样，你妈的B是骂人的，阿姨的B是外国人用的。', 1, '2018-06-08 16:04:55', '2018-06-08 16:05:01');
INSERT INTO `keywords` VALUES (8, 'accessory', './file/accessory.mp3', 3, '2018-06-08 16:06:07', '2018-06-08 16:06:07');
INSERT INTO `keywords` VALUES (9, 'appropriate', './file/appropriate.mp3', 3, '2018-06-08 16:06:24', '2018-06-08 16:06:24');
INSERT INTO `keywords` VALUES (10, 'absent', './file/absent.mp3', 3, '2018-06-08 16:06:54', '2018-06-08 16:06:54');
INSERT INTO `keywords` VALUES (11, '糖果店', './file/tg-mark.jpeg', 2, '2018-06-08 16:18:18', '2018-06-08 16:18:18');
INSERT INTO `keywords` VALUES (12, '哈哈', '你四不四洒？', 1, '2018-06-08 19:22:50', '2018-06-08 19:22:50');
INSERT INTO `keywords` VALUES (16, '你好', '您好，请问有什么可以帮助您的？\n您可以回复我room加入测试群\n您可以尝试回复：\n查询天气\n天气：城市\n笑话\n签到（群签到）', 1, '2018-06-11 17:26:03', '2018-07-02 16:11:18');
INSERT INTO `keywords` VALUES (17, '您好', '您好，请问有什么可以帮助您的？\n您可以回复我room加入测试群\n您可以尝试回复：\n查询天气\n天气：城市\n笑话\n签到（群签到）', 1, '2018-06-19 17:46:24', '2018-07-02 16:11:23');
INSERT INTO `keywords` VALUES (18, 'hi', '您好，请问有什么可以帮助您的？\n您可以回复我room加入测试群\n您可以尝试回复：\n查询天气\n天气：城市\n笑话\n签到（群签到）', 1, '2018-06-19 17:46:31', '2018-07-02 16:11:26');
INSERT INTO `keywords` VALUES (19, '666', '不要膜拜哥，哥很寂寞～', 1, '2018-06-22 17:41:21', '2018-06-22 17:41:21');
INSERT INTO `keywords` VALUES (20, 'mp4', './file/test.mp4', 4, '2018-06-26 16:10:06', '2018-06-26 16:10:06');
INSERT INTO `keywords` VALUES (21, 'mp3', './file/absent.mp3', 3, '2018-06-26 16:34:24', '2018-06-26 16:35:44');
COMMIT;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `topic` varchar(1000) NOT NULL DEFAULT '' COMMENT '群组名称',
  `roomid` varchar(100) DEFAULT NULL COMMENT '群组id',
  `user_id` varchar(50) DEFAULT NULL COMMENT '群组归属人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='群组记录表';

-- ----------------------------
-- Records of room
-- ----------------------------
BEGIN;
INSERT INTO `room` VALUES (1, 'A减肥励志&饭桶讨论组', NULL, NULL);
INSERT INTO `room` VALUES (2, '一起吃，一起喝，一起玩！', NULL, NULL);
INSERT INTO `room` VALUES (3, '前端技术交流讨论组', NULL, NULL);
INSERT INTO `room` VALUES (4, '玩乐小分队', NULL, NULL);
INSERT INTO `room` VALUES (6, '郑老师兽课群', NULL, NULL);
INSERT INTO `room` VALUES (7, 'test', '11464033773@chatroom', 'wxid_owu22b0extqv21');
COMMIT;

-- ----------------------------
-- Table structure for room_sign
-- ----------------------------
DROP TABLE IF EXISTS `room_sign`;
CREATE TABLE `room_sign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_key` varchar(500) DEFAULT NULL COMMENT '群组id',
  `user_key` varchar(500) DEFAULT NULL COMMENT '用户id',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='群签到记录表';

-- ----------------------------
-- Records of room_sign
-- ----------------------------
BEGIN;
INSERT INTO `room_sign` VALUES (11, '3', 'XGXQSPANCLASSEMOJIEMOJI1F637SPAN', '2018-06-22 17:20:43');
INSERT INTO `room_sign` VALUES (13, '3', 'WHOSGGJSPANCLASSEMOJIEMOJI1F631SPAN', '2018-06-22 17:30:29');
INSERT INTO `room_sign` VALUES (14, '3', 'SPANCLASSEMOJIEMOJI1F44ASPAN', '2018-06-22 17:31:22');
INSERT INTO `room_sign` VALUES (16, '1', 'MUJO', '2018-06-22 17:39:53');
INSERT INTO `room_sign` VALUES (17, '6', 'FLY', '2018-06-22 18:01:23');
INSERT INTO `room_sign` VALUES (18, '6', 'HJ', '2018-06-22 18:02:11');
INSERT INTO `room_sign` VALUES (19, '6', 'YYP', '2018-06-22 18:17:58');
INSERT INTO `room_sign` VALUES (20, '1', 'MUJO', '2018-06-26 10:21:08');
INSERT INTO `room_sign` VALUES (21, '7', 'XGXQSPANCLASSEMOJIEMOJI1F637SPAN', '2018-06-26 16:46:47');
INSERT INTO `room_sign` VALUES (22, '7', 'MUJO', '2018-06-26 17:10:44');
INSERT INTO `room_sign` VALUES (23, '7', 'zhoumh1988', '2018-06-28 11:29:48');
INSERT INTO `room_sign` VALUES (24, '7', 'kingTiger_', '2018-06-28 11:32:09');
INSERT INTO `room_sign` VALUES (25, '6', 'liupengwudia', '2018-06-28 19:32:54');
INSERT INTO `room_sign` VALUES (26, '3', 'zhoumh1988', '2018-06-29 15:12:47');
INSERT INTO `room_sign` VALUES (27, '7', 'zhoumh1988', '2018-06-29 15:12:56');
INSERT INTO `room_sign` VALUES (28, '7', 'kingTiger_', '2018-06-29 15:13:08');
INSERT INTO `room_sign` VALUES (29, '7', 'zhoumh1988', '2018-07-02 16:26:12');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
