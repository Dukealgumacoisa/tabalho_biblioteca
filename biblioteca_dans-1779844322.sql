--ferramentas usadas:
--	dbDesigner - montagem e organização de tabelas
--	ChatGPT - organização de ideias

CREATE TABLE IF NOT EXISTS 'livros' ( -- tabela que guarda os livros da biblioteca
	'id_livro' int AUTO_INCREMENT NOT NULL UNIQUE,
	'ano' year NOT NULL,
	'titulo' varchar(150) NOT NULL UNIQUE,
	'autor' char(50) NOT NULL,
	'copias' int NOT NULL,
	'copias_disp' int NOT NULL,
	PRIMARY KEY ('id_livro')
);

CREATE TABLE IF NOT EXISTS 'usuario_admin' ( -- tabela dos bibliotecarios do sistema
	'id_admin' int AUTO_INCREMENT NOT NULL UNIQUE,
	'email' varchar(150) NOT NULL UNIQUE,
	'nome' varchar(150) NOT NULL,
	'senha' varchar(255) NOT NULL,
	'telefone' varchar(15) NOT NULL UNIQUE,
	PRIMARY KEY ('id_admin')
);

CREATE TABLE IF NOT EXISTS 'alunos' ( -- tabela que armazena os alunos
	'id_alunos' int AUTO_INCREMENT NOT NULL UNIQUE,
	'rm' char(5) NOT NULL UNIQUE,
	'serie' char(1) NOT NULL,
	'curso' varchar(20) NOT NULL,
	'nome' varchar(150) NOT NULL,
	PRIMARY KEY ('id_alunos')
);

CREATE TABLE IF NOT EXISTS 'usuario_professor' ( -- tabela dos professores
	'id_professor' int AUTO_INCREMENT NOT NULL UNIQUE,
	'rm_prof' int NOT NULL UNIQUE,
	'email' varchar(150) NOT NULL UNIQUE,
	'disciplina' varchar(50) NOT NULL,
	'nome' varchar(150) NOT NULL,
	PRIMARY KEY ('id_professor')
);

CREATE TABLE IF NOT EXISTS 'emprestimo' ( -- tabela que registra os empréstimos dos livros
	'id_emprestimo' int AUTO_INCREMENT NOT NULL UNIQUE,
	'id_livro' int NOT NULL,
	'id_admin' int NOT NULL,
	'id_professor' int,
	'id_aluno' int,
	'data_emprestimo' date NOT NULL,
	'data_devolucao' date NOT NULL,
	'status' varchar(20) NOT NULL,
	PRIMARY KEY ('id_emprestimo')
);

ALTER TABLE 'emprestimo' -- cria relação entre empréstimo e livros
ADD CONSTRAINT 'fk_emprestimo_livro'
FOREIGN KEY ('id_livro')
REFERENCES 'livros'('id_livro');

ALTER TABLE 'emprestimo' -- cria relação entre empréstimo e administrador
ADD CONSTRAINT 'fk_emprestimo_admin'
FOREIGN KEY ('id_admin')
REFERENCES 'usuario_admin'('id_admin');

ALTER TABLE 'emprestimo' -- cria relação entre empréstimo e aluno
ADD CONSTRAINT 'fk_emprestimo_aluno'
FOREIGN KEY ('id_aluno')
REFERENCES 'alunos'('id_alunos');

ALTER TABLE 'emprestimo' -- cria relação entre empréstimo e professor
ADD CONSTRAINT 'fk_emprestimo_professor'
FOREIGN KEY ('id_professor')
REFERENCES 'usuario_professor'('id_professor');