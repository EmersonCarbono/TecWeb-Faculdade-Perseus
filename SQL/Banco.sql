create database Perseus
go
use Perseus
go
create table Curso(
	id int identity(1,1) not null
	,sigla varchar(5)
	,nome varchar(50)
	,constraint id_curso primary key (id)
	,constraint uq_curso unique (sigla, nome)
)

go

create table GradeCurricular(
	id int identity(1,1) not null
	,id_curso int
	,ano smallint
	,semestre char(1)
	,constraint pk_gradeCurricular Primary key(id)
	,constraint fk_idCurso foreign key (id_curso) references Curso(id)
	,constraint uq_GradeCurricular unique (id_curso,ano,semestre)
)

go

create table Periodo(
	id int identity(1,1) not null
	,id_grade int
	,numero tinyint
	,constraint pk_IdPeriodo primary key (id)
	,constraint fk_GradeCurricular foreign key (id_grade) references GradeCurricular(id)
	,constraint uq_periodo unique (id_grade,numero)
)

go

create table Disciplina(
	id int identity(1,1) not null
	,nome varchar(240)
	,carga_hora tinyint
	,teoria decimal(3)
	,pratica decimal(3)
	,ementa text
	,competencia text
	,habilidades text
	,conteudo text
	,bibliografia_basica text
	,bibliografia_complementar text
	,constraint pk_IdDisciplina primary key (id)
	,constraint uq_disciplina unique (nome)
)

go

create table PeriodoDisciplina(
	id int identity(1,1) not null
	,id_disciplina int
	,id_periodo int	
	,constraint pk_IdPeriodoPeriodo primary key (id)
	,constraint fk_IdPeriodoDisciplinaPeriodo foreign key (id_periodo) references Periodo(id)
	,constraint fd_IdDisciplinaPeriodo foreign key (id_disciplina) references Disciplina(id)
	,constraint uq_periodoDisciplina unique (id_periodo,id_disciplina)
)

go

create table DisciplinaOfertada(
	id int identity(1,1) not null
	,id_disciplina int
	,ano smallint
	,semestre char(1)
	,constraint pk_IdDisciplinaOfertada primary key (id)
	,constraint fk_IdDiciplinaDisciplina foreign key (id_disciplina) references Disciplina(id)
	,constraint uq_DisciplinaOfertada unique (id_disciplina,ano, semestre)
)

go

create table Professor(
	id int identity(1,1) not null
	,ra int
	,apelido varchar(30)
	,nome varchar(120)
	,email varchar(80)
	,celular char(11)
	,constraint pk_IdProfessor primary key (id)
	,constraint uq_Professor unique (ra,apelido)
)

go

create table Turma(
	id int identity(1,1)not null
	,id_disciplinaOf int
	,id_professor int
	,id_turma char(1)
	,turno varchar(15)
	,constraint pk_IdTurma primary key (id)
	,constraint uq_Turma unique (id_disciplinaOf,id_turma)
	,constraint fk_IdProfessorTurma foreign key (id_professor) references Professor(id)
	,constraint fk_IdDisciplinaTurma foreign key (id_disciplinaOf) references DisciplinaOfertada(id)
)

go

create table Aluno(
	id int identity(1,1) not null
	,ra int
	,nome varchar(120)
	,email varchar(80)
	,celular char(11)
	,id_curso int
	,constraint pk_IdAluno primary key (id)
	,constraint fk_IdCursoAluno foreign key (id_curso) references Curso(id)
	,constraint uq_RaAluno unique (ra)
)

go

create table Matricula(
	id int identity(1,1) not null
	,id_aluno int
	,id_turma int
	,constraint pk_IdMatricula primary key (id)
	,constraint fk_IdAlunoMatricula foreign key (id_aluno) references Aluno(id)
	,constraint fk_IdTurmaMatricula foreign key (id_turma) references Turma(id)
	,constraint uq_matricula unique (id_aluno,id_turma)
)

go

create table Questao(
	id int identity(1,1) not null
	,id_turma int
	,numero int
	,data_limite_entrega date
	,descricao text
	,data date
	,constraint pk_IdQuestao primary key (id)
	,constraint fk_IdTurmaQuestao foreign key (id_turma) references Turma(id)
	,constraint uq_questao unique (id_turma, numero)
)

go

create table ArquivoQuestao(
	id int identity(1,1) not null
	,id_questao int
	,arquivo varchar(500)
	,constraint pk_IdArquivoQuestao primary key (id)
	,constraint fk_IdQuestaoArquivo foreign key (id_questao) references Questao(id)
	,constraint uq_arquivoQuestao unique (id_questao, arquivo)

)

go

create table Resposta(
	id int identity(1,1) not null
	,id_aluno int
	,id_questao int
	,data_avaliacao date
	,nota decimal(4,2)
	,avaliacao text
	,descricao text
	,data_de_envio date
	,constraint pk_IdResposta primary key (id)
	,constraint fk_IdAlunoResposta foreign key (id_aluno) references Aluno(id)
	,constraint fk_IdQuestaoResposta foreign key (id_questao) references Questao(id)
	,constraint uq_resposta unique (id_aluno, id_questao)
)

go

create table ArquivoResposta(
	id int identity(1,1) not null
	,id_resposta int
	,arquivo varchar(500)
	,constraint pk_IdArquivoResposta primary key (id)
	,constraint fk_IdRespostaArquivoResposta foreign key (id_resposta) references Resposta(id)
	,constraint uq_ArquivoResposta unique (id_resposta, arquivo)
)

go

create table CursoTurma(
	id int identity(1,1) not null
	,id_curso int
	,id_turma int
	,constraint pk_CursoTurma primary key (id)
	,constraint fk_IdCursoCursoTurma foreign key (id_curso) references Curso(id)
	,constraint fk_IdTurmaCursoTurma foreign key (id_turma) references Turma(id)
	,constraint uq_CursoTurma unique (id_curso, id_turma)
)

