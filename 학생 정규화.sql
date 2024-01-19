insert into student_address1
values
	(0,'부산시'),
	(0,'경산남도');
insert into student_address2
values
	(0,'금정구'),
	(0,'부산진구'),
	(0,'남구'),
	(0,'서구'),
	(0,'동래구'),
	(0,'양산시');

insert into student_register (name, age, student_address1_id, student_address2_id)  #정규화는 분해하는것 같은 테이블도 알리아스만 다르면 재조인가능 
value 
	('김도균', 27, 1, 1),
    ('김도후', 25, 1, 2),
    ('김범수', 33, 1, 1),
    ('김상현', 26, 1, 3),
    ('이재영', 26, 1, 4),
    ('이정찬', 29, 1, 2),
    ('이지언', 26, 1, 5),
    ('이편원', 30, 2, 6),
	('전주환', 30, 1, 2), 
    ('심재원', 29, 1, 3);
select 
	sr.student_register_id,
    sr.name,
    sr.age,
    sr.student_address1_id,
    sa.address1,
    sr.student_address2_id,
    sa2.address2
from 
	student_register sr
    left outer join student_address1 sa on (sa.student_address1_id = sr.student_address1_id)
    left outer join student_address2 sa2 on (sa2.student_address2_id = sr.student_address2_id);

