 select ad from asdf  --asdffffffffffffffffffffffffffff
ss
;
--------------------------------------------------------------
--md5���ܺ���
CREATE OR REPLACE FUNCTION MD5(passwd IN VARCHAR2) RETURN VARCHAR2 IS retval varchar2(32);
BEGIN
 retval := Lower(utl_raw.cast_to_raw( DBMS_OBFUSCATION_TOOLKIT.MD5(INPUT_STRING => passwd)) );
 RETURN retval;
END;


drop table idownload;
create table download(id varchar(20), name varchar(128), filesize varchar(20), type varchar(10), path varchar(128));


--�����������¼��, type����text/voice/photo/file����Ӧmsg�洢textmsg,filepath, status 0δ����1�Ѿ�����
drop table tb_user_msg;
create table tb_user_msg(fromid varchar(20), toid varchar(20),type varchar(10), status varchar(10), time date, msg varchar(512));
 
--Ⱥ�����¼������Ⱥ 
drop table tb_group_msg;
create table tb_group_msg(groupid varchar(20), fromid varchar(20),type varchar(20), time date, msg varchar(512));
--���˻Ự�б� 
drop table tb_user_session;
create table tb_user_session (id varchar(20), toid varchar(20), type varchar(10) ,primary key(id, toid, type)  );  
--alter table tb_user_session modify (primary key(id, toid, type)  );
    
--��������
drop table tb_add_apply;
create table tb_add_apply(type varchar(10), status varchar(20), fromid varchar(20), toid varchar(20), nickname varchar(80), yanzhen varchar(200), time date, primary key(fromid, toid) );
--Ⱥ���ϵ��
drop table tb_user_group;
create table tb_user_group(userid varchar(20), groupid varchar(20),nickname varchar(80), time date, primary key(userid,groupid) );
 --���ѹ�ϵ��
drop table tb_user_user;
create table tb_user_user(userid varchar(20), friendid varchar(20), nickname varchar(80), time date, primary key(userid, friendid) );
--��½��Ϣ��
 drop  table tb_login_info  ;
create table tb_login_info( time date, id varchar(20), username varchar(80), ip varchar(20), status varchar(10) );
--�û���
drop  table tb_user  ;
create table tb_user( id varchar(20), username varchar(80), email varchar(20) unique, sex varchar(10), pwd varchar(50),profilepath varchar(200) default 'http://10.18.176.187:8080/MyCCHttpServer/Dispatch?type=profile&id=000',profilepathwall varchar(200) default 'http://10.18.176.187:8080/MyCCHttpServer/Dispatch?type=profilewall&id=000', sign varchar(200) default '' , primary key(id) );

--alter table tb_user modify (profilepath varchar(200) default ' ',profilepathwall varchar(200) default ' ', sign varchar(200) default ' ');

insert into tb_user values ('1424234500','CC', '1424234500@qq.com','Ů','123','000', 'id=000', '�����������(�ѩn��)');
insert into tb_user values ('admin','AA', '1424234500@admin.com','����','123','000', 'id=000', '����Ա��');

--������ܣ�MD5 cccc + id + pwd
update  tb_user set pwd=MD5('cc'||id||MD5('cc'||id||'qwer')) where id='admin';

 

--Ⱥ���
drop  table tb_group  ;
create table tb_group( id varchar(20), creatorId varchar(20) not null, username varchar(80) not null, profilepath varchar(200) default '',profilepathwall varchar(200) default '', sign varchar(200) default 'there should be some word',  num varchar(10) default '0' not null , checked varchar(10) default 'true' , primary key(id) );




--���� ���
ALTER TABLE  tb_login_info ADD  FOREIGN KEY(id ) REFERENCES tb_user(id);
ALTER TABLE  tb_user_user ADD  FOREIGN KEY(userid ) REFERENCES tb_user(id);
ALTER TABLE  tb_user_user ADD  FOREIGN KEY(friendid ) REFERENCES tb_user(id);
ALTER TABLE  tb_user_group ADD  FOREIGN KEY(userid ) REFERENCES tb_user(id);
ALTER TABLE  tb_user_group ADD  FOREIGN KEY(groupid ) REFERENCES tb_group(id); 
ALTER TABLE  tb_user_msg ADD  FOREIGN KEY(fromid ) REFERENCES tb_user(id);
ALTER TABLE  tb_user_msg ADD  FOREIGN KEY(toid ) REFERENCES tb_user(id);
ALTER TABLE  tb_group_msg ADD  FOREIGN KEY(fromid ) REFERENCES tb_user(id);
ALTER TABLE  tb_group_msg ADD  FOREIGN KEY(groupid ) REFERENCES tb_group(id);


delete from tb_user_user  ; 
 delete from  tb_login_info  ;
delete from tb_user_session ;  
delete from tb_add_apply;   
 delete  from tb_user_msg  ;
 delete  from tb_group_msg ;
  delete from tb_user_group ;
 delete  from tb_user ;
 delete  from tb_group ;
delete from table download;


alter table tb_group add( checked varchar(10) default 'true' );
