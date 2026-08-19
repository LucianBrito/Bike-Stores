# 🚲 Bike Stores — Análise de Vendas, Estoque e Performance

![SQL Server](https://img.shields.io/badge/SQL%20Server-2019-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-FFB900?style=for-the-badge&logo=power-bi&logoColor=black)
![Power Query](https://img.shields.io/badge/Power%20Query-Data%20Transformation-217346?style=for-the-badge)
![Star Schema](https://img.shields.io/badge/Modelagem-Star%20Schema-6C5CE7?style=for-the-badge)

## 📌 Visão Geral

Este projeto apresenta uma análise de **Business Intelligence** desenvolvida a partir da base de dados **BikeStores**, simulando a operação de uma rede de lojas de bicicletas.

O objetivo foi transformar dados de vendas, produtos, estoque, clientes, vendedores e lojas em informações capazes de apoiar decisões de negócio.

### Fluxo do projeto

```text
SQL
 ↓
Exploração e validação dos dados
 ↓
Tratamento e preparação
 ↓
Modelagem dimensional
 ↓
Power Query
 ↓
DAX
 ↓
Power BI
 ↓
Insights de negócio
```

---

# 🎯 Problema de Negócio

A gestão de uma rede de lojas precisa acompanhar sua operação comercial e identificar oportunidades de melhoria.

Este projeto busca responder principalmente:

1. Qual loja apresenta melhor desempenho?
2. Quais produtos e categorias geram maior faturamento?
3. Quais produtos apresentam níveis críticos de estoque?
4. Quais vendedores apresentam melhor performance?
5. Como as vendas evoluem ao longo do tempo?
6. Qual é a taxa de cancelamento dos pedidos?
7. Existem padrões sazonais ou comportamentos fora do padrão?
8. Quais indicadores podem apoiar decisões comerciais e operacionais?

---

# 🔎 Principais Análises

- faturamento por loja;
- faturamento por categoria;
- Top 10 produtos;
- performance de vendedores;
- evolução mensal das vendas;
- crescimento anual;
- análise de sazonalidade;
- ticket médio;
- quantidade de pedidos;
- taxa de cancelamento;
- análise de estoque;
- participação dos produtos nas vendas;
- análise de clientes;
- qualidade e integridade dos dados.

---

# 🗃️ Base de Dados

A base BikeStores representa uma operação de varejo de bicicletas.

### Principais entidades

**Production**

- Categories
- Brands
- Products
- Stocks

**Sales**

- Stores
- Customers
- Staffs
- Orders
- Order Items

---

# 🧠 Metodologia

## 1. Exploração dos dados

Inicialmente foram analisadas as tabelas, campos, relacionamentos e características dos dados disponíveis.

O objetivo foi compreender a estrutura da base antes da criação dos indicadores.

## 2. SQL — Análise e preparação

Foram desenvolvidas consultas SQL para exploração e análise dos dados.

### Recursos utilizados

- `SELECT`
- `WHERE`
- `JOIN`
- `GROUP BY`
- `CASE WHEN`
- `CTE`
- funções de agregação
- funções de data
- `LAG()`
- rankings
- cálculos de crescimento
- variações percentuais

Os scripts SQL utilizados no projeto estão disponíveis no repositório.

## 3. Qualidade dos Dados

Antes da construção dos indicadores, foram realizadas verificações para identificar possíveis problemas de qualidade, incluindo:

- valores nulos;
- chaves duplicadas;
- registros órfãos;
- integridade referencial;
- tipos de dados;
- relacionamentos entre tabelas;
- consistência das informações utilizadas nos indicadores.

## 4. Modelagem Dimensional

Para a camada analítica foram utilizados conceitos de **modelagem dimensional e Star Schema**.

A estrutura permite analisar as vendas por diferentes dimensões, como:

- tempo;
- loja;
- produto;
- categoria;
- cliente;
- vendedor.

## 5. Power Query

O **Power Query** foi utilizado na preparação dos dados para o modelo analítico.

Entre as transformações realizadas:

- seleção das tabelas necessárias;
- seleção das colunas relevantes;
- tratamento dos tipos de dados;
- preparação dos campos de data;
- organização das informações;
- preparação dos dados para o modelo dimensional.

## 6. DAX e Indicadores

Foram desenvolvidas medidas DAX para acompanhar os principais indicadores do negócio.

### KPIs

- Total de Vendas
- Total de Pedidos
- Ticket Médio
- Produtos Distintos
- Participação nas Vendas
- Vendas por Loja
- Vendas por Vendedor
- Vendas por Cliente

### Análise temporal

- Vendas Ano Anterior
- Variação YoY %
- Vendas YTD
- Evolução mensal

### Performance

- Ranking de lojas
- Ranking de vendedores
- Performance por categoria
- Performance por produto

---

# 📊 Power BI

O projeto utiliza **Microsoft Power BI** para transformar os dados preparados em uma camada analítica interativa.

O dashboard permite explorar indicadores relacionados a:

- vendas;
- lojas;
- produtos;
- categorias;
- clientes;
- vendedores;
- estoque;
- cancelamentos;
- evolução temporal.

A proposta é permitir que diferentes perspectivas sejam analisadas de maneira interativa, facilitando a identificação de padrões e oportunidades.

---

# 💡 Insights de Negócio

A análise foi estruturada para identificar situações como:

- concentração de faturamento em determinadas lojas;
- produtos com maior contribuição para a receita;
- categorias de maior relevância;
- diferenças de performance entre vendedores;
- evolução das vendas ao longo do tempo;
- comportamento dos cancelamentos;
- produtos com possível risco de ruptura de estoque;
- oportunidades de melhoria operacional.

> O objetivo da análise não é apenas apresentar gráficos, mas transformar dados em informações que possam apoiar decisões.

---

# 🛠️ Tecnologias e Ferramentas

| Tecnologia | Aplicação |
|---|---|
| **SQL Server / SQL** | Consultas e análise dos dados |
| **Power Query** | Tratamento e transformação |
| **Power BI** | Dashboard e visualização |
| **DAX** | Medidas e indicadores |
| **Star Schema** | Modelagem dimensional |
| **GitHub** | Versionamento e documentação |

---

# 🎯 Competências Demonstradas

Este projeto demonstra experiência prática em:

- análise exploratória de dados;
- SQL analítico;
- tratamento e qualidade de dados;
- modelagem dimensional;
- Star Schema;
- Power Query;
- DAX;
- criação de KPIs;
- análise temporal;
- análise de performance;
- Business Intelligence;
- construção de dashboards;
- interpretação de indicadores;
- geração de insights para negócio.

---

# 📁 Estrutura do Projeto

```text
Bike-Stores
│
├── SQL
│   ├── Consultas
│   ├── Análises
│   └── Indicadores
│
├── Power BI
│   └── Dashboard
│
├── Imagens
│   └── Dashboards e análises
│
└── README.md
```

---

# 🎯 Objetivo Profissional

Este projeto faz parte do meu portfólio profissional e foi desenvolvido para demonstrar competências relacionadas à atuação como:

**Analista de Dados Júnior | Analista de BI**

Meu foco atual é desenvolver cada vez mais minha capacidade de utilizar:

**SQL + Power BI + Python + Estatística**

para transformar dados em informações úteis para tomada de decisão.

---

# 👤 Sobre o Autor

**Luciano Conceição de Brito**

Analista de Dados | Business Intelligence

Formação em Análise e Desenvolvimento de Sistemas, com pós-graduação em Análise de Dados e Ciência de Dados.

Atualmente aprofundando conhecimentos em:

- SQL
- Power BI
- DAX
- Power Query
- Python
- Estatística
- Business Intelligence

---

## 🔗 Contato

**GitHub:**  
https://github.com/LucianBrito

**LinkedIn:**  
https://www.linkedin.com/in/luciano-concei%C3%A7%C3%A3o-de-brito/

---

> **Transformar dados em insights para apoiar decisões melhores.**
