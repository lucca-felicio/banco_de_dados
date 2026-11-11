CREATE OR REPLACE FUNCTION fn_valida_estoque_minimo()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantidade < 0 THEN
        RAISE EXCEPTION 'Quantidade invalida para o item "%". Valor: %',
            NEW.nome_item, NEW.quantidade;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


create table estoque (
    id serial primary key,
    nome_item varchar(100) not null,
    quantidade int default 0 not null
);


CREATE TRIGGER trg_valida_estoque
BEFORE INSERT OR UPDATE ON estoque
FOR EACH ROW
EXECUTE FUNCTION fn_valida_estoque_minimo();