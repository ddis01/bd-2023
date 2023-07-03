create database vixz;
use vixz;

create table funcionario(
	email varchar(50),
	dataNasc date,
	nome varchar(50),
	estado varchar(50),
	cidade varchar(50),
	cpf varchar(14),
	empresa varchar(50),
    PRIMARY KEY (cpf)
);

create table telefoneFuncionario(
	telefone varchar(11),
	fk_cpf varchar(14),
	foreign key (fk_cpf) references funcionario (cpf),
	primary key(fk_cpf, telefone)
);

insert into funcionario values ("abc4@gmail.com.br", "2001-09-11", "Antonio Bernado Costa", "Alagoas", "Maceió", "123.456.987-05", "gmail");
insert into funcionario values ("dso7@hotmail.com.br", "1984-01-04", "Davi Santiago de Oliveira", "Alagoas", "Rio Largo", "038.222.444-38", "hotmail");
insert into funcionario values ("mma4@outlook.com.br", "2008-12-29", "Miguel Moura Andrade", "São Paulo", "Rondonia", "999.333.888-12", "outlook");

insert into telefonefuncionario values("82988550180", "123.456.987-05");
insert into telefonefuncionario values("82908105588", "038.222.444-38");
insert into telefonefuncionario values("82956744312", "999.333.888-12");

create table plano(
	idplano int,
    valorplano VARCHAR (50),
    nomeplano varchar(20),
    PRIMARY KEY (idplano)
);

create table beneficiosplano(
	beneficiosplano varchar(50),
	fk_idplano int,
	foreign key (fk_idplano) references plano (idplano),
    primary key(fk_idplano, beneficiosplano)
);

insert into plano values (001, "50,00", "Júnior");
insert into plano values (002, "200,00", "Pleno");
insert into plano values (003, "900,00", "Senior");

insert into beneficiosplano values ("Acesso a cursos de desenvolvimento pessoal", 001);
insert into beneficiosplano values ("Acesso a cursos de tecnologia", 002);
insert into beneficiosplano values ("Acesso todos os benefícios", 003);

create table cliente(
	email varchar(50),
	dataNasc date,
	nome varchar(50),
	estado varchar(50),
	cidade varchar(50),
	cpf varchar(14),
	escolaridade varchar(50),
    fk_plano int,
    foreign key (fk_plano) references plano (idplano),
    PRIMARY KEY (cpf)
);
insert into cliente values ("darlineinocencio@gmail.com.br", "2006-10-29", "Colégio Rosalvo Felix", "Alagoas", "Rio Largo", "422.664.321-12", "Ensino Médio Completo.", 1);
insert into cliente values ("bieltotoso@gmail.com.br", "2006-04-20", "Colégio Santos Dumont", "Alagoas", "Rio Largo", "321.076.111-04", "Ensino Médio Incompleto.", 2);
insert into cliente values ("orilokicaminhoneiro@gmail.com.br", "2006-04-13", "Colégio Rosineide Tereza", "Alagoas", "Rio Largo", "140.712.134-13", "Ensino Fundamental Completo", 3);

create table telefonecliente(
	telefone varchar(11),
	fk_cpf varchar(14),
	foreign key (fk_cpf) references cliente (cpf),
	primary key(fk_cpf, telefone)
);

insert into telefonecliente values("82909081244", "422.664.321-12");
insert into telefonecliente values("82927859457", "321.076.111-04");
insert into telefonecliente values("82990239345", "140.712.134-13");

create table locaisestudados(
	locaisestudados varchar(50),
	fk_cpf varchar(14),
	foreign key (fk_cpf) references cliente (cpf),
    primary key(fk_cpf, locaisestudados)
);

insert into locaisestudados values ("Brilhando no viver", "140.712.134-13");
insert into locaisestudados values ("Agnus Dei", "422.664.321-12");
insert into locaisestudados values ("Colégio Santa Madalena Sofia", "140.712.134-13");
insert into locaisestudados values ("Colégio Santa Amélia", "321.076.111-04");

create table locaistrabalhados(
	locaistrabalhados varchar(50),
	fk_cpf varchar(14),
	foreign key (fk_cpf) references cliente (cpf),
    primary key(fk_cpf, locaistrabalhados)
);

insert into locaistrabalhados values ("Alma Viva", "422.664.321-12");
insert into locaistrabalhados values ("Nordeste Moveis", "140.712.134-13");
insert into locaistrabalhados values ("Lojas Americanas", "321.076.111-04");

create table vaga(
	idEmprego varchar(9),
    empresa varchar(60),
    nomeEmprego varchar (120),
    cargaHora varchar(3),
    salario varchar(50),
    PRIMARY KEY (idEmprego)
);

insert into vaga values("384564-AL", "Alma Viva", "Atendente de telemarketing", "90", "1.400,35");
insert into vaga values("126381-DD", "Nordeste Moveis", "Analista de negocios", "108", "4.300,16");
insert into vaga values("938512-EJ", "Lojas Americanas", "Atendente de caixa", "90", "1.500,00");


create table clientevaga(
	fk_idEmp varchar(9), 
    fk_cpf varchar(14),
	foreign key (fk_cpf) references cliente (cpf),
    foreign key (fk_idEmp) references vaga (idEmprego),
    primary key(fk_cpf, fk_idEmp)
);

insert into clientevaga values ("384564-AL", "422.664.321-12");

create table funcionariovaga(
	fk_idEmp varchar(9), 
    fk_cpf varchar(14),
	foreign key (fk_cpf) references funcionario (cpf),
    foreign key (fk_idEmp) references vaga (idEmprego),
    primary key(fk_cpf, fk_idEmp)
);

create table forum(
	idAssunto varchar(11),
    nomeAssunto varchar(100),
    areaAssunto varchar(200),
    PRIMARY KEY (idAssunto)
);

insert into forum values("987-654-321", "Como instalar o mocha no VSCode?", "Tecnologia - VSCode");
insert into forum values("834-902-456", "Como gerar números aleatórios com JavaScript?", "Linguagem de Programação - JavaScript");
insert into forum values("127-435-333", "Como instalar o MySQL no linux através do terminal?", "Tecnologia - Linux");

create table clienteforum(
	fk_idAssunto varchar(21),
	fk_cpf varchar(14),
	foreign key (fk_cpf) references cliente (cpf),
    foreign key (fk_idAssunto) references forum (idAssunto),
	primary key(fk_cpf, fk_idAssunto)
);

insert into clienteforum values ("987-654-321", "140.712.134-13");

create table curso(
	idCurso varchar(6),
    horaCurso int,
    areaCurso varchar(80),
    nomeCurso varchar(120),
    PRIMARY KEY (idCurso)
);

insert into curso values ("8965DH", 120, "Tecnologia - Linguagem de Programação", "JavaScript");
insert into curso values ("1236TM", 80, "Tecnologia - Linguagem de Programação", "Rubi");
insert into curso values ("4342ZX", 100, "Tecnologia - Linguagem de Programação", "C++");

create table clientecurso(
	fk_idCurso varchar(7),
	fk_cpf varchar(14),
	foreign key (fk_cpf) references cliente (cpf),
    foreign key (fk_idCurso) references curso (idCurso),
	primary key(fk_cpf, fk_idCurso)
);

insert into clientecurso values("8965DH", "321.076.111-04");
