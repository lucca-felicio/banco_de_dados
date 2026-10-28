create table usuarios (
	id serial primary key,
	nome varchar(50) not null,
	email varchar(50) not null unique,
	telefone varchar(9) not null
);

create table colaboradores (
	id serial primary key,
	nome varchar(50) not null,
	email varchar(50) not null unique,
	usuarios_id int references usuarios(id),
	status varchar(20) default 'Ativo' check (status in ('Ativo, Inativo')) 
);

create table projetos(
	id serial primary key,
	nome varchar(40) not null,
	descricao varchar(100) not null,
	data_inicio timestamp default current_timestamp
);

create table categoria (
	id serial primary key,
	nome varchar (30)
);

create table tarefas(
	id serial primary key,
	projetos_id int references projetos(id),
	colaboradores_id int references colaboradores(id),
	categoria_id int references categoria(id),
	titulo varchar(40) not null,
	prazo varchar(30) not null,
	status varchar(20) default 'Ativo' check (status in ('Ativo', 'Inativo')),
	data_criacao timestamp default current_timestamp
);

create table historico_tarefas (
	id serial primary key,
	tarefa_id int references tarefas(id),
	acao varchar(50) not null,
	descricao varchar(50) not null,
	data_hora timestamp default current_timestamp
);