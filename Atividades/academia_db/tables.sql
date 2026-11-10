CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome_aluno VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    data_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE planos (
    id SERIAL PRIMARY KEY,
    nome_plano VARCHAR(60) UNIQUE NOT NULL,
    mensalidade DECIMAL(10,2) NOT NULL CHECK (mensalidade > 0)
);

CREATE TABLE modalidades (
    id SERIAL PRIMARY KEY,
    plano_id INT REFERENCES planos(id),
    nome_modalidade VARCHAR(100) NOT NULL,
    sala_aula VARCHAR(30) NOT NULL,
    limite_alunos INT NOT NULL CHECK (limite_alunos > 0),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE matriculas (
    id SERIAL PRIMARY KEY,
    aluno_id INT REFERENCES alunos(id),
    data_matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    situacao VARCHAR(20) DEFAULT 'Ativa'
        CHECK (situacao IN ('Ativa', 'Cancelada', 'Trancada'))
);

CREATE TABLE itens_matricula (
    id SERIAL PRIMARY KEY,
    matricula_id INT REFERENCES matriculas(id),
    modalidade_id INT REFERENCES modalidades(id),
    periodo_meses INT NOT NULL CHECK (periodo_meses > 0),
    valor_mensal DECIMAL(10,2) NOT NULL CHECK (valor_mensal > 0),
    taxa_matricula DECIMAL(10,2) DEFAULT 0.00 CHECK (taxa_matricula >= 0)
);