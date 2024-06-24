/* Criação banco para Projeto Modelagem Banco de Dados Para Negócio */
/* criado em 01/05/2023 */
/* Autor Leonardo Bruno de Souza Silva */
/* Matrícula 202301011744 Curso: TADS */
/* 202301011744@alunos.estacio.br */
/* souzalb@proton.me */

/* Criação da tabela para dados Clientes Pessoa Física */

CREATE TABLE "ClientePF" (
    "id_clientepf" BIGINT NOT NULL,
    "nome" VARCHAR(60) NOT NULL,
    "data_nascimento" DATE,
    "cpf" VARCHAR(11) NOT NULL,
    "email" VARCHAR(30) NOT NULL,
    "telefone" VARCHAR(11) NOT NULL,
    "data_cadastro" DATE,
    CONSTRAINT "Key1" PRIMARY KEY ("id_clientepf"),
    CONSTRAINT "cpf_unico" UNIQUE ("cpf")
);

/* Criação tabela para armazenar as solicitações recebidas de clientes */

CREATE TABLE "Solicitacao" (
    "id_solicitacao" BIGINT NOT NULL,
    "descricao" VARCHAR(120),
    "data_inicio" DATE,
    "data_fim" DATE,
    "situacao" VARCHAR(15),
    CONSTRAINT "Key2" PRIMARY KEY ("id_solicitacao")
);

/* Criação da tabela para endereços de clientes */

CREATE TABLE "EnderecoCliente" (
    "id_enderecocliente" BIGINT NOT NULL,
    "logradouro" VARCHAR(60),
    "numero" INTEGER,
    "complemento" VARCHAR(20),
    "bairro" VARCHAR(40),
    "cidade" VARCHAR(40),
    "estado" VARCHAR(40),
    "cep" VARCHAR(9),
    CONSTRAINT "Key3" PRIMARY KEY ("id_enderecocliente")
);

/* Criação da chave estrangeira para endereço na tabela ClientePF */

ALTER TABLE "ClientePF" ADD COLUMN "fk_enderecocliente" BIGINT;
ALTER TABLE "ClientePF" ADD CONSTRAINT "fk_endereco" FOREIGN KEY ("fk_enderecocliente") REFERENCES "EnderecoCliente" ("id_enderecocliente") ON DELETE NO ACTION ON UPDATE NO ACTION;

/* Criação da tabela associativa para Solicitações de Clientes */

CREATE TABLE "SolicitacaoCliente" (
    "id_clientepf" BIGINT NOT NULL,
    "id_solicitacao" BIGINT NOT NULL,
    CONSTRAINT "fk_solicitacao_cliente" FOREIGN KEY ("id_clientepf") REFERENCES "ClientePF" ("id_clientepf") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "fk_solicitacao" FOREIGN KEY ("id_solicitacao") REFERENCES "Solicitacao" ("id_solicitacao") ON DELETE NO ACTION ON UPDATE NO ACTION
);
