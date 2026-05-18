DROP TABLE Produto
DROP TABLE moviment
DROP TABLE saldo

create table Produto (
id_prod int primary key identity(1,1),
nome text,
descricao text,
uni int,
preco float
);

create table moviment(
id_mov int primary key identity(1,1),
id_prod int,
descricao text,
tipo char(1) /*default 'E'*/,
qtd int,
foreign key (id_prod) references Produto(id_prod)
);

create table saldo (
 id_prod int primary key,
 qtd int,
 precototal int,
 foreign key (id_prod) references Produto(id_prod)
);

create table dividas(
 id_par int primary key identity(1,1),
 nome text,
 parcelas int,
 valor_parcela float,
 data_parcela date
);

create table dias(
 dia date,
 n_dia text,
 dia_e char (1)
);
CREATE TABLE Calendario (
    DataCompleta DATE PRIMARY KEY,
    Ano INT,
    Mes INT,
    NomeMes VARCHAR(20),
    Dia INT,
    NomeDiaSemana VARCHAR(20),
    NumeroDiaSemana INT,
    Trimestre INT,
    SemanaAno INT,
    EhFimSemana BIT,
    EhFeriado BIT
);
  
 --é o calendario
	DECLARE @DataInicial DATE = '2026-01-01';
DECLARE @DataFinal DATE = '2030-12-31';

WHILE @DataInicial <= @DataFinal
BEGIN
    INSERT INTO Calendario (
        DataCompleta,
        Ano,
        Mes,
        NomeMes,
        Dia,
        NomeDiaSemana,
        NumeroDiaSemana,
        Trimestre,
        SemanaAno,
        EhFimSemana,
        EhFeriado
    )
    VALUES (
        @DataInicial,
        YEAR(@DataInicial),
        MONTH(@DataInicial),
        DATENAME(MONTH, @DataInicial),
        DAY(@DataInicial),
        DATENAME(WEEKDAY, @DataInicial),
        DATEPART(WEEKDAY, @DataInicial),
        DATEPART(QUARTER, @DataInicial),
        DATEPART(WEEK, @DataInicial),
        CASE 
            WHEN DATEPART(WEEKDAY, @DataInicial) IN (1,7)
            THEN 1 ELSE 0
        END,
		0
    );

    SET @DataInicial = DATEADD(DAY, 1, @DataInicial);
END;

UPDATE Calendario
SET EhFeriado = 1
WHERE
    (MONTH(DataCompleta) = 1 AND DAY(DataCompleta) = 1)
    OR
    (MONTH(DataCompleta) = 12 AND DAY(DataCompleta) = 25)
    OR
    (MONTH(DataCompleta) = 5 AND DAY(DataCompleta) = 1)
    OR
    (YEAR(DataCompleta) = 2026 AND MONTH(DataCompleta) = 4 AND DAY(DataCompleta) = 3 AND NomeDiaSemana = 'Sexta-Feira')
    OR
    (MONTH(DataCompleta) = 4 AND DAY(DataCompleta) = 21)
    OR
    (MONTH(DataCompleta) = 11 AND DAY(DataCompleta) = 20)
    OR
    (MONTH(DataCompleta) = 11 AND DAY(DataCompleta) = 15)
    OR
    (MONTH(DataCompleta) = 10 AND DAY(DataCompleta) = 12)
    OR
    (MONTH(DataCompleta) = 9 AND DAY(DataCompleta) = 7)
    OR
    (YEAR(DataCompleta) = 2026 AND MONTH(DataCompleta) = 2 AND DAY(DataCompleta) = 17)
    OR
    (YEAR(DataCompleta) = 2026 AND MONTH(DataCompleta) = 2 AND DAY(DataCompleta) = 17)
	;
	SELECT *
FROM Calendario
WHERE EhFimSemana = 0
  AND EhFeriado = 1;

  /*
| Ano  | Carnaval | Paixão de Cristo   |corpus Christi|
| ---- | -------- | -------------------|--------------|
| 2024 | 13/02    | 29/03              |0/05          |
| 2025 | 04/03    | 18/04              |19/06         |
| 2026 | 17/02    | 03/04              |04/06         |
| 2027 | 09/02    | 26/03              |07/05         | 
| 2028 | 29/02    | 14/04              |15/06         |
| 2029 | 13/02    | 30/03              |31/05         |
| 2030 | 05/03    | 19/04              |20/06         |

  */



alter table saldo alter column precototal float
/*drop table saldo*/
	insert into Produto (nome, descricao, uni, preco) values ('Televisão LG 2025 4K UHD', 'televisão da marca LG',213,3580.99)
	insert into Produto (nome, descricao, uni, preco) values ('Geladeira Brastemp Frost Free', 'geladeira da marca Brastemp', 120, 2899.90);
	insert into Produto (nome, descricao, uni, preco) values ('Smartphone Samsung Galaxy S24', 'smartphone da marca Samsung', 350, 4599.00);
	insert into Produto (nome, descricao, uni, preco) values ('Notebook Dell Inspiron 15', 'notebook da marca Dell', 95, 2799.99);
	insert into Produto (nome, descricao, uni, preco) values ('Micro-ondas Electrolux 30L', 'micro-ondas da marca Electrolux', 180, 899.90);
	insert into Produto (nome, descricao, uni, preco) values ('Máquina de Lavar Consul 12kg', 'máquina de lavar da marca Consul', 140, 1899.00);
	insert into Produto (nome, descricao, uni, preco) values ('Ar Condicionado Split LG 12000 BTUs', 'ar condicionado da marca LG', 75, 2199.99);
	insert into Produto (nome, descricao, uni, preco) values ('Fone de Ouvido 668bt JBL Bluetooth', 'fone da marca JBL', 500, 299.90);
	insert into Produto (nome, descricao, uni, preco) values ('Caixa de Som Sony 500W', 'caixa de som da marca Sony', 60, 1999.00);
	insert into Produto (nome, descricao, uni, preco) values ('Monitor Samsung 27 Polegadas QHD', 'monitor da marca Samsung', 130, 1399.99);
	insert into Produto (nome, descricao, uni, preco) values ('Teclado Mecânico Redragon', 'teclado gamer da marca Redragon', 220, 249.90);
	insert into Produto (nome, descricao, uni, preco) values ('Mouse Logitech G502', 'mouse gamer da marca Logitech', 300, 199.99);
	insert into Produto (nome, descricao, uni, preco) values ('Impressora HP DeskJet', 'impressora da marca HP', 110, 599.90);
	insert into Produto (nome, descricao, uni, preco) values ('Tablet Apple iPad 10ª Geração', 'tablet da marca Apple', 80, 6299.00);
	insert into Produto (nome, descricao, uni, preco) values ('Smartwatch Xiaomi Mi Band 8', 'smartwatch da marca Xiaomi', 270, 349.90);
	insert into Produto (nome, descricao, uni, preco) values ('Cafeteira Nespresso Essenza Mini', 'cafeteira da marca Nespresso', 160, 499.99);
	insert into Produto (nome, descricao, uni, preco) values ('Liquidificador Philips Walita', 'liquidificador da marca Philips', 210, 189.90);
	insert into Produto (nome, descricao, uni, preco) values ('Ventilador Mondial 40cm', 'ventilador da marca Mondial', 190, 149.90);
	insert into Produto (nome, descricao, uni, preco) values ('Roteador TP-Link Dual Band', 'roteador da marca TP-Link', 175, 229.90);
	insert into Produto (nome, descricao, uni, preco) values ('HD Externo Seagate 1TB', 'hd externo da marca Seagate', 145, 549.99);
	insert into Produto (nome, descricao, uni, preco) values ('PlayStation 5 PRO Sony', 'console da marca Sony', 50, 7999.90);

select * from saldo
select * from saldo where id_prod = 18;
insert into moviment (id_prod, descricao, tipo, qtd)
values (18, 'Saída teste', 's', 2);
go
create or alter trigger moviment_saldo
on moviment
after insert
as
begin
    set nocount on;

    update s
    set 
        s.qtd = s.qtd + 
            case 
                when i.tipo = 'E' then i.qtd
                when i.tipo = 'S' then -i.qtd
            end,
        s.precototal = 
            (s.qtd + 
                case 
                    when i.tipo = 'E' then i.qtd
                    when i.tipo = 'S' then -i.qtd
                end
            ) * p.preco
    from saldo s
    join inserted i on s.id_prod = i.id_prod
    join Produto p on p.id_prod = s.id_prod;

end;
go