create table agenda_estado(
cod_estado int not null AUTO_INCREMENT,
estado varchar(50) not null,
primary key(cod_estado)
);

create table agenda_cidade(
cod_cidade int not null AUTO_INCREMENT,
cidade varchar(50) not null,
cod_estado int not null,
primary key(cod_cidade),
foreign key(cod_estado) REFERENCES agenda_estado(cod_estado)
);

create table agenda_endereco(
cod_endereco int not null AUTO_INCREMENT,
rua varchar(150) not null,
bairro varchar(50) not null,
cep varchar(15) not null,
cod_cidade int not null,
primary key(cod_endereco),
foreign key(cod_cidade) REFERENCES agenda_cidade(cod_cidade)
);

create table agenda_pessoa(
cod_pessoa int not null AUTO_INCREMENT,
nome varchar(200) not null,
data_nascimento date not null,
primary key(cod_pessoa)
);

create table agenda_pessoa_endereco(
cod_pessoa int not null,
cod_endereco int not null,
numero int not null,
primary key(cod_pessoa,cod_endereco),
foreign key(cod_pessoa) REFERENCES agenda_pessoa(cod_pessoa),
foreign key(cod_endereco) REFERENCES agenda_endereco(cod_endereco)
);

create table agenda_email(
cod_pessoa int not null,
email varchar(30) not null,
primary key(cod_pessoa,email),
foreign key(cod_pessoa) REFERENCES agenda_pessoa(cod_pessoa)
);

create table agenda_telefone(
cod_pessoa int not null,
telefone varchar(20) not null,
primary key(cod_pessoa,telefone),
foreign key(cod_pessoa) REFERENCES agenda_pessoa(cod_pessoa)
);

INSERT INTO agenda_estado(estado) values ('PARANA');
INSERT INTO agenda_estado(estado) values ('SAO PAULO');
INSERT INTO agenda_estado(estado) values ('RIO GRANDE DO SUL');
INSERT INTO agenda_estado(estado) values ('SANTA CATARINA');

select * from agenda_estado;

INSERT INTO agenda_cidade(cidade,cod_estado) values ('CASTRO',1);
INSERT INTO agenda_cidade(cidade,cod_estado) values ('SAO PAULO',2);
INSERT INTO agenda_cidade(cidade,cod_estado) values ('CANELA',3);
INSERT INTO agenda_cidade(cidade,cod_estado) values ('FLORIANOPOLIS',4);

# violação de chave estrangeira
INSERT INTO agenda_cidade(cidade,cod_estado) values ('PARANAGUA',8);

INSERT INTO agenda_endereco(rua,bairro,cep,cod_cidade) values ('RUA XV DE
NOVEMBRO','CENTRO','85.088-120',1);
INSERT INTO agenda_endereco(rua,bairro,cep,cod_cidade) values ('RUA
CABRAL','CENTRO','84.088-520',2);
INSERT INTO agenda_endereco(rua,bairro,cep,cod_cidade) values ('RUA 7 DE
SETEMBRO','XAXIM','89.188-620',3);
INSERT INTO agenda_endereco(rua,bairro,cep,cod_cidade) values ('RUA DOS
IMIGRANTES','ILHA','88.058-320',4);

INSERT INTO agenda_pessoa(nome,data_nascimento) values ('JOAO CARLOS','2000/10/30');
INSERT INTO agenda_pessoa(nome,data_nascimento) values ('JOAO PEDRO','1980/02/10');
INSERT INTO agenda_pessoa(nome,data_nascimento) values ('CARLOS','1999/10/13');
INSERT INTO agenda_pessoa(nome,data_nascimento) values ('ANA MARIA','1988/09/01');
INSERT INTO agenda_pessoa(nome,data_nascimento) values ('MARIA CLARA','1998/12/30')

INSERT INTO agenda_pessoa_endereco(cod_pessoa,cod_endereco,numero) values(1,1,10);
INSERT INTO agenda_pessoa_endereco(cod_pessoa,cod_endereco,numero) values(2,2,710);
INSERT INTO agenda_pessoa_endereco(cod_pessoa,cod_endereco,numero) values(3,3,50);
INSERT INTO agenda_pessoa_endereco(cod_pessoa,cod_endereco,numero) values(4,4,200);
INSERT INTO agenda_pessoa_endereco(cod_pessoa,cod_endereco,numero) values(5,4,250);

INSERT INTO agenda_telefone(cod_pessoa,telefone) values (1,'1234-1234');
INSERT INTO agenda_telefone(cod_pessoa,telefone) values (1,'3534-5234');
INSERT INTO agenda_telefone(cod_pessoa,telefone) values (2,'1212-1234');
INSERT INTO agenda_telefone(cod_pessoa,telefone) values (3,'1313-5234');
INSERT INTO agenda_telefone(cod_pessoa,telefone) values (3,'0098-1354');
INSERT INTO agenda_telefone(cod_pessoa,telefone) values (4,'1209-9234');
INSERT INTO agenda_telefone(cod_pessoa,telefone) values (5,'7777-1234');
INSERT INTO agenda_telefone(cod_pessoa,telefone) values (1,'5555-5234');

INSERT INTO agenda_email(cod_pessoa,email) values(1,'a@com.br');
INSERT INTO agenda_email(cod_pessoa,email) values(1,'x@com.br');
INSERT INTO agenda_email(cod_pessoa,email) values(2,'ww@com.br');