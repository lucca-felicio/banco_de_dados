insert into usuarios (nome, email, telefone) values
('Joao Silva', 'joao@gmail.com', '999112581'),
('Maria Santos', 'maria@gmail.com', '994622222'),
('Pedro Oliveira', 'pedro@gmail.com', '995843333'),
('Ana Costa', 'ana@gmail.com', '999956444');


insert into colaboradores (nome, email, usuarios_id, status) values
('Joao Silva', 'joao@gmail.com', 1, 'Ativo'),
('Maria Santos', 'maria@gmail.com', 2, 'Ativo'),
('Pedro Oliveira', 'pedro@gmail.com', 3, 'Inativo'),
('Ana Costa', 'ana@gmail.com', 4, 'Ativo');


insert into projetos (nome, descricao, data_inicio) values
('Sistema Escolar', 'Sistema para gerenciar alunos e notas', '2026-01-15 08:00:00'),
('Controle Financeiro', 'Sistema de controle de receitas e despesas', '2026-02-01 09:00:00'),
('Gestao de Tarefas', 'Aplicacao para organizar atividades', '2026-03-10 10:00:00');


insert into categoria (nome) values
('Desenvolvimento'),
('Documentacao'),
('Testes'),
('Manutencao');


insert into tarefas (projetos_id, colaboradores_id, categoria_id, titulo, prazo, status) values
(1, 2, 1, 'Criar pagina inicial', '2026-11-05', 'Ativo'),
(1, 1, 2, 'Documentar o sistema', '2026-11-10', 'Ativo'),
(2, 4, 1, 'Criar tela financeira', '2026-11-15', 'Ativo'),
(3, 1, 3, 'Testar funcionalidades', '2026-11-20', 'Ativo'),
(2, 2, 4, 'Corrigir erros', '2026-11-25', 'Inativo'),
(3, 4, 1, 'Implementar login', '2026-11-12', 'Ativo');


insert into historico_tarefas (tarefa_id, acao, descricao) values
(1, 'Criacao', 'Tarefa criada no sistema'),
(2, 'Atualizacao', 'Inicio do desenvolvimento'),
(3, 'Criacao', 'Tarefa cadastrada'),
(4, 'Atualizacao', 'Desenvolvimento iniciado'),
(5, 'Criacao', 'Tarefa de testes criada'),
(6, 'Inativacao', 'Tarefa marcada como inativa');