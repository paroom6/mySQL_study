#join
Select
	at.num,
    at.author
from #프롬위치에 사용한 서브쿼리
	(select 
		row_number() over(order by author_id desc) as num,
        author_id,
        author
	from 
		author_tb
	where
		author like '글%') at
	where 
		num > 10;
	
select 
	pt.publisher_id,
	pt.publisher_name,
    count(ptc.publisher_name) as total_count
from 
	publisher_tb pt
    left outer join publisher_tb ptc on (1 = 1)
group by 
	pt.publisher_name;

select # 조회할 데이터 컬럼을 만들때 마다 select 한번, where 조건식에 서브쿼리 사용시 캐싱처리(저장) 
	*,
    (select # count를 서브쿼리로 빼고 값만 챙긴다.
		count(*)
	from 
		publisher_tb) as total_count
from
	publisher_tb;

select # 추출할 데이터
	*
from # 테이블 한번 당 select 1번
	publisher_tb pt
    left outer join (select
						count(*) as total_count
					from
						publisher_tb ) pt2 on (1 = 1);
    
select
	*
from
	book
where
	publisher_id in (select publisher_id from publisher_tb where publisher_name like '아%'); #한번 결정된 값과 데이터 값 비교
        
select
	*
from
	book b
	left outer join publisher_tb pt on (pt.publisher_id = b.publisher_id) #조건식이 데이터 수의 곱만큼 시행
where
	pt.publisher_name like '아%';


select @@profiling;
show profiles;
set profiling = 1;
 