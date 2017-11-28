use Perseus

go

insert into Curso values 
('ADS','Analise e Desenvolvimento de Sistema')
,('BD','Banco de Dados')
,('ADM','Administracao')
,('RD','Redes')

go

insert into GradeCurricular values 
(1,2017,1)
,(1,2017,2)
,(2,2018,1)
,(2,2018,2)
,(3,2019,1)

go

insert into Periodo values 
(1,1)
,(1,2)
,(2,1)
,(2,2)

go

insert into Disciplina values 
('Analise',10,15,12,'texto ementa','texto competencia','texto habilidade','texto conteudo', 'texto bibli basica','texto complementar')
,('Logica',10,15,12,'texto ementa','texto competencia','texto habilidade','texto conteudo', 'texto bibli basica','texto complementar')
,('Banco',10,15,12,'texto ementa','texto competencia','texto habilidade','texto conteudo', 'texto bibli basica','texto complementar')
,('Infra',10,15,12,'texto ementa','texto competencia','texto habilidade','texto conteudo', 'texto bibli basica','texto complementar')
,('Web',10,15,12,'texto ementa','texto competencia','texto habilidade','texto conteudo', 'texto bibli basica','texto complementar')

go

insert into PeriodoDisciplina values 
(1,1)
,(1,2)
,(2,1)
,(2,2)
,(3,3)

go

insert into DisciplinaOfertada values 
(1,2017,1)
,(1,2017,2)
,(2,2018,1)
,(3,2017,4)
,(2,2019,2)
,(3,2018,3)

go

insert into Professor values 
(9000768,'Victor','Victor Souza','lala@hotmail.com','12345678901')
,(9000769,'Roberto','Roberto Silva','lal6@hotmail.com','12345678901')
,(9000765,'Carlos','Carlos Alba','lal8@hotmail.com','12345678901')
,(9000766,'Ricardo','Ricardado alvares','lal5@hotmail.com','12345678901')

go

insert into Turma values 
(1,1,'a','Manha')
,(1,3,'b','Tarde')
,(2,3,'a','Manha')
,(2,2,'b','Noite')
,(3,4,'a','Noite')

go

insert into Aluno values 
(1700768,'Victor Souza','lalo@hotmail.com','12345678901',1)
,(1700769,'Gabriel Leal','lak@hotmail.com','12345678901',1)
,(1700765,'Carlos Cobre','lak9@hotmail.com','12345678901',2)
,(1700766,'Ricardado Eurico','la@hotmail.com','12345678901',2)

go

insert into Matricula values 
(1,1)
,(1,3)
,(2,3)
,(3,2)
,(4,4)
,(4,5)

go

insert into Questao values 
(1,1,'20170525','texto descricao', '20170520')
,(2,2,'20171125','texto descricao', '20171120')
,(3,3,'20181125','texto descricao', '20181120')
,(4,4,'20161125','texto descricao', '20161120')

go

insert into ArquivoQuestao values 
(1,'Texto Aruivo')
,(2,'Texto Aruivo')
,(3,'Texto Aruivo')
,(4,'Texto Aruivo')

go

insert into Resposta values 
(1,1,'20170620',null,'texto avaliacao','texto descricao','20170621')
,(2,3,'20170520',10,'texto avaliacao','texto descricao','20170521')
,(3,2,'20170620',6,'texto avaliacao','texto descricao','20170621')
,(4,4,'20170621',null,'texto avaliacao','texto descricao','20170622')

go

insert into ArquivoResposta values 
(1,'Texto Aruivo1')
,(2,'Texto Aruivo2')
,(3,'Texto Aruivo3')
,(4,'Texto Aruivo4')

go
insert into CursoTurma values 
(1,1)
,(2,2)
,(3,3)
,(4,4)
