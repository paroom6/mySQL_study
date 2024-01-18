use db_study;

insert into student_tb(student_id, name, age, address) values (0,'조성민',25,'부산진구');
insert into student_tb(address, name, age, student_id) values ('양정','조성민',25,2);#컴포지드 primary key 둘 이상의 primary key를 지정한 경우 모든 키가 같은경우만 같다고 본다. 
insert into student_tb(name, address) values ('조성민', null); #notnull의 경우 생략가능
insert into student_tb values (0, '조성민', null, null); #컬럼명을 생략할 경우 값을 컬럼순대로 모두 대입하면 입력이 된다.

insert into student_tb values (0, '조성민', null, null), (0,'조성이', null, null); 

insert into student_tb 
	(student_id, name, age, address)#컬럼명
values #밸류룰 기준으로 하나씩 
	(0, '조성민', null, null), 	
	(0,'조성이', null, null); 

/*
	10명의 학생의 데이터 추가
    김도균 27 부산 금정구
    김도후 25 부산 부산진구
    김범수 33 부산 금정구
    김상현 26 부산 남구
    이재영 26 부산 서구
    이정찬 29 부산 부산진구
    이지언 26 부산 동래구 
    이편원 30 경상남도 양산시
    전주환 30 부산 부산진구
    심재원 29 부산 남구 
*/
insert into student_tb
	(name, age, address) 
values 
	('김도균', 27 , '부산 금정구'),
    ('김도후', 25, '부산 부산진구'),
    ('김도후', 25, '부산 부산진구'),
    ('김범수', 33, '부산 금정구'),
    ('김상현', 26, '부산 남구'),
    ('이재영', 26, '부산 서구'),
    ('이정찬', 29, '부산 부산진구'),
    ('이지언', 26, '부산 동래구'),
    ('이편원', 30, '경상남도 양산시'),
	('전주환', 30, '부산 부산진구'), 
    ('심재원', 29, '부산 남구');



