INSERT INTO usuarios (nome, email, telefone) VALUES
('Joao Silva', 'joao@gmail.com', '999111111'),
('Maria Santos', 'maria@gmail.com', '999222222'),
('Pedro Oliveira', 'pedro@gmail.com', '999333333'),
('Ana Costa', 'ana@gmail.com', '999444444');

INSERT INTO colaboradores (nome, email, usuarios_id, status) VALUES
('Joao Silva', 'joao.colaborador@gmail.com', 1, 'Ativo'),
('Maria Santos', 'maria.colaboradora@gmail.com', 2, 'Ativo'),
('Pedro Oliveira', 'pedro.colaborador@gmail.com', 3, 'Inativo'),
('Ana Costa', 'ana.colaboradora@gmail.com', 4, 'Ativo');

INSERT INTO projetos (nome, descricao, data_inicio) VALUES
('Sistema Escolar', 'Sistema para gerenciar alunos e notas', '2026-01-15 08:00:00'),
('Controle Financeiro', 'Sistema de controle de receitas e despesas', '2026-02-01 09:00:00'),
('Gestao de Tarefas', 'Aplicacao para organizar atividades', '2026-03-10 10:00:00');

INSERT INTO categoria (nome) VALUES
('Desenvolvimento'),
('Documentacao'),
('Testes'),
('Manutencao');

INSERT INTO tarefas (projetos_id,colaboradores_id,categoria_id,titulo,prazo,status) VALUES
(1, 2, 1, 'Criar pagina inicial', '2026-11-05', 'Ativo'),
(1, 3, 2, 'Documentar o sistema', '2026-11-10', 'Ativo'),
(2, 4, 1, 'Criar tela financeira', '2026-11-15', 'Ativo'),
(3, 5, 3, 'Testar funcionalidades', '2026-11-20', 'Ativo'),
(2, 2, 4, 'Corrigir erros', '2026-11-25', 'Inativo'),
(3, 3, 1, 'Implementar login', '2026-11-12', 'Ativo');

INSERT INTO historico_tarefas (tarefa_id, acao, descricao) VALUES
(13, 'Criacao', 'Tarefa criada no sistema'),
(14, 'Atualizacao', 'Inicio do desenvolvimento'),
(15, 'Criacao', 'Tarefa cadastrada'),
(16, 'Atualizacao', 'Desenvolvimento iniciado'),
(17, 'Criacao', 'Tarefa de testes criada'),
(18, 'Inativacao', 'Tarefa marcada como inativa');