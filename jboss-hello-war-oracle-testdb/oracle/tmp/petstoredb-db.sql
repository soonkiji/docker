create tablespace petstoredb datafile 'petstoredb.dbf' size 50m autoextend on next 10m maxsize unlimited;   
create user petstoreuser identified by petstorepass default tablespace petstoredb;                         
grant connect to petstoreuser;                                                                          
grant resource to petstoreuser;                                                                         
grant alter session to petstoreuser;                                                                    
grant create cluster to petstoreuser;                                                                   
grant create database link to petstoreuser;                                                             
grant create procedure to petstoreuser;                                                                 
grant create sequence to petstoreuser;                                                                  
grant create session to petstoreuser;                                                                   
grant create synonym to petstoreuser;                                                                   
grant create table to petstoreuser;                                                                     
grant create view to petstoreuser;                                                                      
grant create type to petstoreuser;                                                                      
quit