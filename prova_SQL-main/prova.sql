create table aeronaves(
	id serial primary key,
	modelo varchar(50) not null,
	codigo_cauda varchar(10) not null unique,
	capacidade int not null check (capacidade > 0)
);

create table pilotos(
id serial primary key,
nome varchar(50) not null,
codigo_anac varchar(6) unique not null,
horas_voo int default 0 check(horas_voo >=0)
);

create table voos(
 	id serial primary key,
	 aeronaves_id int references aeronaves(id),
	 pilotos_id int references pilotos(id),
	 numero_voo varchar(50) not null,
	 origem varchar(50) not null,
	 destino varchar(50) not null,
	 data_hora timestamp default current_timestamp not null,
	 status varchar (40) default 'agendado' check(status in('Agendado', 'Em voo','Concluido','Cancelado'))
);

create table passageiros(
	id serial primary key,
	nome varchar(50) not null,
	cpf varchar(11) not null unique,
	email varchar(40) not null unique
);

create table passagens(
	id serial primary key,
	voos_id int references voos(id),
	passageiros_id int references passageiros(id),
	assento varchar(4) not null,
	classe varchar (40) default 'Economica' check(classe in('Economica', 'Executiva')),
	valor decimal(1000) check (valor >0) not null
);

insert into aeronaves (modelo, codigo_cauda, capacidade) values
('aviao1','4858745691','50'),
('aviao2','4858745692','45'),
('aviao3','4858745693','44'),
('aviao4','4858745694','43'),
('aviao5','4858745695','42')

insert into pilotos (nome, codigo_anac, horas_voo) values
('lucca', '113456', '3'),
('joao', '123356', '5'),
('adriano', '123457','67'),
('samuel', '121456', '45'),
('romulo', '126456', '12')

insert into passageiros (nome, cpf, email) values
('joao','12345678912', 'joao@gmail'),
('pedro', '12341278913', 'pedro@gmail'),
('ana','12345671232', 'ana@gmail'),
('maria', '12312378913', 'maria@gmail'),
('jose','12345123912', 'jose@gmail')

insert into voos (aeronaves_id,pilotos_id, numero_voo, origem, destino, status) values
(3,3,'1', 'saopaulo', 'floripa', 'Em voo'),
(4,4,'2', 'saojoaquim', 'urubici', 'Concluido'),
(5,5,'3', 'urupema', 'saojoaquim', 'Cancelado'),
(6,6,'4', 'urubici', 'imbituba', 'Agendado'),
(7,7,'5', 'imbituba', 'urubici', 'Em voo')

insert into passagens (voos_id,passageiros_id, assento, classe,valor) values
(16,1,'1122','Economica',150),
(17,2,'1133','Economica',150),
(18,3,'1144','Executiva',200),
(19,4,'1155','Economica',150),
(20,5,'1166', 'Executiva',200)

Q1:
SELECT 
	v.numero_voo,
	v.origem,
	v.destino,
	a.modelo,
	p.nome as piloto
FROM voos v
join aeronaves a ON v.aeronaves_id = a.id
join pilotos p on v.pilotos_id = p.id
where v.status in ('Agendado','Em voo');

Q2
SELECT
    classe,
    sum(valor) as total_arrecadado
from passagens
group by classe;


Q3  
SELECT
    pa.nome as passageiro,
    v.numero_voo,
    ps.assento,
    ps.valor
from passagens ps
join passageiros pa on ps.passageiros_id = pa.id
join voos v on ps.voos_id = v.id
where ps.classe = 'Executiva'
    and ps.valor > 800.00
order by ps.valor DESC


v1
create view vw_painel_aeroporto AS
select
    v.numero_voo,
    v.data_hora,
    v.origem,
    v.destino,
    a.modelo,
    a.codigo_cauda,
    v.status
from voos v
join aeronaves a ON v.aeronaves_id = a.id

v2
create view vw_faturamento_por_voo as
select
    v.id as voo_id,
    v.numero_voo,
    v.destino,
    count(ps.id) as quantidade_passageiros,
    coalesce(sum(ps.valor), 0) as receita_total
from voos v
left join passagens ps ON v.id = ps.voos_id
group by v.id, v.numero_voo, v.destino