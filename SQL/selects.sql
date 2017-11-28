use Perseus
/*total de disciplinas por carga_horária ( 40 horas de carga horária = meia noite, 80 = noite cheia )*/
select carga_hora, count(*)
from disciplina
group by carga_hora


/* total de disciplinas ofertadas por ano e semestre */
select ano, semestre, count(*)
from disciplinaOfertada
group by ano, semestre
order by ano, semestre

/*total de disciplinas cadastradas no sistema*/
select count(*)
from disciplina

-- lista com o nome da disciplina, o ano e o semestre que ela foi ofertada, ordenado por ano e semestre.
SELECT nome
, DO.ano
, DO.semestre
FROM DISCIPLINA as D
INNER JOIN DISCIPLINAOFERTADA as DO
ON D.id = DO.id_disciplina
ORDER BY DO.ano, DO.semestre


-- Qual a disciplina mais ofertada ( na história da impacta )....
SELECT top 1 D.nome, COUNT(*)
FROM DISCIPLINA as D
INNER JOIN DISCIPLINAOFERTADA as DO
ON D.id = DO.id_disciplina and DO.ano = 2017
GROUP BY D.nome
order by COUNT(*) DESC 

-- Qual(is) disciplina(s) NUNCA foi(foram) ofertada(s) ?
SELECT D.nome
FROM DISCIPLINA as D
LEFT JOIN DISCIPLINAOFERTADA as DO
ON D.id = DO.id_disciplina
where DO.id IS NULL


SELECT D.nome
FROM DISCIPLINA as D
LEFT JOIN DISCIPLINAOFERTADA as DO
ON D.id = DO.id_disciplina
GROUP BY D.NOME
HAVING COUNT(DO.ID) = 0

select * from Matricula

--1 ok
select A.nome, A.email, A.ra from Matricula as M join Aluno as A on M.id_aluno = A.id where A.id_curso = 1

--2 ok
select C.nome from CursoTurma as CT inner join Curso as C on CT.id_curso = C.id and c.id = 1 join Turma as T on CT.id_turma = T.id join DisciplinaOfertada as DO on T.id_disciplinaOf = DO.id where DO.ano = 2018 and DO.semestre = 1 

--3 ok 
select P.nome, P.email,COUNT(*) from Professor as P inner join Turma as T on T.id_professor = P.id join DisciplinaOfertada as DO on T.id_disciplinaOf = DO.id where DO.ano = 2017 and DO.semestre = 2 group by P.nome, P.email having COUNT(*) > 3

--4 ok
SELECT top 10 D.nome, COUNT(*)
FROM DISCIPLINA as D
INNER JOIN DISCIPLINAOFERTADA as DO
ON D.id = DO.id_disciplina and DO.ano = 2017
GROUP BY D.nome 
order by COUNT(*) DESC 

--5 ok
select count(distinct M.id_aluno) as 'Total de Alunos Matriculados' from Matricula as M inner join Turma as T on T.id = M.id_turma join DisciplinaOfertada as DO on DO.id = T.id_disciplinaOf where DO.semestre = 2 and DO.ano = DATEPART(year, getdate())

--6 ok 
select Q.numero, Q.descricao, A.nome, A.ra, R.data_de_envio from Questao as Q inner join Resposta as R on R.id_questao = Q.id join Aluno as A on R.id_aluno = A.id 

--7 o/k
select count(P.id) as 'Total de Professores Cadastrados' , count(distinct T.id_professor) as 'Cada'  from Professor as P left join Turma as T on P.id = t.id_professor join DisciplinaOfertada as DO on DO.id = T.id where DO.semestre = 2 

select * from Curso
select * from Disciplina
select * from GradeCurricular
--8 ok
select C.nome, count(A.id) as 'Total de Alunos' from Curso as C inner join Aluno as A on A.id_curso = C.id group by C.nome

--9

--10 o/k
select C.sigla, G.id_curso, G.semestre from  Curso as C inner join GradeCurricular as G on G.id_curso = C.id 

