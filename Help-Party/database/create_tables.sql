-- Help Party — reconstrução do esquema apresentado no diagrama ER
-- MySQL 8+ | Uso acadêmico | Não é cópia recuperada do SQL original.
-- Os tamanhos de VARCHAR e as regras NOT NULL/UNIQUE foram inferidos,
-- pois não estão indicados no diagrama. A estrutura preserva os nomes dos campos.

CREATE DATABASE IF NOT EXISTS help_party
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE help_party;

CREATE TABLE tblUF (
  id INT AUTO_INCREMENT PRIMARY KEY,
  uf_sigla VARCHAR(2) NOT NULL,
  uf_nome VARCHAR(100) NOT NULL,
  UNIQUE KEY uq_uf_sigla (uf_sigla)
) ENGINE=InnoDB;

CREATE TABLE tblCidade (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cid_nome VARCHAR(120) NOT NULL,
  cid_id_uf INT NOT NULL,
  CONSTRAINT fk_cidade_uf FOREIGN KEY (cid_id_uf) REFERENCES tblUF(id)
) ENGINE=InnoDB;

CREATE TABLE tblEndereco (
  id INT AUTO_INCREMENT PRIMARY KEY,
  end_id_cidade INT NOT NULL,
  end_cep VARCHAR(9),
  end_num INT,
  CONSTRAINT fk_endereco_cidade FOREIGN KEY (end_id_cidade) REFERENCES tblCidade(id)
) ENGINE=InnoDB;

CREATE TABLE tblCliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cli_nome VARCHAR(100) NOT NULL,
  cli_sobrenome VARCHAR(100),
  cli_nomeUsu VARCHAR(100) NOT NULL,
  cli_telefone VARCHAR(20),
  cli_email VARCHAR(254) NOT NULL,
  cli_senha VARCHAR(255) NOT NULL COMMENT 'Somente hash seguro, nunca senha em texto puro',
  cli_id_End INT,
  cli_rg VARCHAR(20),
  cli_cpf VARCHAR(14),
  CONSTRAINT fk_cliente_endereco FOREIGN KEY (cli_id_End) REFERENCES tblEndereco(id)
) ENGINE=InnoDB;

CREATE TABLE tblFornecedor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  for_nome VARCHAR(150) NOT NULL,
  for_email VARCHAR(254),
  for_cnpj VARCHAR(18),
  for_id_endereco INT,
  CONSTRAINT fk_fornecedor_endereco FOREIGN KEY (for_id_endereco) REFERENCES tblEndereco(id)
) ENGINE=InnoDB;

CREATE TABLE tblCategoriaProduto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cat_tipo VARCHAR(100) NOT NULL,
  cat_negocio VARCHAR(150)
) ENGINE=InnoDB;

CREATE TABLE tblProduto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pro_nome VARCHAR(150) NOT NULL,
  pro_descricao BLOB,
  pro_id_fornecedor INT NOT NULL,
  pro_preco DECIMAL(10,2),
  pro_quant INT,
  pro_id_categoria INT NOT NULL,
  CONSTRAINT fk_produto_fornecedor FOREIGN KEY (pro_id_fornecedor) REFERENCES tblFornecedor(id),
  CONSTRAINT fk_produto_categoria FOREIGN KEY (pro_id_categoria) REFERENCES tblCategoriaProduto(id)
) ENGINE=InnoDB;

CREATE TABLE tblCarrinho (
  id INT AUTO_INCREMENT PRIMARY KEY,
  car_id_cliente INT NOT NULL,
  CONSTRAINT fk_carrinho_cliente FOREIGN KEY (car_id_cliente) REFERENCES tblCliente(id)
) ENGINE=InnoDB;

CREATE TABLE tblProdutoCarrinho (
  id INT AUTO_INCREMENT PRIMARY KEY,
  procar_id_carr INT NOT NULL,
  procar_id_pro INT NOT NULL,
  procar_quant INT NOT NULL,
  CONSTRAINT fk_produtocarrinho_carrinho FOREIGN KEY (procar_id_carr) REFERENCES tblCarrinho(id),
  CONSTRAINT fk_produtocarrinho_produto FOREIGN KEY (procar_id_pro) REFERENCES tblProduto(id)
) ENGINE=InnoDB;

-- A tabela consta sem relacionamento no diagrama fornecido.
CREATE TABLE tblStatusCompra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sta_status VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
