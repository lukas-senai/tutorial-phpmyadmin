USE clinica_medica;

INSERT INTO pacientes (nome, data_nascimento, telefone, endereco) VALUES
('Ana Souza', '1985-03-12', '11987654321', 'Rua A, 123'),
('Carlos Oliveira', '1990-07-22', '11988776655', 'Rua B, 456'),
('Fernanda Lima', '1975-11-30', '11999887766', 'Rua C, 789'),
('Rafael Santos', '2000-02-10', '11977665544', 'Rua D, 321'),
('Juliana Costa', '1992-08-18', '11966554433', 'Rua E, 654');

INSERT INTO pacientes (nome, data_nascimento, telefone, endereco)
SELECT CONCAT('Paciente ', seq), 
       DATE_ADD('1970-01-01', INTERVAL (seq*120) DAY), 
       CONCAT('1199', LPAD(seq,6,'0')), 
       CONCAT('Rua ', seq, ', ', seq*2)
FROM (SELECT @rownum := @rownum + 1 AS seq 
      FROM information_schema.tables t1, information_schema.tables t2, 
           (SELECT @rownum:=0) r 
      LIMIT 100) temp;

INSERT INTO medicos (nome, crm, especialidade) VALUES
('Dr. João Silva', 'CRM1234', 'Cardiologia'),
('Dra. Maria Oliveira', 'CRM5678', 'Dermatologia'),
('Dr. Pedro Souza', 'CRM9101', 'Ortopedia'),
('Dra. Ana Costa', 'CRM1122', 'Pediatria'),
('Dr. Lucas Martins', 'CRM3344', 'Ginecologia');

INSERT INTO medicos (nome, crm, especialidade)
SELECT CONCAT('Dr. Medico ', seq), 
       CONCAT('CRM', 1000+seq), 
       ELT(FLOOR(1 + (RAND() * 5)), 'Cardiologia','Dermatologia','Ortopedia','Pediatria','Ginecologia')
FROM (SELECT @rownum2 := @rownum2 + 1 AS seq 
      FROM information_schema.tables t1, information_schema.tables t2, 
           (SELECT @rownum2:=0) r 
      LIMIT 100) temp;

INSERT INTO exames (nome, descricao) VALUES
('Hemograma', 'Exame de sangue completo'),
('Raio-X', 'Imagem do sistema ósseo'),
('Ultrassom', 'Exame de imagem abdominal'),
('Eletrocardiograma', 'Exame do coração'),
('Ressonância Magnética', 'Exame de imagem detalhada');

INSERT INTO exames (nome, descricao)
SELECT CONCAT('Exame ', seq), CONCAT('Descrição do exame ', seq)
FROM (SELECT @rownum3 := @rownum3 + 1 AS seq 
      FROM information_schema.tables t1, information_schema.tables t2, 
           (SELECT @rownum3:=0) r 
      LIMIT 100) temp;

INSERT INTO consultas (id_paciente, id_medico, data_consulta, observacoes)
SELECT 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 100)),
    DATE_ADD('2022-01-01', INTERVAL (seq*5) DAY),
    CONCAT('Consulta ', seq)
FROM (SELECT @rownum4 := @rownum4 + 1 AS seq 
      FROM information_schema.tables t1, information_schema.tables t2, 
           (SELECT @rownum4:=0) r 
      LIMIT 200) temp;

INSERT INTO consultas_exames (id_consulta, id_exame)
SELECT 
    FLOOR(1 + (RAND() * 200)),
    FLOOR(1 + (RAND() * 100))
FROM (SELECT @rownum5 := @rownum5 + 1 AS seq 
      FROM information_schema.tables t1, information_schema.tables t2, 
           (SELECT @rownum5:=0) r 
      LIMIT 300) temp;
