update product_color_tb
set product_color_name = 'Green'
where 
	product_color_name = 'Navy';

update product_color_tb
set product_color_name_kor = '그린'
where 
	product_color_name = 'Green';
    
update product_color_tb
set 
	product_color_name_kor = case 
		when product_color_name = 'Black' then '불랙' 
		when product_color_name = 'White' then '화이트' 
		when product_color_name = 'Green' then '그린'
end; #조건문 case로 열고 end 닫는다  when 조건 then 결과

delete
from
	product_register_tb#전체 데이터 삭제 생각다시해보고 시도 delete는 join 불가
where					#특별한 상황이 아니면 키값으로 지움
	product_color_id = (select  #서브쿼리 ()로 묶어서 사용 결과값이 하나여야만함 2이상이면 in으로 처리
							product_color_id
						from
							product_color_tb
						where
							product_color_name = 'Black');

select
	*
from
	product_register_view; 
    
#트랜잭션, 트리거, 저장프로시저, 일반함수