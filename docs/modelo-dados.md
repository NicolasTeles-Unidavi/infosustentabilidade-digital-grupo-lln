# Documentação do Banco de Dados: InfoSustentabilidade

Este documento descreve a modelagem do banco de dados relacional gerado a partir do levantamento de dados de sustentabilidade e pontos de coleta. 

## 📌 Visão Geral do Esquema

O banco de dados é centralizado na tabela `pontos_coleta`, que atua como a entidade principal. As tabelas secundárias (`materiais_aceitos`, `procedimentos_descarte` e `evidencias`) possuem relacionamento direto (1:N) com a tabela de pontos de coleta através de **Foreign Keys (Chaves Estrangeiras)**. A tabela `analise_critica` avalia o cenário por cidade.

---

## 🗄️ Estrutura das Tabelas

### 1. `pontos_coleta`
Armazena as informações principais dos locais (ecopontos, prefeituras, empresas) que recebem os resíduos.
* **`id_ponto` (INT): PRIMARY KEY** - Identificador único do ponto de coleta.
* `nome` (VARCHAR): Nome do estabelecimento/local.
* `endereco` (VARCHAR): Endereço físico logradouro e número.
* `bairro` (VARCHAR): Bairro onde se localiza.
* `cidade` (VARCHAR): Município e Estado (ex: Trombudo Central/SC).
* `contato` (VARCHAR): Telefone ou forma de contacto.
* `link_maps` (VARCHAR): URL para o Google Maps.

### 2. `materiais_aceitos`
Lista os materiais que cada ponto de coleta aceita ou não aceita (pilhas, baterias, eletrónicos, etc).
* **`id_material` (INT): PRIMARY KEY** - Identificador único do registo de material.
* **`id_ponto` (INT): FOREIGN KEY** - Referência a `pontos_coleta(id_ponto)`.
* `tipo_material` (VARCHAR): Nome/Categoria do material (ex: pilhas, telemóveis, hardware).
* `aceita` (CHAR/BOOLEAN): Indica se o material é aceito ('s' para Sim, 'n' para Não).
* `observacao` (TEXT): Detalhes adicionais sobre o material.

### 3. `procedimentos_descarte`
Descreve as regras, horários e custos para o descarte em cada ponto.
* **`id_procedimento` (INT): PRIMARY KEY** - Identificador único do procedimento.
* **`id_ponto` (INT): FOREIGN KEY** - Referência a `pontos_coleta(id_ponto)`.
* `horario` (VARCHAR): Horário de funcionamento/recebimento.
* `agendamento` (CHAR/BOOLEAN): Indica se necessita de agendamento prévio ('s' ou 'n').
* `custo` (DECIMAL/VARCHAR): Valor cobrado (0 caso seja gratuito).
* `modalidade` (VARCHAR): Forma de entrega (ex: 'entrega' no local).

### 4. `evidencias`
Guarda os links, documentos e comprovações de que os pontos de coleta estão ativos (sites, redes sociais, notícias).
* **`id_evidencia` (INT): PRIMARY KEY** - Identificador único da evidência.
* **`id_ponto` (INT): FOREIGN KEY** - Referência a `pontos_coleta(id_ponto)`.
* `tipo` (VARCHAR): Categoria da evidência (ex: site, notícia, rede social).
* `descricao` (TEXT): Breve explicação sobre o link.
* `arquivo_link` (VARCHAR): URL da evidência.
* `data` (DATE): Data da recolha ou publicação da evidência.

### 5. `analise_critica`
Avaliação qualitativa do cenário de descarte por município. 
* **`id_analise` (INT): PRIMARY KEY** - Identificador único da análise.
* `cidade` (VARCHAR): Município analisado. *(Nota: Atua como um vínculo lógico com `pontos_coleta.cidade`, mas sem Foreign Key estrita dependendo do SGBD, para permitir análises de cidades sem pontos cadastrados)*.
* `facilidade` (TEXT): Pontos positivos e facilidades encontradas.
* `dificuldades` (TEXT): Barreiras e pontos de atenção (ex: "Pouco divulgado").
* `divulgacao` (TEXT): Nível ou meio de divulgação da campanha no município.
* `melhorias` (TEXT): Sugestões de ações futuras.

---

## 🛠️ DDL - Código SQL para Criação do Banco (Exemplo PostgreSQL/MySQL)

```sql
-- Criação da Tabela Principal
CREATE TABLE pontos_coleta (
    id_ponto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    contato VARCHAR(50),
    link_maps VARCHAR(500)
);

-- Criação da Tabela de Materiais Aceitos
CREATE TABLE materiais_aceitos (
    id_material INT PRIMARY KEY AUTO_INCREMENT,
    id_ponto INT NOT NULL,
    tipo_material VARCHAR(100),
    aceita CHAR(1),
    observacao VARCHAR(255),
    FOREIGN KEY (id_ponto) REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE
);

-- Criação da Tabela de Procedimentos
CREATE TABLE procedimentos_descarte (
    id_procedimento INT PRIMARY KEY AUTO_INCREMENT,
    id_ponto INT NOT NULL,
    horario VARCHAR(100),
    agendamento CHAR(1),
    custo DECIMAL(10,2),
    modalidade VARCHAR(100),
    FOREIGN KEY (id_ponto) REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE
);

-- Criação da Tabela de Evidências
CREATE TABLE evidencias (
    id_evidencia INT PRIMARY KEY AUTO_INCREMENT,
    id_ponto INT NOT NULL,
    tipo VARCHAR(50),
    descricao VARCHAR(255),
    arquivo_link VARCHAR(500),
    data DATE,
    FOREIGN KEY (id_ponto) REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE
);

-- Criação da Tabela de Análise Crítica
CREATE TABLE analise_critica (
    id_analise INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(100),
    facilidade TEXT,
    dificuldades TEXT,
    divulgacao VARCHAR(100),
    melhorias TEXT
);
