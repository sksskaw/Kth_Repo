use carDb;

create table carReserveTable(
reserveNo int(10) not null auto_increment, #예약번호(코멘트는 -- 혹은 #)
user_id varchar(30) not null, #예약자의 id
no int not null, #DB에 할당된 고유의 no[등록차량의 no(번호)]
carQty int(3) not null, #대여 수량
rentDuration int(3) not null, #차량대여기간
startDay varchar(25) not null, #대여 시작일[Date변수를 쓸수도 있음. 복잡함.]
applyInsurance int(3) not null, #보험가입여부
applyBabySeat int(3) not null, #베이비 시트 사용여부
primary key(reserveNo)
)default charset=utf8;