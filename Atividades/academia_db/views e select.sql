--Q1:
CREATE VIEW vw_modalidades_custo_estimado AS
SELECT
    m.nome_modalidade AS modalidade,
    m.sala_aula,
    p.nome_plano AS plano,
    ROUND(p.mensalidade * 1.10, 2) AS mensalidade_com_taxa
FROM modalidades m
JOIN planos p ON m.plano_id = p.id
ORDER BY mensalidade_com_taxa DESC;

--Q2
CREATE VIEW vw_matriculas_ativas AS
SELECT
    a.nome_aluno AS aluno,
    a.cpf,
    mod.nome_modalidade AS modalidade,
    mod.sala_aula,
    im.periodo_meses,
    mat.data_matricula
FROM matriculas mat
JOIN alunos a ON mat.aluno_id = a.id
JOIN itens_matricula im ON mat.id = im.matricula_id
JOIN modalidades mod ON im.modalidade_id = mod.id
WHERE mat.situacao = 'Ativa';

--Q3
CREATE VIEW vw_alunos_vip AS
SELECT
    a.nome_aluno AS aluno,
    COUNT(mat.id) AS total_matriculas,
    SUM((im.valor_mensal * im.periodo_meses) + im.taxa_matricula) AS total_investido
FROM alunos a
JOIN matriculas mat ON a.id = mat.aluno_id
JOIN itens_matricula im ON mat.id = im.matricula_id
WHERE mat.situacao = 'Ativa'
GROUP BY a.id, a.nome_aluno
HAVING SUM((im.valor_mensal * im.periodo_meses) + im.taxa_matricula) > 1000.00;

--Q4
SELECT
    m.*,
    p.nome_plano,
    p.mensalidade
FROM modalidades m
JOIN planos p ON m.plano_id = p.id
WHERE m.limite_alunos >= 15
  AND p.mensalidade > 100.00
  AND m.ativo = TRUE;

--Q5:
CREATE VIEW vw_faturamento_medio_plano AS
SELECT
    p.nome_plano AS plano,
    SUM((im.valor_mensal * im.periodo_meses) + im.taxa_matricula) AS faturamento_total,
    ROUND(AVG(im.periodo_meses), 1) AS media_meses_contratados
FROM itens_matricula im
JOIN matriculas mat ON im.matricula_id = mat.id
JOIN modalidades m ON im.modalidade_id = m.id
JOIN planos p ON m.plano_id = p.id
WHERE mat.situacao = 'Ativa'
GROUP BY p.nome_plano;