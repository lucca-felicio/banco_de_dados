CREATE OR REPLACE VIEW vw_painel_principal AS
SELECT
    c.nome AS nome_colaborador,
    t.titulo AS titulo_tarefa,
    ca.nome AS categoria,
    t.prazo AS prazo_entrega,
    t.status AS status_atividade

FROM tarefas t

INNER JOIN colaboradores c
ON t.colaboradores_id = c.id

INNER JOIN categoria ca
ON t.categoria_id = ca.id;


CREATE OR REPLACE VIEW vw_cronograma_prazos AS
SELECT
    t.titulo AS titulo_tarefa,
    t.status AS status_tarefa,
    t.prazo AS prazo_entrega,
    (t.prazo::DATE - CURRENT_DATE) AS dias_restantes,
    c.nome AS responsavel
FROM tarefas t
INNER JOIN colaboradores c
ON t.colaboradores_id = c.id

order by t.prazo:: date asc;