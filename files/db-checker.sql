USE clinica_medica;

SELECT 
    table_name 
FROM information_schema.tables 
WHERE table_schema = 'clinica_medica'
  AND table_name IN ('pacientes', 'medicos', 'exames', 'consultas', 'consultas_exames');

SELECT 
    table_name, 
    constraint_name, 
    column_name 
FROM information_schema.key_column_usage
WHERE table_schema = 'clinica_medica'
  AND constraint_name = 'PRIMARY';

SELECT 
    table_name, 
    column_name, 
    referenced_table_name, 
    referenced_column_name 
FROM information_schema.key_column_usage
WHERE table_schema = 'clinica_medica'
  AND referenced_table_name IS NOT NULL;

SELECT table_name, column_name 
FROM information_schema.columns
WHERE table_schema = 'clinica_medica'
  AND table_name = 'consultas'
  AND column_name IN ('id_paciente','id_medico');

SELECT 
    CASE
        WHEN 
            (SELECT COUNT(*) FROM information_schema.tables 
             WHERE table_schema = 'clinica_medica' 
             AND table_name IN ('pacientes','medicos','exames','consultas','consultas_exames')) = 5
        AND
            (SELECT COUNT(*) FROM information_schema.key_column_usage 
             WHERE table_schema = 'clinica_medica' 
             AND constraint_name = 'PRIMARY') >= 5
        AND
            (SELECT COUNT(*) FROM information_schema.key_column_usage 
             WHERE table_schema = 'clinica_medica' 
             AND referenced_table_name IS NOT NULL) >= 4
        THEN '✅ Tudo certo: banco criado e configurado corretamente.'
        ELSE '❌ Algo está errado: revise as tabelas e relacionamentos.'
    END AS status_final;
