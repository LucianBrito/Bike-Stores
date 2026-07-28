# 📊 Análise de Bike Stores  — Contoso Retail DW

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

