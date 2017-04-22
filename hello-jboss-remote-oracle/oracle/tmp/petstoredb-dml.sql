insert into product (product_id_pk, name, created_dt) values (1, 'One', sysdate);
insert into product (product_id_pk, name, created_dt) values (2, 'Two', sysdate);
insert into product (product_id_pk, name, created_dt) values (3, 'Three', sysdate);
insert into product (product_id_pk, name, created_dt) values (4, 'Four', sysdate);
select 'petstoredb-dml.sql-executed' from dual;
commit;
quit