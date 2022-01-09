drop database IF  EXISTS dbbiblioteca;
create database dbbiblioteca;
use dbbiblioteca;


CREATE TABLE tbGenero (
		pkcodGen INTEGER(4) ZEROFILL NOT NULL auto_increment PRIMARY KEY,
		nome VARCHAR(50) NOT NULL,
		sigla VARCHAR(50) NOT NULL);
		
CREATE TABLE tbAutor (
		pkcodAut INTEGER(4) ZEROFILL NOT NULL auto_increment PRIMARY KEY,
		nome_Completo VARCHAR(200) NOT NULL,
		nome VARCHAR(50) NOT NULL,
       		sobrenome VARCHAR(100) NOT NULL);
		
CREATE TABLE tbEndereco (
		pkcodEnd INTEGER(4) ZEROFILL NOT NULL auto_increment PRIMARY KEY,
		rua VARCHAR(200) NOT NULL,
		numero INTEGER(5) NOT NULL,
        	uf CHAR(2) NOT NULL);
		
CREATE TABLE tbEditora (
		pkcodEdi INTEGER(4) ZEROFILL NOT NULL auto_increment PRIMARY KEY,
		nome VARCHAR(100) NOT NULL,
		fkcodEnd INTEGER(4) ZEROFILL NOT NULL,
        	foreign key (fkcodEnd) references tbEndereco (pkcodEnd));
		
CREATE TABLE tbLivro (
		pkcodLiv INTEGER(4) ZEROFILL NOT NULL auto_increment PRIMARY KEY,
		nome VARCHAR(200) NOT NULL,
        	edicao VARCHAR(200) NOT NULL,
        	ano INTEGER(4) NOT NULL,
		fkcodGen INTEGER(4) ZEROFILL NOT NULL,
        	fkcodEdi INTEGER(4) ZEROFILL NOT NULL,
        	fkcodAut INTEGER(4) ZEROFILL NOT NULL,
        	foreign key (fkcodGen) references tbGenero (pkcodGen),
        	foreign key (fkcodEdi) references tbEditora (pkcodEdi),
        	foreign key (fkcodAut) references tbAutor (pkcodAut));
		
CREATE TABLE tbAluno (
		pkmatricula INTEGER(4) ZEROFILL NOT NULL auto_increment PRIMARY KEY,
		nome VARCHAR(50) NOT NULL,
        	fone VARCHAR(20) NOT NULL,
        	sexo CHAR(1) NOT NULL,
        	cpf CHAR(14) NOT NULL,
        	email VARCHAR(100) NOT NULL,
		fkcodEnd INTEGER(4) ZEROFILL NOT NULL,
        	foreign key (fkcodEnd) references tbEndereco (pkcodEnd));
		
CREATE TABLE tbEmprestimo (
		pkcodEmp INTEGER(4) ZEROFILL NOT NULL auto_increment PRIMARY KEY,
		dataEmprestimo DATE NOT NULL,
		dataDevolucao DATE NOT NULL,
        	multa FLOAT(4) NULL,
        	valorEmprestimo FLOAT(4) NOT NULL,
		fkmatricula INTEGER(4) ZEROFILL NOT NULL,
        	fkcodLiv INTEGER(4) ZEROFILL NOT NULL,
        	foreign key (fkmatricula) references tbAluno (pkmatricula),
        	foreign key (fkcodLiv) references tbLivro (pkcodLiv));
		
INSERT INTO tbgenero (nome, sigla)
	values	("Terror", "TE"),
			("Romance", "RO"),
        		("Aventura", "AV");
			
INSERT INTO tbautor (nome_Completo, nome, sobrenome)
	values	("Leandro Silva", "Leandro", "Silva"),
			("João Pereira", "João", "Pereira"),
            		("Maria dos Santos", "Maria", "Santos");
			
INSERT INTO tbendereco (rua, numero, uf)
	values	("xxx", 386, "RS"),
			("yyy", 100, "SC"),
            		("bbb", 1000, "SP");
			
INSERT INTO tbeditora (nome, fkcodEnd)
	values	("Abril", 1),
			("Veja", 3),
           		("Folha", 2);
			
INSERT INTO tbaluno (nome, fone, sexo, cpf, email, fkcodEnd)
	values	("Juca", "333", "M", "123", "juca@", 1),
			("Pedro", "444", "M", "321", "pedro@", 2),
            		("Joana", "555", "F", "654", "joana@", 3);
			
INSERT INTO tblivro (nome, edicao, ano, fkcodGen, fkcodEdi, fkcodAut)
	values	("xxx", "bbb", 2000, 1, 3, 2),
			("yyy", "aaa", 2015, 2, 1, 3),
            		("uuu", "iii", 2016, 3, 2, 1);
			
INSERT INTO tbemprestimo (fkmatricula, fkcodLiv, dataEmprestimo, dataDevolucao, valorEmprestimo, multa)
	values	(1, 2, "2019-01-10", "2019-01-17", 10.00, 0),
			(2, 1, "2019-02-15", "2019-02-22", 15.00, 0),
            		(1, 2, "2019-03-01", "2019-03-07", 10.00, 0);


SELECT * from tbGenero ORDER BY nome DESC;

SELECT COUNT(*) from tbGenero;

SELECT sobrenome,nome_Completo FROM tbAutor;

SELECT COUNT(DISTINCT pkcodGen) from tbGenero;

SELECT * FROM tbAutor;
