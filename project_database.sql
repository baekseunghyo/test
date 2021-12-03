drop database beauty;
create database beauty;
use beauty;
create table `user`(
    `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '키',
    uid varchar(40),
    upw varchar(50) not null,
    uname varchar(20) not null,
    uage int,
    uaddress varchar(130) not null,
    umobile varchar(20) not null,
    `point` int,
    `roleName` varchar(128) DEFAULT 'ROLE_USER' COMMENT '권한(ROLE_USER)',
  PRIMARY KEY (`idx`)
);
create table shop(
   `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '키',
    stype char(10) not null,
    sname varchar(40) not null,
    sphone varchar(20) not null,
    saddress varchar(130) not null,
    sinfo varchar(130),
    simg varchar(130),
    price int not null,
  PRIMARY KEY (`idx`)
);
create table reservation(
    `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '키',
    rid varchar(40) not null ,
    uid varchar(40) not null ,
    sid varchar(40) not null,
    `date` varchar(40) not null,
    `time` varchar(40) not null,
    deposit int not null,
  PRIMARY KEY (`idx`)
);

drop table review;

create table review(
    `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '키',
    uidx int not null ,
    sidx int not null,
    `comment` varchar(1024),
    writeTime timestamp not null default now(),
  PRIMARY KEY (`idx`),
  foreign key (uidx) references user (idx),
  foreign key (sidx) references shop (idx)
);




INSERT INTO `user` (uid,upw,uname,uage,uaddress,umobile,point) values ('user1','pw1234','김수지','21','서울', '01011223344', 1000);
INSERT INTO user (uid,upw,uname,uage,uaddress,umobile,point) values ('user2','pw1234','이지연','24','춘천', '01044332211', 1000);
INSERT INTO user (uid,upw,uname,uage,uaddress,umobile,point) values ('user3','pw1234','박나경','27','부산', '01012341234', 1000);
INSERT INTO user (uid,upw,uname,uage,uaddress,umobile,point) values ('user4','pw1234','최현주','32','대전', '01043214321', 1000);
INSERT INTO user (uid,upw,uname,uage,uaddress,umobile,point) values ('user5','pw1234','문채영','36','보령', '01013244231', 1000);

INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','예쁨온헤어','0312223333','서울','당신의 머리를 더욱 아름답게 가꿔드립니다~','',30000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','엔스헤어살롱','0514325677','부산','건강한 아름다움을 드리는 엔스헤어살롱입니다.','',50000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','라포즈','0531112222','대구','대구 최고의 열펌, 아이롱펌, 특수컬러 전문시술 살롱입니다.','',20000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','카멜레온','0428887756','대전','고객 만족을 위해 최선을 다하겠으며, 아름다움과 멋스러움을 연출해드리겠습니다.','',80000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','데이지헤어비스','0423325514','대전','합리적인 가격에 1:1 맞춤 시술!','',90000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','루아헤어','026428671','서울','언제나 휴식하러 오는 마음이실 수 있도록 최선을 다하겠습니다!','',150000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','살롱드헤브론','0625426875','광주','확실한 제품, 최고의 실력으로 항상 만족드리겠습니다~','',110000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','건앤로빈스','0538756948','대구','디자이너 1:1 시술 시스템! 최고의 서비스 건앤로빈스!','',210000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','허준헤어','025687595','서울','모발이 손상되었다면 크리닉보다 복구펌 추천드립니다.','',180000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('헤어','조으다헤어','0625876934','광주','광주 시내에 위치한 조으다헤어입니다. 환영합니다!','',160000);

INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','네일트리','021234567','서울','서울 내 가장 저렴한 네일샵입니다!','',60000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','유니끄네일','0425877632','대전','전문적인관리로 최상의 서비스를 만끽해보세요.','',50000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','네일706','0531459862','대구','드릴케어로 좀 더 섬세하게 해드려요.','',50000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','네일핏','0518795647','부산','건식케어 방법으로 고객님의 손톱건강을 도와드립니다.','',100000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','네일데이','0625879945','광주','친절하고 잘하는 곳으로 오세요~','',80000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','데일리플랜','0625789634','광주','약해진 손톱, 발톱 케어받으러 오세요.','',70000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','네일라보떼','024231568','서울','이쁜아트 받아보러 오세요~','',60000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','네일사이','0421587963','대전','빠른 유행에 적합한 매달 디자인 변경!','',50000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','러블리네일','0516589632','부산','가성비 좋은 아트비용으로 스트레스 풀러오세요','',50000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('네일','루미가넷','0532589756','대구','꼼꼼하고 철저한 관리로 고객님을 맞이하고 있습니다.','',80000);

INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','777체형관리','0511234567','부산','뭉친 근육을 시원하게 풀어드립니다~','',100000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','다온타이&아로마','0621573458','광주','쾌적하고 편안한 관리해드려요','',150000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','7DAYS','0532456871','대구','여드름, 홍조, 깊은주름을 케어해드립니다.','',130000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','그린','0515789632','부산','20년 경력의 스페셜리스트가 직접케어 합니다.','',150000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','하얀피부스킨케어','027895486','서울','1대1 맞춤 솔루션 100%예약제로 운영합니다.','',50000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','더뷰티샵','0423568648','대전','명품 스킨케어로 매끈한 피부로 바꿔드립니다.','',70000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','케이테라피','0628971234','광주','피부를 건강하게 피부타입별로 관리해드려요.','',100000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','에이스체형관리','0536547897','대구','심신안정, 몸매교정이 가능합니다.','',50000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','오예쁘다','023698547','서울','신체 상,하 발란스 리듬을 맞추어 통증완화 시켜드려요','',110000);
INSERT INTO shop (stype,sname,sphone,saddress,sinfo,simg,price) values ('마사지','퀸스킨케어','0425879634','대전','신경조율에 효과있는 아로마관리','',80000);

alter table shop add `view` int default 0;
drop table review;

select * from review;

select user.uname, review.comment, review.writeTime
from review inner join user
on user.idx=review.uidx
where sidx=5;

insert into review (uidx, sidx, comment) values (1,5,'사장님 무지 친절하시구 어쩌구 저쩌구 리뷰예요~');
insert into review (uidx, sidx, comment) values (2,1,'친절해요!!!!!!!');

update shop
set `view` = 12
where idx = 9;

update shop
set simg = '/img/hair_1.jpg'
where idx = '1';

update shop
set simg = '/img/hair_2.jpg'
where idx = '2';

update shop
set simg = '/img/hair_3.png'
where idx = '3';

update shop
set simg = '/img/hair_4.jpg'
where idx = '4';

update shop
set simg = '/img/hair_5.jpg'
where idx = '5';

update shop
set simg = '/img/hair_6.jpg'
where idx = '6';

update shop
set simg = '/img/hair_7.jpg'
where idx = '7';

update shop
set simg = '/img/hair_8.jpg'
where idx = '8';

update shop
set simg = '/img/hair_9.jpg'
where idx = '9';

update shop
set simg = '/img/hair_10.jpg'
where idx = '10';



update shop
set simg = '/img/nail_1.jpg'
where idx = '11';

update shop
set simg = '/img/nail_2.jpg'
where idx = '12';

update shop
set simg = '/img/nail_3.jpg'
where idx = '13';

update shop
set simg = '/img/nail_4.jpg'
where idx = '14';

update shop
set simg = '/img/nail_5.jpg'
where idx = '15';

update shop
set simg = '/img/nail_6.jpg'
where idx = '16';

update shop
set simg = '/img/nail_7.jpg'
where idx = '17';

update shop
set simg = '/img/nail_8.jpg'
where idx = '18';

update shop
set simg = '/img/nail_9.jpg'
where idx = '19';

update shop
set simg = '/img/nail_10.jpg'
where idx = '20';




update shop
set simg = '/img/massage_1.png'
where idx = '21';

update shop
set simg = '/img/massage_2.jpg'
where idx = '22';

update shop
set simg = '/img/massage_3.jpg'
where idx = '23';

update shop
set simg = '/img/massage_4.jpg'
where idx = '24';

update shop
set simg = '/img/massage_5.jpg'
where idx = '25';

update shop
set simg = '/img/massage_6.jpg'
where idx = '26';

update shop
set simg = '/img/massage_7.jpg'
where idx = '27';

update shop
set simg = '/img/massage_8.jpg'
where idx = '28';

update shop
set simg = '/img/massage_9.jpg'
where idx = '29';

update shop
set simg = '/img/massage_10.jpg'
where idx = '30';