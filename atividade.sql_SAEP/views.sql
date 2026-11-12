CREATE OR REPLACE VIEW vw_painel_principal AS
select
    c.nome AS nome_colaborador,
    t.titulo as titulo_tarefa,
    ca.nome AS categoria,
    t.prazo as prazo_entrega,
    t.status AS status_atividade
FROM tarefas t
    INNER JOIN colaboradores c
        ON t.colaboradores_id = c.id
    inner JOIN categoria ca
        ON t.categoria_id = ca.id;


create or replace VIEW vw_cronograma_prazos AS
SELECT
    t.titulo AS titulo_tarefa,
    t.status as status_tarefa,
    t.prazo AS prazo_entrega,
    (t.prazo - CURRENT_DATE) as dias_restantes,
    c.nome AS responsavel

from tarefas t
INNER JOIN colaboradores c
    ON t.colaboradores_id = c.id
ORDER BY t.prazo ASC, t.id ASC;