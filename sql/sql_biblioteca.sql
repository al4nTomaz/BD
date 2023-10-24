-- Códdigo feito por Alan Tomaz & Célio - TADS23

create table Acervo(
    codigo int not null AUTO_INCREMENT,
    titulo varchar(255) not null,
    tipo varchar(45) not null,
    status varchar(45) not null,
    primary key(codigo)
);

create table Usuario(
    registro_academico int  not null,
    nome varchar(255) not null,
    login varchar(45) not null,
    bloqueio_ativo bit not null,
    data_limite_bloqueio date,
    numero_emprestimos_ativos int not null,
    endereco varchar(255),
    primary key(registro_academico)
);

create table Tel_Usuario(
    telefone int not null,
    registro_academico int not null,
    primary key(telefone),
    foreign key(registro_academico) 
    REFERENCES Usuario(registro_academico)
);

create table Funcionario(
    codigo int  not null AUTO_INCREMENT,
    nome varchar(255) not null,
    endereco varchar(255) not null,
    login varchar(45) not null,
    funcao varchar (45) not null,
    senha varchar(45) not null, 
    primary key(codigo)
);

create table Tel_Funcionario(
    telefone int not null,
    codigo_funcionario int not null,
    primary key(telefone),
    foreign key(codigo_funcionario) 
    REFERENCES Funcionario(codigo)
);

create table Reserva(
    codigo_reserva int  not null AUTO_INCREMENT,
    codigo_acervo int not null,
    registro_academico int not null,
    data_limite_reserva date not null,
    status varchar (45) not null,
    data_resserva date not null,
    primary key(codigo_reserva),
    foreign key(codigo_acervo) 
    REFERENCES Acervo(codigo),
    foreign key(registro_academico) 
    REFERENCES Usuario(registro_academico)
);

create table Emprestimo(
    codigo_emprestimo int  not null AUTO_INCREMENT,
    registro_academico int not null,
    codigo_acervo int not null,
    codigo_funcionario int not null,
    numero_renovacao varchar (45) not null,
    data_emprestimo date not null,
    data_prevista_devolucao date not null,
    data_devolucao date,
    primary key(codigo_emprestimo),
    foreign key(registro_academico) 
    REFERENCES Usuario(registro_academico),
    foreign key(codigo_acervo) 
    REFERENCES Acervo(codigo),
    foreign key(codigo_funcionario) 
    REFERENCES Funcionario(codigo)
);