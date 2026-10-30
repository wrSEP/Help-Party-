# 🎉 Help Party — Banco de Dados

## 📌 Sobre o Projeto

O **Help Party** é um projeto acadêmico desenvolvido com o objetivo de proporcionar uma plataforma digital para auxiliar clientes no planejamento e na organização de festas e eventos.

A proposta do sistema é centralizar, em um único ambiente, o acesso a produtos e fornecedores, facilitando a busca pelos recursos necessários para a realização de um evento.

## 🗄️ Desenvolvimento do Banco de Dados

Minha participação no projeto foi direcionada à **modelagem, estruturação e criação do banco de dados relacional**, utilizando SQL e MySQL.

O banco foi desenvolvido para organizar as informações utilizadas pela plataforma, permitindo o armazenamento de dados de clientes, fornecedores, produtos, categorias e carrinhos de compras.

A estrutura conta com **10 tabelas**, sendo 9 interligadas por relacionamentos, visando à organização das informações e à integridade dos dados.

## 📊 Estrutura das Tabelas

| Tabela                | Finalidade                                                    |
| --------------------- | ------------------------------------------------------------- |
| `tblCliente`          | Armazena informações cadastrais dos clientes.                 |
| `tblEndereco`         | Registra os endereços utilizados no sistema.                  |
| `tblCidade`           | Armazena os municípios associados aos endereços.              |
| `tblUF`               | Organiza os estados brasileiros.                              |
| `tblFornecedor`       | Registra os fornecedores disponíveis na plataforma.           |
| `tblProduto`          | Armazena os produtos disponibilizados pelos fornecedores.     |
| `tblCategoriaProduto` | Classifica os produtos por categoria.                         |
| `tblCarrinho`         | Organiza os carrinhos associados aos clientes.                |
| `tblProdutoCarrinho`  | Relaciona produtos aos carrinhos e registra suas quantidades. |
| `tblStatusCompra`     | Armazena os possíveis status de compra.                       |

## 🔗 Modelagem Relacional

O banco utiliza conceitos de modelagem relacional, como:

- **Chaves primárias (PRIMARY KEY):** identificação única dos registros.
- **Chaves estrangeiras (FOREIGN KEY):** conexão entre as tabelas.
- **Relacionamentos 1\:N:** associação entre registros de diferentes entidades.
- **Relacionamento N\:N:** implementado por meio da tabela intermediária `tblProdutoCarrinho`.
- **Integridade referencial:** manutenção da consistência entre os registros relacionados.

A tabela `tblStatusCompra` possui estrutura independente, sem relacionamento definido no modelo apresentado.

## ⚙️ Tecnologias Utilizadas

- **MySQL:** sistema gerenciador de banco de dados relacional.
- **SQL:** criação das tabelas, definição de campos e relacionamentos.
- **Modelagem Entidade-Relacionamento (ER):** planejamento da estrutura e dos vínculos entre as entidades.

## 📂 Estrutura do Repositório

```text
Help-Party/
│
├── README.md
│
├── database/
│   └── create_tables.sql
│
└── docs/
    └── diagrama.png
```

## 🚀 Como Executar

**Pré-requisito:** MySQL instalado.

1. Abra o MySQL Workbench ou outro cliente MySQL.
2. Importe o arquivo `database/create_tables.sql`.
3. Execute o script para criar o banco de dados e suas tabelas.
4. Verifique a estrutura criada executando:

```sql
USE help_party;

SHOW TABLES;
```

## 🎯 Conhecimentos Aplicados

O desenvolvimento do banco de dados permitiu aplicar conhecimentos de:

- Modelagem e estruturação de bancos de dados relacionais.
- Criação e organização de tabelas utilizando SQL.
- Definição de chaves primárias e estrangeiras.
- Implementação de relacionamentos entre entidades.
- Organização e integridade de informações em sistemas.

## 👨‍💻 Desenvolvimento

**Wesley Rafael**

Responsável pela modelagem e estruturação do banco de dados do projeto acadêmico Help Party.

**Áreas de interesse:** Python | SQL | Análise de Dados | Automação de Processos.
