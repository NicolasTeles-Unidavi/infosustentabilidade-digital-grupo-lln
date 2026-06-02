-- Criação da Tabela Principal
CREATE TABLE pontos_coleta (
    id_ponto SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    contato VARCHAR(50),
    link_maps VARCHAR(500)
);

-- Criação da Tabela de Materiais Aceitos
CREATE TABLE materiais_aceitos (
    id_material SERIAL PRIMARY KEY,
    id_ponto INT NOT NULL,
    tipo_material VARCHAR(100),
    aceita CHAR(1),
    observacao VARCHAR(255),
    FOREIGN KEY (id_ponto) REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE
);

-- Criação da Tabela de Procedimentos
CREATE TABLE procedimentos_descarte (
    id_procedimento SERIAL PRIMARY KEY,
    id_ponto INT NOT NULL,
    horario VARCHAR(100),
    agendamento CHAR(1),
    custo DECIMAL(10,2),
    modalidade VARCHAR(100),
    FOREIGN KEY (id_ponto) REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE
);

-- Criação da Tabela de Evidências
CREATE TABLE evidencias (
    id_evidencia SERIAL PRIMARY KEY,
    id_ponto INT NOT NULL,
    tipo VARCHAR(50),
    descricao VARCHAR(255),
    arquivo_link VARCHAR(500),
    data DATE,
    FOREIGN KEY (id_ponto) REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE
);

-- Criação da Tabela de Análise Crítica
CREATE TABLE analise_critica (
    id_analise SERIAL PRIMARY KEY,
    cidade VARCHAR(100),
    facilidade TEXT,
    dificuldades TEXT,
    divulgacao VARCHAR(100),
    melhorias TEXT
);
