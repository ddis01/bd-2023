#Retorna os clientes que estão participando do fórum com o ID do assunto igual a '987-654-321'.
SELECT c.* FROM cliente c
INNER JOIN clienteforum cf ON c.cpf = cf.fk_cpf
WHERE cf.fk_idAssunto = '987-654-321';

#Retorna todas as informações dos clientes que estão associados ao fórum com o ID do assunto igual a '987-654-321'.
SELECT c.* FROM cliente c
INNER JOIN clienteforum cf ON c.cpf = cf.fk_cpf
WHERE cf.fk_idAssunto = '987-654-321';

#Obtem todos os cursos disponíveis na área de "Tecnologia - Linguagem de Programação".
SELECT * FROM curso WHERE areaCurso = 'Tecnologia - Linguagem de Programação';

#Obtem todos os clientes que participam de um curso específico.
SELECT c.* FROM cliente c
INNER JOIN clientecurso cc ON c.cpf = cc.fk_cpf
WHERE cc.fk_idCurso = '8965DH';

#Obter o número total de participantes em cada fórum.
SELECT f.idAssunto, f.nomeAssunto, COUNT(cf.fk_cpf) AS total_participantes
FROM forum f
LEFT JOIN clienteforum cf ON f.idAssunto = cf.fk_idAssunto
GROUP BY f.idAssunto, f.nomeAssunto;

#Obtem o número total de participantes em cada curso.
SELECT c.idCurso, c.nomeCurso, COUNT(cc.fk_cpf) AS total_participantes
FROM curso c
LEFT JOIN clientecurso cc ON c.idCurso = cc.fk_idCurso
GROUP BY c.idCurso, c.nomeCurso;

#Obtem todos os fóruns em que um cliente específico está participando.
SELECT f.* FROM forum f
INNER JOIN clienteforum cf ON f.idAssunto = cf.fk_idAssunto
WHERE cf.fk_cpf = '140.712.134-13';

#Retorna o nome do assunto e a área do fórum com o ID de assunto igual a '127-435-333'.
SELECT f.nomeAssunto, f.areaAssunto
FROM forum f
WHERE f.idAssunto = '127-435-333';

#Retorna o nome e o email do cliente com CPF igual a '140.712.134-13'.
SELECT c.nome, c.email
FROM cliente c
WHERE c.cpf = '140.712.134-13';

#Retorna o nome do assunto do fórum e o nome do cliente associado a cada assunto.
SELECT f.nomeAssunto, c.nome
FROM forum f
INNER JOIN clienteforum cf ON f.idAssunto = cf.fk_idAssunto
INNER JOIN cliente c ON cf.fk_cpf = c.cpf;

#Retorna o nome dos clientes que não estão associados a nenhum assunto do fórum.
SELECT c.nome, cf.fk_idAssunto
FROM cliente c
LEFT JOIN clienteforum cf ON c.cpf = cf.fk_cpf
WHERE cf.fk_idAssunto IS NULL;

#Retorna o nome do cliente e o nome do curso associado a cada cliente.
SELECT c.nome, cr.nomeCurso
FROM cliente c
INNER JOIN clientecurso cc ON c.cpf = cc.fk_cpf
INNER JOIN curso cr ON cc.fk_idCurso = cr.idCurso;
