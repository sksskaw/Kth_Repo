use carDb;

create table carReserveTable(
reserveNo int(10) not null auto_increment, #�����ȣ(�ڸ�Ʈ�� -- Ȥ�� #)
user_id varchar(30) not null, #�������� id
no int not null, #DB�� �Ҵ�� ������ no[��������� no(��ȣ)]
carQty int(3) not null, #�뿩 ����
rentDuration int(3) not null, #�����뿩�Ⱓ
startDay varchar(25) not null, #�뿩 ������[Date������ ������ ����. ������.]
applyInsurance int(3) not null, #���谡�Կ���
applyBabySeat int(3) not null, #���̺� ��Ʈ ��뿩��
primary key(reserveNo)
)default charset=utf8;