CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    data_nascimento DATE NOT NULL,
    ativo TINYINT(1) NOT NULL DEFAULT 1
);

INSERT INTO alunos (nome, email, data_nascimento, ativo) VALUES
('Mariana Souza Lima', 'mariana.lima@example.com', '1999-03-14', 1),
('Pedro Henrique Costa', 'pedro.costa@example.com', '2001-11-02', 1),
('Ana Carolina Ferreira', 'ana.ferreira@example.com', '2002-05-27', 0),
('Gabriel Martins Alves', 'gabriel.alves@example.com', '1998-09-09', 1),
('Fernanda Rocha Oliveira', 'fernanda.oliveira@example.com', '2000-12-18', 1),
('Rafael Mendes Santos', 'rafael.santos@example.com', '2001-07-06', 0),
('Juliana Ribeiro Silva', 'juliana.silva@example.com', '1999-01-29', 1),
('Lucas Eduardo Batista Ferreira', 'lucasedbatista@gmail.com', '2000-07-22', 1),
('Bianca Andrade Lopes', 'bianca.lopes@example.com', '2002-10-15', 1),
('Felipe Moura Dias', 'felipe.dias@example.com', '1997-04-03', 1);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

INSERT INTO cursos (nome_curso, carga_horaria) VALUES
('Informática Básica', 40),
('Programação em C', 60),
('Banco de Dados', 50),
('Desenvolvimento Web', 80),
('Eletrônica Básica', 45);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO matriculas (id_aluno, id_curso, data_matricula) VALUES
(1, 1, '2024-02-15'),
(2, 2, '2024-02-20'),
(3, 3, '2024-03-01'),
(4, 4, '2024-03-05'),
(5, 5, '2024-03-10'),
(6, 1, '2024-03-15'),
(7, 2, '2024-03-18'),
(8, 3, '2024-03-20'),
(9, 4, '2024-03-22'),
(10, 5, '2024-03-25');

CREATE TABLE disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO disciplinas (nome_disciplina, id_curso) VALUES
('Introdução à Informática', 1),
('Pacote Office', 1),
('Lógica de Programação', 2),
('Estruturas de Controle', 2),
('Modelagem de Dados', 3),
('SQL Básico', 3),
('HTML e CSS', 4),
('JavaScript', 4),
('Componentes Eletrônicos', 5),
('Circuitos Elétricos', 5);
