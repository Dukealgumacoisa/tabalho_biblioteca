--ferramentas usadas:
--	dbdesigner: montagem de banco
--	chat gpt: organização de ideias

-- Tabela de livros
CREATE TABLE IF NOT EXISTS 'livros' (
	'id_livro' int AUTO_INCREMENT NOT NULL UNIQUE,
	'ano' year NOT NULL DEFAULT 4,
	'titulo' varchar(150) NOT NULL UNIQUE DEFAULT 150,
	'autor' char(50) NOT NULL UNIQUE DEFAULT 50,
	'copias' int NOT NULL UNIQUE,
	'copias_disp' int NOT NULL UNIQUE,
	PRIMARY KEY ('id_livro')
);

-- Tabela de administradores
CREATE TABLE IF NOT EXISTS 'usuario_admin' (
	'id_admin' int AUTO_INCREMENT NOT NULL UNIQUE,
	'email' varchar(150) NOT NULL UNIQUE DEFAULT 150,
	'nome' varchar(150) NOT NULL DEFAULT 150,
	'senha' int NOT NULL UNIQUE DEFAULT 5,
	'telefone' varchar(15) NOT NULL UNIQUE DEFAULT 15,
	PRIMARY KEY ('id_admin')
);

-- Tabela de alunos
CREATE TABLE IF NOT EXISTS 'ususario_alunos' (
	'id_alunos' int AUTO_INCREMENT NOT NULL UNIQUE,
	'rm' char(5) NOT NULL UNIQUE DEFAULT 5,
	'serie' char(1) NOT NULL UNIQUE DEFAULT 1,
	'curso' varchar(20) NOT NULL UNIQUE DEFAULT 20,
	'nome' varchar(150) NOT NULL UNIQUE DEFAULT 150,
	PRIMARY KEY ('id_alunos')
);

-- Tabela de professores
CREATE TABLE IF NOT EXISTS 'usuario_professor' (
	'id_professor' int AUTO_INCREMENT NOT NULL UNIQUE,
	'rm_prof' int NOT NULL UNIQUE DEFAULT 5,
	'email' varchar(150) NOT NULL UNIQUE DEFAULT 150,
	'disciplina' varchar(50) NOT NULL DEFAULT 50,
	'nome' varchar(150) NOT NULL UNIQUE DEFAULT 150,
	PRIMARY KEY ('id_professor')
);

-- Tabela de empréstimos
CREATE TABLE IF NOT EXISTS 'emprestimo' (
	'id_emprestimo' int AUTO_INCREMENT NOT NULL UNIQUE,
	'id_livro' int NOT NULL,
	'id_admin' int NOT NULL,
	'id_professor' int,
	'id_aluno' int,
	'data_emprestimo' date NOT NULL,
	'data_devolucao' date NOT NULL,
	'status' varchar(20) NOT NULL DEFAULT 20,
	PRIMARY KEY ('id_emprestimo')
);

-- Relacionamento da tabela livros
ALTER TABLE 'livros'
ADD CONSTRAINT 'livros_fk0'
FOREIGN KEY ('id_livro') REFERENCES 'emprestimo'('id_livro');

-- Relacionamento da tabela administradores
ALTER TABLE 'usuario_admin'
ADD CONSTRAINT 'usuario_admin_fk0'
FOREIGN KEY ('id_admin') REFERENCES 'emprestimo'('id_admin');

-- Relacionamento da tabela alunos
ALTER TABLE 'ususario_alunos'
ADD CONSTRAINT 'ususario_alunos_fk0'
FOREIGN KEY ('id_alunos') REFERENCES 'emprestimo'('id_aluno');

-- Relacionamento da tabela professores
ALTER TABLE 'usuario_professor'
ADD CONSTRAINT 'usuario_professor_fk0'
FOREIGN KEY ('id_professor') REFERENCES 'emprestimo'('id_professor');
