#Procedures
set @book_name = '송사무장의 실전경매3'; #무조건 스네이크 표기법
set @author = '송희창3';
set @publisher = '지혜로3';
set @insert_book_status = 0;

insert into author_tb
values (0, @author);

insert into publisher_tb
values (0, @publisher);

select 
	max(author_id) into @new_author_id
from 
	author_tb;

select 
	max(publisher_id) into @new_publisher_id
from 
	publisher_tb;

insert into book
values (0, @book_name, @new_author_id, @new_publisher_id);

select #insert 실패시 ai 발생 과대 증가될 수도 있다.
	*
from
	book;

-- 트렌젝셔널  start rollback commit p_insert_book    
call p_insert_book(@book_name, @author, @publisher, @insert_book_status);    

select #insert 실패시 ai 발생 과대 증가될 수도 있다.
	*
from
	book
order by
	book_id desc;

select
	@insert_book_status;

select auto_increment from information_schema
