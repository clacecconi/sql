

Create  database Hotel__Atlantico
use Hotel__Atlantico
go

--criação de tabelas
create table hospedes(
	ID_hosp int primary key,
	nome_hosp nvarchar(50),
	nacionalidade_hosp nvarchar(20),
	email_hosp nvarchar(50),
	telefone_hosp nvarchar(15)
);


create table reservas(
	ID_reserva int primary key,
	Data_inicio nvarchar(10), 
	Data_fim nvarchar(10),
	Metodo_pagamento nvarchar(20),
	Tipo_Suite nvarchar(20)
);

create table hosp_resv(
	num_quarto int primary key,
	Id_hospede int foreign key references hospedes(ID_hosp),
	Id_reserva int foreign key references reservas(ID_reserva)
	);

	create table faxineiras(
	ID_faxineira int primary key,
	Nome_faxineira nvarchar(30)
	);


	create table limpeza_quartos(
	Num_quarto int foreign key references hosp_resv(num_quarto),
	Data_limpeza nvarchar(20),
	Duracao_faxina_horas int,
	Id_faxineira int foreign key references faxineiras(ID_faxineira),
	primary key (Num_quarto,Data_limpeza)
);

--inserção de dados nas tabelas criadas
	insert into hospedes values (862888910, 'José Fonseca Silva', 'Portugal', 'joseff@gmail.com', '35199922231'),
	(234889609, 'Armando Juez Nuñez', 'Espanha', 'ajn.enterprise@hotmail.com', '34910984551'), 
	(213459993, 'Amanda Boris Skovich', 'Russia', 'amandabskov@gmail.com', '3397812299'),
	(378190556, 'Rita Souza Silva', 'Portugal', 'ritassilva@gmail.com', '35193887366'),
	(550798690, 'Isai Gai', 'Noruega', 'igai.personal@gmail.com', '4780977341'),
	(987111654, 'Paulo Oliveira Alves', 'Portugal ', 'palves@gmail.com', '35198344122'),
	(991172370, 'Pedro Figueiredo', 'Portugal', 'pfenterprise@gmail.com', '35199834411'), 
	(770422119, 'Marie Choubert', 'França', 'marcho@gmail.com', '33998763345'),
	(556794815, 'Marta Pinheiro', 'Brasil', 'mapeinado@gmail.com', '5511972035536'),
	(770892235, 'Ana Maria Oliveira', 'Brasil', 'anao@gmail.com', '551173980891'),
	(887612309, 'Jacinto Torres', 'Brasil', 'jactorr@gmail.com', '551997763532'),
	(697713529, 'Carolline Alves', 'Portugal', 'caalves@gmail.com', '3519232168910')

	insert into reservas values (1001, '09-01-2024', '11-01-2024', 'cartão débito', 'luxo'),
	(1006, '09-01-2024', '11-01-2024', 'cartão débito', 'luxo'),
	(1002, '10-01-2024', '11-01-2024', 'cartão crédito', 'luxo'),
	(1003, '09-01-2024', '12-01-2024', 'cartão débito', 'padrão'),
	(1004, '09-01-2024', '11-01-2024', 'cartão crédito', 'padrão'),
	(1005, '10-01-2024', '11-01-2024', 'cartão crédito', 'luxo'),
	(1007, '10-01-2024', '12-01-2024', 'cartão crédito', 'padrão'),
	(1008, '11-01-2024', '12-01-2024', 'cartão crédito', 'luxo'),
	(1009, '11-01-2024', '12-01-2024', 'cartão crédito', 'luxo'),
	(1010, '10-01-2024', '12-01-2024', 'cartão crédito', 'padrão'),
	(1011, '11-01-2024', '12-01-2024', 'cartão crédito', 'luxo'),
	(1012, '10-01-2024', '12-01-2024', 'cartão débito', 'padrão')
	


	insert into hosp_resv values (101, 862888910, 1006),
	(102, 234889609, 1002),
	(103, 213459993, 1001),
	(104, 378190556, 1003),
	(201, 550798690, 1004),
	(202, 987111654, 1005),
	(203, 991172370, 1011),
	(204, 770422119, 1007),
	(304, 556794815, 1008),
	(303, 770892235, 1009),
	(302, 887612309, 1010),
	(301, 697713529, 1012)

	insert into faxineiras values ( 804032611, 'Amélia Ruiz'), ( 777082981, 'Lucia Souza')


	insert into limpeza_quartos values (101,'10-01-2024', 1, 777082981),
	(103,'10-01-2024', 1, 777082981), (201,'10-01-2024', 1, 777082981),
	(102,'10-01-2024', 1, 804032611), (203,'10-01-2024', 1, 777082981),
	(104,'10-01-2024', 1, 804032611), (204,'10-01-2024', 1, 804032611),
	(202,'10-01-2024', 1, 804032611), (301,'11-01-2024', 1, 777082981),
	(303,'11-01-2024', 1, 777082981), (304,'11-01-2024', 1, 777082981),
	(302,'11-01-2024', 1, 804032611)

--visualização das tabelas criadas com dados
	select * from reservas
	select * from hospedes
	select * from hosp_resv
	select * from limpeza_quartos
	select * from faxineiras


	select nome_hosp, nacionalidade_hosp from hospedes --Função select de apresentação dos hospedes por pais, util por exemplo em pesquisas de mercado

	select ID_reserva from reservas where Metodo_pagamento ='cartão crédito' --Seleção dos pagantes com cartão de crédito, util por exemplo na estratégia de parcerias financeiras
	
	select ID_hosp from hospedes inner join hosp_resv on hospedes.ID_hosp=hosp_resv.Id_hospede where num_quarto=101 --Função de seleção dos hospedes que se hospedaram em um determinado quarto, util em contextos de segurança

    UPDATE hospedes SET email_hosp = 'bskovamanda@gmail.com' WHERE email_hosp = 'amandabskov@gmail.com' --Função para alterar um dado

	select count(Duracao_faxina_horas) as Horas_Trabalhadas from limpeza_quartos inner join faxineiras on limpeza_quartos.Id_faxineira=faxineiras.ID_faxineira where faxineiras.Nome_faxineira like 'Amélia Ruiz'

	select Nome_faxineira, count(Duracao_faxina_horas) as Horas_Pagamento from limpeza_quartos inner join faxineiras on limpeza_quartos.Id_faxineira=faxineiras.ID_faxineira group by Nome_faxineira --Funções de apresentação das horas trabalhadas por faxineira

	select * from hospedes where nacionalidade_hosp like 'Portugal'
