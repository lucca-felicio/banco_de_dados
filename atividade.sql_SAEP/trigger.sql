CREATE OR REPLACE FUNCTION fn_validar_tarefa()
RETURNS TRIGGER AS $$
DECLARE
    v_status VARCHAR(20);
BEGIN
    SELECT status INTO v_status
    FROM colaboradores
    WHERE id = NEW.colaboradores_id;

    IF NOT FOUND OR v_status IS DISTINCT FROM 'Ativo' THEN
        RAISE EXCEPTION 'O colaborador informado nao existe ou esta inativo.';
    END IF;

    NEW.data_criacao := CURRENT_TIMESTAMP;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_validar_tarefa ON tarefas;

CREATE TRIGGER trg_validar_tarefa
BEFORE INSERT ON tarefas
FOR EACH ROW
EXECUTE FUNCTION fn_validar_tarefa();


CREATE OR REPLACE FUNCTION fn_registrar_historico()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO historico_tarefas (tarefa_id, acao, descricao)
    VALUES (
        NEW.id,
        'Criacao',
        'Tarefa cadastrada'
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_registrar_historico ON tarefas;

CREATE TRIGGER trg_registrar_historico
AFTER INSERT ON tarefas
FOR EACH ROW
EXECUTE FUNCTION fn_registrar_historico();