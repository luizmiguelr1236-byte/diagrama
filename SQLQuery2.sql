create table funcinfo(
nome varchar(100),
mesnasc varchar(2),
sexo char
);

insert into funcinfo values('claudisney vandilesco da silva','12', 'm')
insert into funcinfo values('ana','12', 'f')
insert into funcinfo values('joão da silva','11', 'm')
insert into funcinfo values('joão silva','00', 'm')

create procedure sla5 @mes int as
begin 
select  * from funcinfo where mesnasc = @mes
if mesnasc == '00'
	

end;

exec sla4 @mes=00

create procedure resumo_aniversariantes
