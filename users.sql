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
VALUES(1,'____�������й������������������Ļ��','���Ļ��˶�','�����˶�','�й�����������','�����˶�',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(2,'�й���������һ��ȫ����������____��Ļ��','1921��7��1�գ��Ͼ�','1921��7��21�գ��Ϻ�','1921��7��30�գ��Ͼ�','1921��7��23�գ��Ϻ�',3);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(3,'____��һ�������ȷ�ķ��۷��⽨�������������졣','�й�һ��','�й�����','�й�����','�й��Ĵ�',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(4,'��������ʵ�ֺ���____Ϊ���ģ��ܿ쿪���˷��Ե۹�����ͷ⽨�����ĸ����¾��档','���','����','����','�Ϻ�',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(5,'�й��Ĵ�ʱ��ȫ����Ա��������____��','594��','794��','994��','1594��',2);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(6,'1927���й����ʱ��ȫ����Ա�����ѳ���____��','1����','3����','5����','10����',2);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(7,'1927��____������ʯ��____�������������䡣','4��2�գ��Ͼ�','4��12�գ��Ϻ�','4��12�գ��Ͼ�','4��2�գ��Ϻ�',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(8,'�������ѡ�ٲ����˵�����ʷ�ϵ�һ��������ɼ��ල����____�����ڵ��Ľ���ʷ������Ҫ���塣','�������','�������ίԱ��','������ίԱ��','������ɼ��ίԱ��',2);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(9,'____��־���й��������������쵼����ս��������������Ӻ���װ��ȡ��Ȩ�Ŀ�ʼ��','�������','�ϲ�����','��������','��������',1);
INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  
VALUES(10,'____�ӽ��������ת����ũ������������й����������չʷ�Ͼ��о������������㡣','�������','�ϲ�����','��������','��������',2);


delete from questions where qid=7;


create table information
(
    userID varchar2(10) primary key,
    userName varchar2(20) not null,
    userPassword varchar2(20) not null,
    userSex char(3) CHECK(userSex IN('��','Ů')),
    userBirth varchar(7),
    userAuthority varchar2(12) CHECK(userAuthority IN('��ͨ�û�','����Ա'))
);

INSERT INTO information (userID,userName,userPassword,userSex,userBirth,userAuthority)  
VALUES('admin','����','123','��','2000-01','����Ա');
INSERT INTO information (userID,userName,userPassword,userSex,userBirth,userAuthority)  
VALUES('10001','����','zxcv','Ů','2001-02','��ͨ�û�');

select * from information where userID = '10001';

update information set username='����' where userid = '10001';


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
