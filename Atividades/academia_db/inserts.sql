INSERT INTO planos (nome_plano, mensalidade) VALUES
('Elite Fitness', 240.00),
('Performance', 155.00),
('Essencial', 105.00);

INSERT INTO modalidades (plano_id, nome_modalidade, sala_aula, limite_alunos, ativo) VALUES
(1, 'Treinamento Funcional', 'Sala Funcional', 18, TRUE),
(2, 'Pilates', 'Estudio 03', 12, TRUE),
(3, 'Musculacao', 'Sala Principal', 45, TRUE);

INSERT INTO alunos (nome_aluno, email, cpf, celular) VALUES
('Joao Mendes', 'joao.mendes@example.com', '45678912301', '(48) 99123-4567'),
('Mariana Souza', 'mariana.souza@example.com', '56789123402', '(48) 99234-5678'),
('Pedro Oliveira', 'pedro.oliveira@example.com', '67891234503', '(48) 99345-6789');

INSERT INTO matriculas (aluno_id, situacao) VALUES
(1, 'Ativa'),
(1, 'Ativa'),
(2, 'Ativa'),
(3, 'Cancelada');

INSERT INTO itens_matricula (matricula_id, modalidade_id, periodo_meses, valor_mensal, taxa_matricula) VALUES
(1, 1, 6, 240.00, 60.00),
(2, 2, 4, 155.00, 40.00),
(3, 3, 12, 105.00, 25.00),
(4, 1, 2, 240.00, 60.00);