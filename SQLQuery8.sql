CREATE TRIGGER trg_locar_filme
ON LOCACOES
AFTER INSERT
AS
BEGIN
    UPDATE F
    SET 
        STATUS = 'Alugado',
        RESERVADA = 's'
    FROM FILME F
    INNER JOIN INSERTED I 
        ON F.COD_FILME = I.COD_FILME
END
go
CREATE TRIGGER trg_devolver_filme
ON LOCACOES
AFTER UPDATE
AS
BEGIN
    -- Só atualiza quando houver devolução
    IF UPDATE(DATA_DEVOLUCAO)
    BEGIN
        UPDATE F
        SET 
            STATUS = 'Disponivel',
            RESERVADA = 'n'
        FROM FILME F
        INNER JOIN INSERTED I 
            ON F.COD_FILME = I.COD_FILME
    END
END
go

UPDATE LOCACOES
SET DATA_DEVOLUCAO = GETDATE()
WHERE COD_LOCACAO = 4

select * from FILME