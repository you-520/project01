SET NAMES UTF8; #设置编码
DROP DATABASE IF EXISTS iceCream; #创建数据库
CREATE DATABASE iceCream CHARSET=UTF8; 
USE iceCream; #进入数据库
/**用户信息表**/
CREATE TABLE ice_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),          #昵称
  upwd VARCHAR(32),           #密码
  avatar VARCHAR(128),        #头像图片路径
  phone VARCHAR(16),          #电话号
  birthday VARCHAR(16),       #生日
  gender INT             #性别  0-女  1-男
);
/**插入用户数据**/
INSERT INTO ice_user VALUES
(NULL, '音苒', '123456', 'head.jpg', '13259719615', '1996-09-16',0),
(NULL, '叾屾', '123456', 'user.jpg','17629223754', '1998-05-24',1),
(NULL, 'lucky', '123456', 'lucky.jpg','15282671770', '1998-05-23',1);

/**地址表**/
CREATE TABLE ice_address(                 
   aid INT PRIMARY KEY AUTO_INCREMENT,
   linkman VARCHAR(16),        #联系人
   gender INT,                 #性别  0-女  1-男
   phone VARCHAR(16),          #电话号
   province VARCHAR(16),       #省份
   house_number VARCHAR(16),   #门牌号
   user_id INT,
   FOREIGN KEY(user_id) REFERENCES ice_user(uid)
  );

 /**插入用户地址数据**/
INSERT INTO ice_address VALUES
(NULL,'音苒', '0', '13259719615', '陕西', '2单元1502',1),
(NULL,'音若', '0', '13259719615', '陕西', '2单元1502',1),
(NULL,'叾屾', '1', '17629223754', '陕西', '3单元1503',2),
(NULL,'lucky', '0', '15282671770', '四川', '1单元1501',3);
/*商品列表*/
CREATE TABLE shop(
  sid INT  PRIMARY KEY AUTO_INCREMENT,
  pic varchar(256)  NULL,  /* 图片路径*/
  title varchar(64) NOT NULL,  /*  商品标题 */
  detail varchar(128) NULL,    /* 商品细节 */
  price decimal(10,2) NOT NULL,  /* 商品价格 */
  lid int  NOT NULL,
  did int NOT NULL /*标明商品的种类id*/
);

/*商品详情页面*/
CREATE TABLE shopdetail(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  size varchar(128) NULL,/*做法*/
  toast varchar(128) NULL,/*口味*/
  cook varchar(128) NUll,/*做法*/
  temp varchar(128) NULL,
  sugar varchar(128) NULL,
  spec varchar(128) NULL,
  s_id int NOT NULL
  -- FOREIGN KEY(s_id) REFERENCES shop(sid)
);
DROP TABLE IF EXISTS shopcart;
/*商品购物车列表*/
CREATE TABLE shopcart(
  cid INT PRIMARY KEY AUTO_INCREMENT, /*购物车编号*/
  uid INT NOT NULL,  /*单个商品购物车编号*/
  title varchar(128) NUll,
  count int NULL,/*数量*/
  tem varchar(128) NULL, /*温度*/
  sugar varchar(128) NULL, /*糖度*/
  price decimal(10,2) NULL,
  pic varchar(256) NULL
);

 
DROP TABLE IF EXISTS `order`;
/*订单列表*/
CREATE TABLE `order`( 
  oid INT(11) PRIMARY KEY AUTO_INCREMENT,
  title varchar(128) NOT NULL,
  count int NOT NULL,/*数量*/
  tem varchar(128) NULL, /*温度*/
  sugar varchar(128) NULL, /*糖度*/
  price decimal(10,2) NOT NULL,
  pic varchar(256) NULL,
  total decimal(10,2) NOT NULL,
  pay_time  DATETIME NOT NULL, /*下单时间*/
  order_code varchar(64) NOT NULL
);


INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",1);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",1);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",1);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",3);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","少糖","",3);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",3);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",3);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",4);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",4);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","","",4);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",4);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",4);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",5);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",5);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",5);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",5);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","","","燕麦",7);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","","","燕麦",8);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",24);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","","",24);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",24);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",25);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","","少糖","",25);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",26);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","","少糖","",26);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","","","燕麦",27);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","","","燕麦",28);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",29);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","少糖","",29);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",29);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",29);
/*以上小标均+1*/
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",30);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",30);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",30);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",31);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","少糖","",31);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",31);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",32);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",32);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",32);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",32);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",33);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","少糖","",33);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",33);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",33);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",34);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",34);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","","",34);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",34);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",34);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",35);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","少糖","",35);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",35);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",35);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",36);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","","",36);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","","",36);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",36);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",36);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",37);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","少糖","",37);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",37);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",38);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","少糖","",38);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",38);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",39);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",39);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",39);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",39);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",40);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",40);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","无糖","",40);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",40);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",41);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",41);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","无糖","",41);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",41);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",42);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",42);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",42);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",42);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",43);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",43);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",43);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",43);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",44);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",44);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",44);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",44);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",45);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","多冰","少糖","",45);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","无糖","",45);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",45);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",45);
/*芝士奶盖四季春*/
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","中杯","正常冰","正常糖","",46);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","大杯","常温","少糖","",46);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",46);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","中杯","正常冰","正常糖","",47);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","大杯","常温","少糖","",47);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",47);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","中杯","正常冰","正常糖","",48);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","大杯","常温","少糖","",48);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",48);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",49);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",50);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",50);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","常温","","",50);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",50);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","中杯","正常冰","正常糖","",51);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","大杯","常温","少糖","",51);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",51);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","中杯","正常冰","正常糖","",52);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","大杯","常温","少糖","",52);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",52);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","中杯","正常冰","正常糖","",53);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","大杯","常温","少糖","",53);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",53);
/*双拼奶茶*/
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"椰果","红豆","中杯","正常冰","正常糖","",54);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"燕麦","椰果","大杯","常温","少糖","",54);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"红豆","黑糖冻","","热","","",54);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"黑糖冻","珍珠","","","","",54);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"珍珠","燕麦","","","","",54);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","中杯","正常冰","正常糖","",55);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","大杯","常温","少糖","",55);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",55);


INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",56);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",56);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",56);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",57);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",57);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",57);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","正常糖","",58);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","少糖","",58);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",58);

INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","正常冰","","",59);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","少冰","","",59);
INSERT INTO shopdetail (pid,toast,cook,size,temp,sugar,spec,s_id) VALUES(NULL,"","","","热","","",59);








INSERT INTO `shop` (`sid`, `pic`, `title`, `detail`, `price`, `lid`, `did`) VALUES
(1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596273901993&di=ff4b11e291b44f764e458c46875354d9&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171013%2Fcbc0fa7a3807440aa232d5a746128b3f.jpeg', '蜜桃四季春', '', '6.00', 0, 1),
(2, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1290660312,2243809259&fm=26&gp=0.jpg', '魔天脆脆', '由于冰淇淋容易融化,不支持外卖', '3.00', 0, 0),
(3, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596274097413&di=46e286a6bf05da769015d31cc6df3899&imgtype=0&src=http%3A%2F%2Fwww.sdbxsg.com%2FupLoad%2Fproduct%2Fmonth_1805%2F201805181509084335.jpg', '冰鲜柠檬水', '柠檬看得见,现切超新鲜', '3.00', 0, 1),
(4, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3245888211,2586336403&fm=26&gp=0.jpg', '满杯百香果', '酸酸甜甜满杯香,果茶新贵尝一尝', '7.00', 0, 1),
(5, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4114394686,4116418609&fm=26&gp=0.jpg', '棒打鲜橙', '', '6.00', 0, 1),
(6, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1086149751,1104818010&fm=26&gp=0.jpg', '雪王大圣代(草莓)', '新鲜冰淇淋,大杯过足瘾', '6.00', 0, 0),
(7, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1661555932,239956624&fm=26&gp=0.jpg', '草莓摇摇奶昔', '一杯有三宝,喝前摇一摇', '6.00', 0, 2),
(8, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4254584878,987008843&fm=15&gp=0.jpg', '蓝莓摇摇奶昔', '一杯有三宝,喝前摇一摇', '6.00', 0, 2),
(9, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596274469671&di=52a3d65fb74939805d72fe1806727e99&imgtype=0&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F71a7846d8ec4027af9a02832fc3f1f98.png', '吃土摇摇奶昔', '一杯有三宝,喝前摇一摇', '6.00', 0, 0),
(10, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=167295895,3570780553&fm=26&gp=0.jpg', '雪王大圣代(凤梨)', '', '6.00', 1, 0),
(11, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1629573041,3263607152&fm=26&gp=0.jpg', '雪王大圣代(红豆)', '', '6.00', 1, 0),
(12, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3029640812,1077248983&fm=26&gp=0.jpg', '雪王大圣代(芒果)', '', '6.00', 1, 0),
(13, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596274469671&di=52a3d65fb74939805d72fe1806727e99&imgtype=0&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F71a7846d8ec4027af9a02832fc3f1f98.png', '吃土摇摇奶昔', '', '6.00', 1, 0),
(14, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1290660312,2243809259&fm=26&gp=0.jpg', '摩天脆脆', '由于冰淇淋容易融化,不支持外卖', '3.00', 2, 0),
(15, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2434149233,3825086163&fm=26&gp=0.jpg', '华夫冰淇淋', '', '2.00', 2, 0),
(16, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596274469671&di=52a3d65fb74939805d72fe1806727e99&imgtype=0&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F71a7846d8ec4027af9a02832fc3f1f98.png', '吃土摇摇奶昔', '', '6.00', 2, 0),
(17, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2525842284,3292433984&fm=26&gp=0.jpg', '雪王大圣代(奥利奥)', '新鲜冰淇淋,大杯过足瘾', '6.00', 2, 0),
(18, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1556404799,1034900563&fm=15&gp=0.jpg', '雪王大圣代(蓝莓)', '新鲜冰淇淋,大杯过足瘾', '6.00', 2, 0),
(19, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1086149751,1104818010&fm=26&gp=0.jpg', '雪王大圣代(草莓)', '新鲜冰淇淋,大杯过足瘾', '6.00', 2, 0),
(20, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1086149751,1104818010&fm=26&gp=0.jpg', '雪王大圣代(草莓)', '新鲜冰淇淋,大杯过足瘾', '6.00', 2, 0),
(21, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=167295895,3570780553&fm=26&gp=0.jpg', '雪王大圣代(凤梨)', '', '6.00', 2, 0),
(22, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1629573041,3263607152&fm=26&gp=0.jpg', '雪王大圣代(红豆)', '', '6.00', 2, 0),
(23, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3029640812,1077248983&fm=26&gp=0.jpg', '雪王大圣代(芒果)', '', '6.00', 2, 0),
(24, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1900625832,2416655200&fm=26&gp=0.jpg', '黑糖珍珠大圣代', '', '6.00', 2, 0),
(25, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=578576909,854984560&fm=26&gp=0.jpg', '雪顶咖啡', '新鲜冰淇淋+咖啡', '6.00', 2, 1),
(26, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596274949002&di=3d6a215cec82ab2319321d9d0ef08116&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180725%2F700f8511601c40e88ff338023e5852c8.jpeg', '冰淇淋红茶', '', '6.00', 2, 1),
(27, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3805449490,3266821361&fm=15&gp=0.jpg', '冰淇淋四季春', '', '6.00', 2, 1),
(28, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4254584878,987008843&fm=15&gp=0.jpg', '草莓瑶瑶奶昔', '一杯有三宝,喝前摇一摇', '6.00', 2, 2),
(29, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4254584878,987008843&fm=15&gp=0.jpg', '草莓瑶瑶奶昔', '一杯有三宝,喝前摇一摇', '6.00', 2, 2),
(30, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596274097413&di=46e286a6bf05da769015d31cc6df3899&imgtype=0&src=http%3A%2F%2Fwww.sdbxsg.com%2FupLoad%2Fproduct%2Fmonth_1805%2F201805181509084335.jpg', '冰鲜柠檬水', '柠檬看得见,现切超新鲜', '4.00', 3, 1),
(31, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2579474150,1760258782&fm=26&gp=0.jpg', '杨枝甘露', '港式杨枝甘露,大块芒果珍珠', '8.00', 3, 1),
(32, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=319389940,4280788024&fm=26&gp=0.jpg', '蓝莓果粒茶', '', '4.00', 3, 1),
(33, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4114394686,4116418609&fm=26&gp=0.jpg', '棒打鲜橙', '', '6.00', 3, 1),
(34, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1068415875,2473995894&fm=26&gp=0.jpg', '森林玫果', '多种复合水果+Q弹椰果', '5.00', 3, 1),
(35, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3345323029,3481306368&fm=26&gp=0.jpg', '蜂蜜柚子茶', '', '6.00', 3, 1),
(36, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596275122831&di=3e00ecd7aeeaaafabd3ce1176b66e6f1&imgtype=0&src=http%3A%2F%2Ft3.58cdn.com.cn%2Fgroupbuy%2Fn_t08cfec076718f8014eca2_5da17259021d78d1.jpg', '柠檬芦荟茶', '酸酸甜甜满怀香,果茶新贵尝一尝', '7.00', 3, 1),
(37, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596275149158&di=d92ddd9417eb49329932e9e1c17afe4f&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20161220%2F17a8145ba11e48c0b06bc54dc7af336e_th.jpg', '柠檬红茶', '', '5.00', 3, 1),
(38, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1665220004,3359746552&fm=26&gp=0.jpg', '柠檬绿茶', '', '5.00', 3, 1),
(39, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2728770359,2570027917&fm=26&gp=0.jpg', '凤梨四季春', '凤梨果粒+椰果+高山四季春', '6.00', 3, 1),
(40, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596275193506&di=89baefe53401e9ae850bcd97235ec037&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190618%2F9091394778ff410aae700936ae463bca.jpeg', '绿茶', '', '4.00', 4, 1),
(41, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1752110910,2471254934&fm=26&gp=0.jpg', '红茶', '', '4.00', 4, 1),
(42, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=199455434,2452961081&fm=26&gp=0.jpg', '有料绿茶', '纯茶加小料,口感Q到爆', '5.00', 4, 1),
(43, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3028791200,3587785618&fm=26&gp=0.jpg', '有料红茶', '', '5.00', 4, 1),
(44, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3407810725,192339541&fm=15&gp=0.jpg', '有料四季春', '纯茶加小料,口感Q到爆', '5.00', 4, 1),
(45, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3063064623,3153945015&fm=26&gp=0.jpg', '四季春茶', '', '4.00', 4, 1),
(46, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4277232185,241463944&fm=15&gp=0.jpg', '芝士奶盖四季春', '', '8.00', 4, 2),
(47, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1164521752,957950386&fm=26&gp=0.jpg', '芝士奶盖红茶', '', '8.00', 4, 2),
(48, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=607363810,3566463269&fm=26&gp=0.jpg', '芝士奶盖绿茶', '', '8.00', 4, 2),
(49, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2591492478,98073951&fm=26&gp=0.jpg', '奶香烤燕麦', '', '5.00', 5, 1),
(50, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2859667887,4139909384&fm=26&gp=0.jpg', '马来白咖啡', '马来白咖啡,香浓醇厚,让你欲罢不能', '5.00', 5, 1),
(51, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3963812666,2791806707&fm=26&gp=0.jpg', '椰果奶茶', '', '7.00', 5, 2),
(52, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1911093340,1078888226&fm=26&gp=0.jpg', '红豆奶茶', '', '7.00', 5, 2),
(53, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1534950810,3684503181&fm=26&gp=0.jpg', '燕麦奶茶', '', '7.00', 5, 2),
(54, 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3149776856,780650283&fm=26&gp=0.jpg', '双拼奶茶', '', '7.00', 5, 2),
(55, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=365395358,2499597854&fm=26&gp=0.jpg', '珍珠奶茶', '慢煮珍珠,颗颗Q弹', '6.00', 5, 1),
(56, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=29577940,1724633900&fm=15&gp=0.jpg', '四季春珍珠奶茶', '', '7.00', 5, 1),
(57, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2817424104,948930657&fm=26&gp=0.jpg', '烤奶珍珠奶茶', '', '7.00', 5, 1),
(58, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=11368542,1434655578&fm=26&gp=0.jpg', '三拼霸霸奶茶', '', '8.00', 5, 1),
(59, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3779756732,2774819644&fm=26&gp=0.jpg', '黑糖珍珠奶茶', '', '7.00', 5, 1),
(60, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3119518285,666439603&fm=26&gp=0.jpg', '致敏原', '饮品中含有乳制品、菠萝、芒果、燕麦等致敏物,请过敏用户酌情选择,必要时请咨询门店', '8888.00', 6, 0);




