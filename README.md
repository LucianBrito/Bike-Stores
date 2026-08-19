# 📊 Análise de Bike Stores 

![SQL Server](https://img.shields.io/badge/SQL%20Server-2019-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-FFB900?style=for-the-badge&logo=power-bi&logoColor=black)
![Star Schema](https://img.shields.io/badge/Modelagem-Star%20Schema-6C5CE7?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Concluído-27AE60?style=for-the-badge)

#### 🧩 Descrição do Problema de Negócio

"Acabei de receber uma reclamação do time de vendas dizendo que estamos perdendo,
pedidos por falta de estoque. Quero saber quais produtos estão com estoque crítico mas
continuam aparecendo como disponíveis para o cliente, "Tenho 3 lojas e quero entender qual performa melhor. Não é só faturamento — quero ver prazo de entrega e base de clientes também. Isso vai ajudar a decidir onde abrir a próxima loja."

### Descrição Geral do Banco de Dados

#### O que é o BikeStores?
O BikeStores é um banco de dados relacional de exemplo, projetado para simular a operação de uma rede de lojas de bicicletas. Ele armazena informações sobre produtos, clientes, funcionários, pedidos, lojas e estoque, permitindo análises de vendas, gestão de inventário e avaliação de desempenho entre unidades.

#### Organização em Schemas
O banco está dividido em 2 schemas (grupos lógicos):

#### Schema	Responsabilidade
Production	Tudo relacionado ao catálogo de produtos — marcas, categorias, produtos e controle de estoque por loja.
Sales	Tudo relacionado à operação comercial — clientes, lojas, funcionários, pedidos e itens vendidos.

#### Relacionamento entre os Schemas
Os dois schemas se conectam pelas tabelas de Products (catálogo) e Stocks (estoque), que servem como ponte entre o que é vendido (Sales) e o que está disponível (Production).

#### Volume de Dados (estimado)

3 lojas físicas
~45 funcionários distribuídos entre as lojas
~1.496 clientes cadastrados
~1.605 pedidos realizados
~310 produtos de diversas marcas e categorias
~9.279 registros de estoque (produto × loja)

#### Descrição Detalhada das Tabelas
SCHEMA PRODUCTION

* production.categories Guarda a lista de categorias dos produtos da loja. Cada categoria agrupa um tipo de bicicleta ou equipamento, como Mountain Bikes, Road Bikes, Cruisers, entre outras.

* production.brands Guarda a lista de marcas de bicicletas vendidas pela rede, como Trek, Electra, Surly, entre outras.

* production.products É o catálogo completo de produtos. Cada registro é uma bicicleta ou equipamento, com seu nome comercial, a marca a que pertence, a categoria em que se encaixa, o ano do modelo e o preço de tabela.

* production.stocks Controla a quantidade de cada produto disponível em cada loja. É a tabela que diz quanto de cada item existe fisicamente em cada unidade, sendo essencial para identificar produtos em falta ou com estoque baixo.

#### SCHEMA SALES

* sales.stores Cadastro das lojas físicas da rede. Contém nome, telefone, e-mail e endereço completo de cada unidade.

* sales.customers Cadastro dos clientes que compram na rede. Contém nome, telefone, e-mail e endereço de cada cliente.

* sales.staffs Cadastro dos funcionários da rede. Além dos dados pessoais e de contato, indica em qual loja o funcionário trabalha, quem é seu gerente direto e se está ativo ou não.

* sales.orders Registra todos os pedidos feitos pelos clientes. Cada pedido está vinculado a um cliente, a uma loja e a um funcionário responsável. Contém as datas de pedido, prazo solicitado, data de envio e status do pedido.

* sales.order_items Detalha o que foi comprado dentro de cada pedido. Cada registro mostra qual produto foi vendido, em qual quantidade, por qual preço unitário e com qual desconto aplicado. É a partir desta tabela que se calcula o faturamento real.

### Analise Exploratória de Dados com SQL

### Faturamento por Canal

O que faz: Agrega o faturamento total (LineTotal) por canal de venda (Store.Name) no período de 2016 a 2018, excluindo pedidos cancelados.

O que responde: Qual canal gera mais receita? Qual o peso relativo de cada um no negócio?

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Query%20por%20Canal%20de%20Vendas.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 


### Top 10 Produtos por Canal

O que faz: Para cada canal de venda, ranqueia os 10 produtos com maior faturamento, considerando pedidos de 2016 a 2018. Ignora produtos com menos de 5 pedidos para evitar resultados irrelevantes.

O que responde: Quais produtos sustentam cada canal, qual volume vendido e se o desconto médio está comprometendo a margem.

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Ranking%20Top%2010%20Produtos.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Variação Ano a Ano (YoY)

O que faz: Calcula o faturamento anual por canal e utiliza a função LAG() para obter o ano anterior e calcular a variação percentual.

O que responde: Se cada canal está crescendo, estagnado ou em queda ano a ano.

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Varia%C3%A7%C3%A3o%20Ano%20a%20Ano%20(YoY).sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Sazonalidade e Outliers Mensais

O que faz: Agrupa o faturamento por canal e mês, calcula a média móvel de 3 meses e o desvio padrão. Classifica cada mês como normal, pico ou queda atípica usando o limite de 1,5 desvio padrão da média móvel.

O que responde: Se existe sazonalidade no faturamento, se há meses com picos ou quedas fora do padrão esperado.

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Sazonalidade%20e%20Outliers%20Mensais.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Query Principal por Canal de Venda

O que faz: Agrega pedidos, itens e faturamento por canal (Store), incluindo o total e percentual de cancelados (Status = 5) via CASE WHEN.

O que responde: Qual canal gera mais receita? Qual canal tem maior taxa de cancelamento?
O volume de pedidos acompanha o faturamento ou há canais com ticket médio maior?

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Query%20por%20Canal%20de%20Vendas.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Faturamento por Categoria de Produto

O que faz: Mesma lógica da querie Principal, mas agrupando por categoria (Category), cruzando Product → Category.

O que responde: Quais categorias mais vendem? O faturamento está concentrado em poucas categorias?
Alguma categoria tem taxa de cancelamento anormal?

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Varia%C3%A7%C3%A3o%20por%20categoria%20de%20Produtos.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Faturamento por Vendedor

O que faz: Agrupa por vendedor + loja (Employee + Store), filtrando apenas vendedores ativos (Active = 1).

O que responde: Quem são os top performers? Algum vendedor fatura muito mas cancela muito também?
Há disparidade entre vendedores da mesma loja?

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Vaeria%C3%A7%C3%A3o%20por%20Vendedor.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Distribuição por Status Legível

O que faz: Agrupa por canal + status, traduzindo os códigos numéricos (1 a 5) em texto (Pendente, Processando, Enviado, Concluído, Cancelado) via CASE.

O que responde: Como os pedidos se distribuem por status em cada canal? Qual canal tem mais pedidos travados em etapas intermediárias? A taxa de conclusão é saudável em todos os canais?

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Varia%C3%A7%C3%A3o%20com%20Status%20Leg%C3%ADvel.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Variação Mensal

O que faz: Agrupa por canal + mês/ano (yyyy-MM), calculando as mesmas métricas dos scripts anteriores (pedidos, itens, faturamento, cancelados e %).

O que responde: Como o faturamento evolui mês a mês em cada canal? Existe sazonalidade (picos em dezembro, quedas em janeiro)? A taxa de cancelamento oscila em meses específicos?
Qual foi o melhor e o pior mês de cada canal?

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/SQL/Varia%C3%A7%C3%A3o%20Mensal.sql" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Verificação da Qualidade dos Dados

Nesta etapa, o objetivo foi avaliar a qualidade dos dados na tabela FactInternetSales e nas tabelas relacionadas. Isso inclui identificar possíveis inconsistências, como valores nulos, duplicados ou outras anomalias que possam impactar negativamente as análises.

### Identificar Valores Nulos em Chaves Estrangeiras
Os valores nulos em chaves estrangeiras indicam que determinados registros na tabela fato não possuem correspondência nas dimensões relacionadas, o que pode causar problemas nas análises, como métricas distorcidas ou falhas em segmentações. Para verificar, utilizamos as seguintes consultas:

### Verificação de nulos na tabela Sales.Order

<a href="" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

A query contabiliza o total de pedidos e a quantidade de registros com valor preenchido em EmployeeID e StoreID. A diferença entre esses valores indica quantos pedidos estão sem vendedor ou sem loja associados.
A query lista os pedidos com chave estrangeira nula, exibindo o identificador, a data e indicadores de qual campo está ausente. Os resultados são ordenados por data, do mais recente para o mais antigo.

### Verificação de nulos na tabela Sales.OrderItem

<a href="" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

Mesma lógica aplicada à tabela de itens, verificando as chaves OrderID e ProductID. O resultado indica quantos itens estão sem pedido ou sem produto associados.
A query lista os itens com chave estrangeira nula, exibindo identificador, pedido, produto, quantidade e indicadores de qual campo está ausente. O campo identificador correto desta tabela é ItemID.

### Verificação de integridade referencial (registros órfãos)

<a href="" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

As queries identificam registros em que a chave estrangeira possui valor, mas esse valor não existe na tabela de destino. A técnica utiliza LEFT JOIN com filtro que descarta chaves nulas e mantém apenas os casos sem correspondência. São verificadas três situações: EmployeeID inexistente em Employee, StoreID inexistente em Store e ProductID inexistente em Product.

### Importação dos Dados

No Power BI, foi utilizada a opção de conexão ao banco de dados SQL Server, fornecendo o endereço do servidor e o nome do banco de dados BikeStores

Foram selecionadas as seguintes tabelas para o projeto:

<a href="" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

Apenas as tabelas essenciais para os relatórios foram importadas, buscando sempre um bom desempenho do modelo de dados.

### Transformações com Power Query

Durante a importação, utilizou-se o Power Query para aplicar algumas transformações adicionais:

* Remoção de Colunas Desnecessárias: Foram eliminadas colunas que não eram relevantes para a análise, como campos de auditoria e metadados internos, simplificando o modelo de dados
* Verificação e Ajuste de Tipos de Dados: Os tipos de dados das colunas foram revisados e ajustados para garantir consistência nas análises, com atenção especial aos campos de data, valores monetários e identificadores.

### Star Schema

O schema segue um modelo estrela (star schema) com duas tabelas fato no centro e as dimensões ao redor. Aqui está a estrutura:

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/Prints/Schema.png?raw=true" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Medidas
As medidas foram organizadas em Tabela (Medida) dentro do Power BI, facilitando a navegação e manutenção do modelo. Segue a descrição de cada uma:

📊 KPIs
* Total Vendas: Soma o valor total das vendas realizadas, considerando preço e quantidade de itens vendidos. Representa a receita bruta gerada pela empresa.
* Total Pedidos: Contagem distinta de pedidos (order_id) realizados, indicando o volume de transações no período analisado.
* Ticket Médio: Valor médio gasto por pedido, calculado pela divisão do Total de Vendas pelo Total de Pedidos. Mede o valor médio transacionado em cada compra.

🕒 Tempo
* Vendas Ano Anterior: Calcula o Total de Vendas referente ao mesmo período do ano anterior, permitindo comparações históricas.
* Variação YoY %: Percentual de variação das vendas em relação ao mesmo período do ano anterior (Year over Year), evidenciando crescimento ou queda no desempenho.
* Vendas YTD: Soma acumulada das vendas desde o início do ano até a data atual (Year to Date), permitindo acompanhar a evolução do desempenho no ano corrente.

🛍️ Produto
* Produtos Distintos: Contagem de produtos únicos (product_id) vendidos, indicando a diversidade do mix de produtos comercializados.
* % Participação Produto: Percentual de participação de cada produto sobre o total de vendas, útil para identificar os itens mais relevantes para a receita.
  
👥 Cliente
* Vendas por Cliente: Total de vendas segmentado por cliente, permitindo identificar os clientes que mais contribuem para a receita.
  
🏪 Vendedor
* Rank Funcionário: Classificação (ranking) dos funcionários com base no volume de vendas realizadas, destacando os melhores desempenhos individuais.
* Rank Loja: Classificação (ranking) das lojas com base no total de vendas, permitindo comparar o desempenho entre as unidades (Baldwin Bikes, Santa Cruz Bikes e Rowlett Bikes), Segue Abaixo a Tabela de Medidas

  <a href="https://github.com/LucianBrito/Bike-Stores/blob/main/Prints/Tabela%20de%20Medidas%201.png?raw=true" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Construção do Relatório — Bike Stores

Para proporcionar uma visão detalhada e estratégica do negócio, foram desenvolvidas três páginas principais de visualização no Power BI:

* Visão Executiva: Oferece uma análise financeira abrangente, incluindo indicadores temporais e segmentações para acompanhar o desempenho do negócio ao longo do tempo

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/Prints/Dash%20Vis%C3%A3o.png?raw=true" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

* Análise de Vendas: Apresenta uma análise detalhada do desempenho de produtos, subcategorias e marcas, permitindo identificar os itens mais rentáveis e relevantes para a empresa.

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/Prints/Dash%20Vendas.png?raw=true" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

* Detalhamento: Foca no detalhamento por loja (Baldwin Bikes, Santa Cruz Bikes e Rowlett Bikes) e demais dimensões, proporcionando insights granulares para auxiliar na tomada de decisões estratégicas.

  <a href="https://github.com/LucianBrito/Bike-Stores/blob/main/Prints/Dash%20Detal.png?raw=true" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub

* Tooltip: Foi criada uma página de tooltip personalizada no Power BI, configurada como report page tooltip. Essa página é exibida automaticamente ao passar o mouse sobre determinados visuais do relatório, fornecendo informações complementares e detalhadas sem a necessidade de navegação entre páginas.

A página de tooltip foi dimensionada em formato reduzido (padrão Tooltip do Power BI) e contém visuais resumidos — como cartões e mini gráficos — que exibem métricas relevantes ao contexto do dado apontado (ex: valores de vendas, comparativos de período ou detalhamento por categoria), enriquecendo a experiência de análise do usuário de forma contextual e interativa.

<a href="https://github.com/LucianBrito/Bike-Stores/blob/main/Prints/TT.png?raw=true" target="_blank">Clique aqui</a> e acesse o script SQL no GitHub 

### Insight importante do Relatório

Concentração extrema de receita em poucos produtos e uma loja.
* Mountain Bikes sozinha responde por 36,67% do faturamento (R$ 340 Mi), mais que Road + Cruisers + Electric juntas.
* A loja Baldwin Bikes gera 0,64 Bi de um total de 0,93 Bi (~69% do faturamento), enquanto Santa Cruz (0,19 Bi) e Rowlett (0,10 Bi) dividem o restante.
* A marca Trek domina com 0,55 Bi (quase 60% do total), e os 10 produtos mais vendidos são, em sua maioria, modelos Trek.
  
### Transformando o número em conclusão de negócio
   
"O negócio depende fortemente de um mix restrito: uma categoria (Mountain Bikes), uma marca (Trek) e uma loja (Baldwin) sustentam a maior parte da receita. Isso indica alta eficiência nesses pilares, mas também alta exposição a risco de concentração — qualquer disrupção em fornecimento, demanda ou operação nesses pontos específicos impacta desproporcionalmente o resultado global."

### Recomendação ao gestor

* Diversificar o mix ativamente: investir em marketing/promoção para categorias sub-representadas (Children Bikes 4%, Comfort Bicycles 5,18%) para reduzir dependência de Mountain Bikes.
* Replicar o modelo Baldwin: investigar o que torna Baldwin Bikes tão superior (localização, equipe, sortimento) e aplicar boas práticas nas outras duas lojas.
* Negociar com Trek: dado o peso da marca, negociar melhores condições comerciais (volume, exclusividade, prazos) já que ela é um fornecedor crítico.
* Atenção à queda de vendas ao longo do tempo: o gráfico "Vendas ao Longo do Tempo" mostra tendência de queda de ~94 Mi para ~64 Mi — isso merece prioridade de investigação antes de qualquer expansão de portfólio.
  
  ### Algo surpreendente ou contra-intuitivo
  
* Tendência de queda consistente nas vendas totais (94 Mi → 64 Mi) é contra-intuitiva se o negócio está com bom ticket médio (R$ 7.351) e boa base de clientes ativos (1.445) — sugere que o problema não é preço nem churn de cliente, e sim volume/frequência de pedidos ou possivelmente sazonalidade não tratada.
* Baldwin Bikes cresce enquanto Santa Cruz e Rowlett têm performance modesta e relativamente estável (sem crescimento) — indica que o crescimento da empresa está 100% concentrado em uma única unidade, o que é um sinal de alerta estratégico (dependência de um único ponto de venda).
* A clientela "Top Clientes" tem tickets médios muito altos (R$ 8-11 mil) comparado ao ticket médio geral (R$ 7,35 mil) — pode indicar que uma pequena base de clientes VIP sustenta desproporcionalmente a receita.

  ### Perguntas de acompanhamento
   
* A queda nas vendas totais ao longo do tempo é sazonal (ex: baixa em certos meses) ou é uma tendência estrutural de declínio?
O que Baldwin Bikes está fazendo de diferente operacionalmente para performar tão acima das outras duas lojas?
* Qual é o Customer Lifetime Value (CLV) dos "Top Clientes" e quanto de receita futura depende de reter esse grupo pequeno de clientes de alto ticket?
* Se retirarmos Mountain Bikes e Trek da equação, qual seria a saúde real do negócio nas outras categorias/marcas?
* Existe correlação entre desempenho por funcionário (Boyer e Daniel dominam) e a performance da loja Baldwin — ou seja, o sucesso é da loja ou dos vendedores específicos?

  👤 ** Luciano Conceição de Brito **
🔗 [LinkedIn](https://www.linkedin.com/in/luciano-conceição-de-brito)



<!-- README em atualização -->
