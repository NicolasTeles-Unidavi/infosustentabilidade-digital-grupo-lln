# ♻️ Relatório de Evidências: Pontos de Coleta de Resíduos

Este documento reúne todas as fontes, sites de prefeituras, portais de notícias e redes sociais que servem como evidência para os pontos de coleta mapeados, além de documentar a estrutura do projeto.

---

## 📎 1. Tabela de Evidências (Fontes)

| ID Evidência | ID Ponto | Tipo | Descrição | Fonte / Link | Data da Evidência |
| :---: | :---: | :--- | :--- | :--- | :--- |
| **1** | 1 | 🌐 Site | Site da prefeitura | [Acessar Link](https://www.trombudocentral.sc.gov.br/) | 2026-05-15 |
| **2** | 2 | 📰 Site | Site de notícias | [Acessar Link](https://www.portaleducadora.com/noticia/prefeitura-de-trombudo-central-promove-coleta-de-residuos-especiais-e-reforca-acoes-ambientais/) | 2026-05-14 |
| **3** | 3 | 🌐 Site | Site da prefeitura | [Acessar Link](https://laurentino.sc.gov.br/) | 2026-05-13 |
| **4** | 4 | 🌐 Site | Site da prefeitura | [Acessar Link](https://www.riodosul.sc.gov.br/) | 2026-05-14 |
| **5** | 5 | 🌐 Site | Site da prefeitura | [Acessar Link](https://agronomica.sc.gov.br/) | 12/05/2026 |
| **6** | 6 | 📱 Social | Rede social | [Acessar Link](https://www.facebook.com/coletron.metais/) | 12/05/2026 |
| **7** | 7 | 📱 Social | Rede social | [Acessar Link](https://www.facebook.com/p/Megatron-Reciclagem-de-Eletr%C3%B4nicos-100063938468148/) | 12/05/2026 |

---

## 📊 2. Evidências da Planilha (Google Sheets)

🔗 **Link de Acesso:** [Planilha Google Sheets](https://docs.google.com/spreadsheets/d/1LDoGiHUGPBlJCmjJ7r-jxHHGUXi-agJgPWqeREAMNI4/edit?usp=sharing)

**Abas Criadas:**
*   📁 `pontos_coleta`
*   📁 `materiais_aceitos`
*   📁 `procedimento_descarte`
*   📁 `evidencias`
*   📁 `analise_critica`

---

## 💻 3. Contribuições no GitHub

Mapeamento de arquivos trabalhados por cada integrante da equipe:

*   👤 **Lucas**
    *   📄 `data/pontos_coleta.json`
    *   📄 `docs/modelo-dados.md`
    *   📄 `sql/script.sql`
    *   📄 `README.md`

*   👤 **Nicolas**
    *   📄 `data/pontos_coleta.json`
    *   📄 `docs/modelo-dados.md`
    *   📄 `docs/orientacao-descarte.md`
    *   📄 `evidencias/evidencias.md`
    *   📄 `sql/script.sql`
    *   📄 `README.md`

*   👤 **Lian**
    *   📄 `docs/modelo-dados.md`
    *   📄 `docs/orientacao-descarte.md`
    *   📄 `evidencias/evidencias.md`

---

## 🗄️ 4. Evidências do Supabase

**Nome do Projeto:** `infosustentabilidade-digital-grupo-lln`

**Link do projeto** [Projeto Supabase](https://lfgbdqwlamhfqswcpcnw.supabase.co)

**Tabelas Criadas:**
1.  `pontos_coleta`
2.  `materiais_aceitos`
3.  `procedimento_descarte`
4.  `evidencias`
5.  `analise_critica`

---

## 🔍 5. Consultas Realizadas (SQL)

Abaixo estão os scripts de consulta utilizados para verificação dos dados no banco de dados:

```sql
-- Consultas básicas por tabela
SELECT * FROM pontos_coleta;
SELECT * FROM materiais_aceitos;
SELECT * FROM procedimento_descarte;
SELECT * FROM evidencias;
SELECT * FROM analise_critica;

-- Consulta com relacionamento (Materiais x Pontos de Coleta)
SELECT * 
FROM materiais_aceitos ma
LEFT JOIN pontos_coleta pc
  ON ma.id_ponto = pc.id_ponto;
