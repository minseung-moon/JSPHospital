create user abc identified by 1234;
grant dba, connect, resource to abc;

create table patient(
no char(4) primary key,
name varchar2(20),
birth char(8),
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4),
city char(2)
);
create sequence pa_seq
start with 1001
increment by 1;

insert into patient values(pa_seq.nextval,'김환자','19850301','M','010','2222','0001','10');
insert into patient values(pa_seq.nextval,'이환자','19900301','M','010','2222','0002','20');
insert into patient values(pa_seq.nextval,'박환자','19770301','F','010','2222','0003','30');
insert into patient values(pa_seq.nextval,'조환자','19650301','F','010','2222','0004','10');
insert into patient values(pa_seq.nextval,'황환자','19400301','M','010','2222','0005','40');
insert into patient values(pa_seq.nextval,'양환자','19440301','F','010','2222','0006','40');
insert into patient values(pa_seq.nextval,'허환자','19760301','F','010','2222','0007','10');

create table lab_test(
code char(4) primary key,
name varchar2(20)
);

insert into lab_test values('T001','결핵');
insert into lab_test values('T002','장티푸스');
insert into lab_test values('T003','수두');
insert into lab_test values('T004','홍역');
insert into lab_test values('T005','콜레라');

create table result (
no char(4),
code char(4),
sdate date,
status char(1),
ldate date,
result char(1),
primary key(no,code,sdate)
);


insert into result values('1001','T001','2020-01-01','1','2020-01-02','X');
insert into result values('1002','T002','2020-01-01','2','2020-01-02','P');
insert into result values('1003','T003','2020-01-01','2','2020-01-02','N');
insert into result values('1004','T004','2020-01-01','2','2020-01-02','P');
insert into result values('1005','T005','2020-01-01','2','2020-01-02','P');
insert into result values('1006','T001','2020-01-01','2','2020-01-02','N')

insert into result values('1007','T002','2020-01-01','2','2020-01-02','P');
insert into result values('1005','T003','2020-01-01','2','2020-01-02','P');
insert into result values('1006','T004','2020-01-01','2','2020-01-02','N');
insert into result values('1007','T005','2020-01-01','2','2020-01-02','N');
