create tablespace testdb datafile 'testdb.dbf' size 50m autoextend on next 10m maxsize unlimited;
create user testuser identified by testpass default tablespace testdb;
grant connect to testuser;
grant resource to testuser;
grant alter session to testuser;
grant create cluster to testuser;
grant create database link to testuser;
grant create procedure to testuser;
grant create sequence to testuser;
grant create session to testuser;
grant create synonym to testuser;
grant create table to testuser;
grant create view to testuser;
grant create type to testuser;
quit