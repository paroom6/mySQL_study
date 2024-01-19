select * from student_tb;  # *은 전체를 의미

select 
	student_id,  #컬럼명은 한 줄에 하나만
    name 
from 
	student_tb #테이블 하나당 한줄 
where 
	student_id = 1;  # from-where- select순 처리 조건 당 띄어쓰기 
#미들웨어어서 데이터 참조 where이 참인 데이터를 뽑아낸다.
 
select 
	student_id,  
    name 
from 
	student_tb 
where 
	not name = '조성민'
    and name = '조성이'; #쿼리문에는 특수기호를 최대한 배제 
 
select 
	*
from
	student_tb
where
	name in ('조성민', '조성이'); #괄호 안의 조건에 해당하면 출력

select
	*
from 
	student_tb
where
	age between 20 and 29; #나이가 20대인 사람 이상 이하 
    
select
	*
from 
	student_tb
where
	age > 29
    and  age < 40; #나이가 30대인 사람
    
select
	*
from 
	student_tb
where
	name like '김__' ; #_의 경우 글자수를 맞추어야 한다 %의 경우 같기만 하면 된다. 끝나는 단어도 __원으로 검색가능

select
	*
from 
	student_tb
where
	name like '이%원%' ; # 어디든 포함되기만 하면 된다.
    
select
	*
from 
	student_tb
where
	name like '%도%' 
    or name like '%원';
#집계 group by
select
	name,
	address,
	count(*) as address_count
from
	student_tb
group by 
	name, #둘다 같은경우 그룹으로 묶임
	address	
#having 
#	address_count > 1	#그룹화 후에 조건을 주는 경우 사용
order by 	
	address_count desc,
    address desc; 