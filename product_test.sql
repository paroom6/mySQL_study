use test_product;
insert into product_tb 
	( product_name, product_size, product_color, product_price) #id 같은경우 무조건 AI지정
values 
	('모헤어 브이넥 앙고라 니트', 'S', 'Black', 37400),
	('모헤어 브이넥 앙고라 니트', 'M', 'Black', 37400),
	('모헤어 브이넥 앙고라 니트', 'L', 'Black', 37400),
	('모헤어 브이넥 앙고라 니트', 'XL', 'Black', 37400),
	('콘테 코듀로이 와이드 밴딩 팬츠', 'S', 'Whilte', 38000),
	('콘테 코듀로이 와이드 밴딩 팬츠', 'M', 'Whilte', 38000),
	('콘테 코듀로이 와이드 밴딩 팬츠', 'L', 'Whilte', 38000),
	('콘테 코듀로이 와이드 밴딩 팬츠', 'XL', 'Whilte', 38000),
	('콘테 코듀로이 와이드 밴딩 팬츠', 'XXL', 'Whilte', 38000),
	('버티칼 투웨어 골지 양털 집업', 'M', 'Navy', 49000),
	('버티칼 투웨어 골지 양털 집업', 'L', 'Navy', 49000),
	('버티칼 투웨어 골지 양털 집업', 'XL', 'Navy', 49000),
	('버티칼 투웨어 골지 양털 집업', 'XL', 'Navy', 49000),
	('반집업 꽈배기 카라니트', 'SS', 'Whilte', 48000),
	('반집업 꽈배기 카라니트', 'S', 'Whilte', 48000),
	('반집업 꽈배기 카라니트', 'M', 'Whilte', 48000),
	('반집업 꽈배기 카라니트', 'L', 'Whilte', 48000),
	('반집업 꽈배기 카라니트', 'XL', 'Whilte', 48000),
	('후드 MA-1 패딩 점퍼', 'S', 'Black', 62000),
	('후드 MA-1 패딩 점퍼', 'M', 'Black', 62000),
	('후드 MA-1 패딩 점퍼', 'L', 'Black', 62000),
	('후드 MA-1 패딩 점퍼', 'XL', 'Black', 62000);
    
select
	product_color,
    count(product_color) as product_color_count  #count(*) null이 존재할 경우 카운팅이 안될 수 있다.
from 
	product_tb
group by
	product_color;

select
	product_size,
    count(product_size) as product_size_count
from 
	product_tb
group by
	product_size;

#1 제1정규화 하나의 값만
#2 제2정규화시 테이블의 용도를 확실히 구분하고 분리/ parcial dependcy 제거
# 제 3 정규형  