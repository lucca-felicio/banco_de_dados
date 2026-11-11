--Autenticação
CREATE OR REPLACE FUNCTION fn_buscar_colaboradores(termo_busca TEXT)

RETURNS TABLE (
    id_colaborador INT,
    nome_colaborador VARCHAR(50),
    email_colaborador VARCHAR(50),
    status_colaborador VARCHAR(20)
)

AS $$
BEGIN
    RETURN QUERY

    SELECT
        c.id,
        c.nome,
        c.email,
        c.status

    FROM colaboradores c
    WHERE
        c.nome ILIKE '%' || termo_busca || '%'
        OR c.email ILIKE '%' || termo_busca || '%';
END;
$$ LANGUAGE plpgsql;


--Busca de Colaboradores
CREATE OR REPLACE FUNCTION fn_buscar_colaboradores(termo_busca TEXT)
returns table (
    id_colaborador INT,
    nome_colaborador VARCHAR(50),
    email_colaborador VARCHAR(50),
    status_colaborador VARCHAR(20)
)
AS $$

BEGIN
    RETURN QUERY

    SELECT
        c.id,
        c.nome,
        c.email,
        c.status
    FROM colaboradores c

    WHERE
        c.nome ILIKE '%' || termo_busca || '%'
        OR c.email ILIKE '%' || termo_busca || '%';
END;
$$ LANGUAGE plpgsql;