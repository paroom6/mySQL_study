#유저테이블에 100가지 데이터 동작이 일어났을때 발생하는 것 이벤트

insert into user_mst_tb
values (0, 'abc', '1234');

select
	*
from
	user_mst_tb;
    
select
	*
from
	user_dtl_tb;

delete 
from
	user_mst_tb
where 
	username = 'abc';
    
#함수 프로시저
set @count = 0;
call p_sum(10, 20, @result,  @count);
select 
	@result;
select 
	@count;
 
    