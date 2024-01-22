alter table book
	rename to temp_book_tb;
create table booktemp_book_tbtemp_book_tbtemp_book_tbtemp_book_tbtemp_book_tb(
	book_id int,
    book_name varchar(100),
    author_id int,
    pubilsher_id int
);

CREATE TABLE author (
    author_id INT NOT NULL AUTO_INCREMENT,
    author VARCHAR(100) not NULL,
	PRIMARY KEY (author_id)
);

CREATE TABLE publisher (
    publisher_id INT NOT NULL AUTO_INCREMENT,
    pubilsher_name  VARCHAR(100) not NULL,
    PRIMARY KEY (publisher_id)
);
insert into author_tb(author)
SELECT 
	publisher
FROM 
	db_study.temp_book_tb
group by
	publisher
order by
	publisher;
    
insert into publisher_tb
SELECT 
	0,  
	publisher
FROM 
	db_study.temp_book_tb
group by
	publisher
order by
	publisher; -- group by로 묶어서 중복을 제거하여 입력
-- csv 파일은 쉼표로 구분됨 ANSI 인코딩만 MYSQL에서 오픈 가능 -저장시 인코딩 오류가능성 확인
-- null, 날짜형식(1900-00-01같은 에러 데이터) 확인


SELECT * FROM db_study.book;
truncate table book;

insert into book # 서명과 작가 출판사 id를 하나의 그룹으로 뭉침 동명의 저서에 다른 저자인 경우에 묶이는 것을 방지
SELECT 
	0,
    tbt.book_name,
    at.author_id,
    pt.publisher_id
FROM 
	temp_book_tb tbt
    left outer join author_tb at on (at.author = tbt.author)
    left outer join publisher_tb pt on (pt.publisher_name = tbt.publisher)
group by # 셀렉트를 한 묶음으로 
	tbt.book_name,
    at.author_id,
    pt.publisher_id
order by
	book_name;
    
insert into book_register_tb #main
select
	0,
    tbt.book_code,
    cb.book_id,
    tbt.loans_count
from	
	temp_book_tb tbt
    left outer join (select 
						b.book_id,
						b.book_name,
                        at.author,
                        pt.publisher_name
					from 
						book b 
                        left outer join author_tb at on(at.author_id = b.author_id)
                        left outer join publisher_tb pt on(pt.publisher_id = b.publisher_id)) cb 
	on(cb.book_name = tbt.book_name and cb.author = tbt.author and cb.publisher_name = tbt.publisher);
truncate table book_register_tb;
SELECT * FROM db_study.book_register_tb;

select
	*
from
(select # 왜 저 순서로 갈까?
	rank() over(partition by b.publisher_id order by b.publisher_id, sum(brt.loans_count) desc) as ranking,
	row_number() over(  by b.publisher_id order by b.publisher_id, sum(brt.loans_count) desc) as row_num,
	brt.book_id,
	b.book_name,
	b.author_id, #author가 종속되었기 때문 
	at.author,
    b.publisher_id,
    pt.publisher_name,
    sum(brt.loans_count) as total_loans_count
from
	book_register_tb brt
    left outer join book b on (b.book_id = brt.book_id)
    left outer join author_tb at on (at.author_id = b.author_id)
    left outer join publisher_tb pt on (pt.publisher_id = b.publisher_id)
group by 
	brt.book_id,
    b.author_id,
    b.publisher_id) temp_book_register_tb
    where temp_book_register_tb.row_num = 1;



