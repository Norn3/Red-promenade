create table questions
(
   qID integer PRIMARY KEY,
   question varchar2(1024) not null,
   answer1 varchar2(255) not null,
   answer2 varchar2(255) not null,
   answer3 varchar2(255) not null,
   answer4 varchar2(255) not null,
   solution char(1)  CHECK(solution IN('1','2','3','4')) not null
);

INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(1,'____拉开了中国新民主主义革命的序幕。','新文化运动','五四运动','中国共产党成立','五洲运动',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(2,'中国共产党第一次全国代表大会在____开幕。','1921年7月1日，南京','1921年7月21日，上海','1921年7月30日，南京','1921年7月23日，上海',3);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(3,'____第一次提出明确的反帝反封建的民主革命纲领。','中共一大','中共二大','中共三大','中共四大',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(4,'国共合作实现后，以____为中心，很快开创了反对帝国主义和封建军阀的革命新局面。','天津','广州','杭州','上海',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(5,'中共四大时，全国党员的人数是____。','594人','794人','994人','1594人',2);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(6,'1927年中共五大时，全国党员人数已超过____。','1万人','3万人','5万人','10万人',2);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(7,'1927年____，蒋介石在____发动反革命政变。','4月2日，南京','4月12日，上海','4月12日，南京','4月2日，上海',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(8,'中央五大选举产生了党的历史上第一个中央纪律检查监督机构____，这在党的建设史上有重要意义。','中央检查局','中央纪律委员会','中央监察委员会','中央纪律监察委员会',2);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(9,'____标志着中国共产党独立地领导革命战争、创建人民军队和武装夺取政权的开始。','武昌起义','南昌起义','秋收起义','广州起义',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(10,'____从进攻大城市转到向农村进军，这是中国人民革命发展史上具有决定意义的新起点。','武昌起义','南昌起义','秋收起义','广州起义',2);


delete from questions where qid=7;


create table information
(
    userID varchar2(10) primary key,
    userName varchar2(20) not null,
    userPassword varchar2(20) not null,
    userSex char(3) CHECK(userSex IN('男','女')),
    userBirth varchar(7),
    userAuthority varchar2(12) CHECK(userAuthority IN('普通用户','管理员'))
);

INSERT INTO information (userID,userName,userPassword,userSex,userBirth,userAuthority)  
VALUES('admin','张三','123','男','2000-01','管理员');
INSERT INTO information (userID,userName,userPassword,userSex,userBirth,userAuthority)  
VALUES('10001','李四','zxcv','女','2001-02','普通用户');

select * from information where userID = '10001';

update information set username='李四' where userid = '10001';


create table answer_record
(
    userID varchar2(10) not null,
    qID1 integer not null,
    userAnswer1 char(1)  CHECK(userAnswer1 IN('0','1','2','3','4')),
     qID2 integer not null,
    userAnswer2 char(1)  CHECK(userAnswer2 IN('0','1','2','3','4')),
     qID3 integer not null,
    userAnswer3 char(1)  CHECK(userAnswer3 IN('0','1','2','3','4')),
     qID4 integer not null,
    userAnswer4 char(1)  CHECK(userAnswer4 IN('0','1','2','3','4')),
     qID5 integer not null,
    userAnswer5 char(1)  CHECK(userAnswer5 IN('0','1','2','3','4')),
    score integer CHECK (score IN('0','20','40','60','80','100')),
    CONSTRAINT userID fOREIGN KEY(userID) REFERENCES information(userID)
);
INSERT INTO answer_record (userID,qID1,userAnswer1,qID2,userAnswer2,qID3,userAnswer3,qID4,userAnswer4,qID5,userAnswer5,score)  
VALUES(10001,2,2,3,1,1,1,5,2,4,1,80);
INSERT INTO answer_record (userID,qID1,userAnswer1,qID2,userAnswer2,qID3,userAnswer3,qID4,userAnswer4,qID5,userAnswer5,score)  
VALUES(10001,2,2,3,1,4,1,5,2,1,4,60);

select * from answer_record ORDER BY userID;

drop table answer_record;
drop table questions;
drop table information;
