# 📊 Análise de Bike Stores 

![SQL Server](https://img.shields.io/badge/SQL%20Server-2019-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-FFB900?style=for-the-badge&logo=power-bi&logoColor=black)
![Star Schema](https://img.shields.io/badge/Modelagem-Star%20Schema-6C5CE7?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Concluído-27AE60?style=for-the-badge)

## 🧩 Descrição do Problema de Negócio

"Acabei de receber uma reclamação do time de vendas dizendo que estamos perdendo
pedidos por falta de estoque. Quero saber quais produtos estão com estoque crítico mas
continuam aparecendo como disponíveis para o cliente, "Tenho 3 lojas e quero entender qual performa melhor. Não é só faturamento — quero ver prazo de entrega e base de clientes também. Isso vai ajudar a decidir onde abrir a próxima loja."

## Descrição Geral do Banco de Dados

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
