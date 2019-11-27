create database pebolin;
use pebolin;

create table TB_Item(
	Id_item int,
    Nome_item VARCHAR(50),
    Valor_item INT,
    primary key(Id_item)
);

create table TB_Item_Estadio(
	Id_item int,
    Localização VARCHAR(20),
	Capacidade INT,
    primary key(Id_item),
    foreign key(Id_item) references TB_item(Id_item)
);

create table Tb_Item_Uniforme(
	Id_item int,
    Cor VARCHAR(20),
    Time_Original VARCHAR(20),
    primary key(Id_item),
    foreign key(Id_item) references TB_item(Id_item)
);

create table Tb_Time(
	Id INT,
    Nome VARCHAR(20),
    Formação VARCHAR(10),
    Uniforme INT,
    Estadio INT,
    primary key(Id),
    foreign key(Uniforme) references TB_item(Id_item),
    foreign key(Estadio) references TB_item(Id_item)
);

create table Tb_Item_Jogador(
	Id_item int,
    Nome VARCHAR(20),
    N_Camiseta INT,
    Id_Time INT,
    primary key(Id_item),
    foreign key(Id_item) references TB_item(Id_item),
    foreign key(Id_Time) references Tb_Time(Id)
);

create table TB_Usuario(
	Id VARCHAR(20),
    Senha INT,
    Gols_anotados INT,
    Gols_sofridos INT,
    Quantidade_Jogos INT,
    Vitorias INT,
    Derrotas INT,
    Empates INT,
    Id_Time INT,
    primary key(Id),
    foreign key(Id_Time) references tb_time(Id)
);

/*POPULAR*/

insert into tb_item values(0233,'Chelsea 1',330);
insert into tb_item values(0250,'Liverpool 1',400);

insert into tb_item values(0007,'Stamford Bridge',1500);
insert into tb_item values(0005,'Anfield',2500);

insert into tb_item values(1250,'Arapongas',4000);
insert into tb_item values(1251,'Walter',3000);
insert into tb_item values(1252,'André',3000);
insert into tb_item values(1253,'Joao',3500);
insert into tb_item values(1254,'Conrado',4000);
insert into tb_item values(1255,'Djeff',4500);
insert into tb_item values(1256,'Hitsu',3000);
insert into tb_item values(1257,'Felipe',3800);
insert into tb_item values(1258,'Emerson',5000);
insert into tb_item values(1259,'Yan',4200);
insert into tb_item values(1260,'Andrei',4400);

insert into tb_item values(1261,'Doni',2500);
insert into tb_item values(1262,'Celso',3000);
insert into tb_item values(1263,'Rodrigo',2500);
insert into tb_item values(1264,'Vinicius',3000);
insert into tb_item values(1265,'Lucas',3200);
insert into tb_item values(1266,'Azevedo',3500);
insert into tb_item values(1267,'Luiz Felipe',3000);
insert into tb_item values(1268,'Arthur',3500);
insert into tb_item values(1269,'Victor',4000);
insert into tb_item values(1270,'Matheus',3800);
insert into tb_item values(1271,'Gabriel',3500);

insert into TB_Item_Estadio values(0005,'Liverpool',54000);
insert into TB_Item_Estadio values(0007,'Londres',42000);

insert into Tb_Item_Uniforme values(0233,'Azul','Chelsea FC');
insert into Tb_Item_Uniforme values(0250,'Vermelho','Liverpool FC');

insert into Tb_Time values(1892,'Confrades FC','1-4-3-3',0250,0005);
insert into Tb_Time values(1997,'Burgues S FC','1-4-3-3',0233,0007);

insert into Tb_Item_Jogador values(1250,'Arapongas',01,1892);	
insert into Tb_Item_Jogador values(1251,'Walter',24,1892);
insert into Tb_Item_Jogador values(1252,'André',3,1892);
insert into Tb_Item_Jogador values(1253,'Joao',5,1892);
insert into Tb_Item_Jogador values(1254,'Conrado',19,1892);
insert into Tb_Item_Jogador values(1255,'Djeff',21,1892);
insert into Tb_Item_Jogador values(1256,'Hitsu',8,1892);
insert into Tb_Item_Jogador values(1257,'Felipe',10,1892);
insert into Tb_Item_Jogador values(1258,'Emerson',11,1892);
insert into Tb_Item_Jogador values(1259,'Yan',7,1892);
insert into Tb_Item_Jogador values(1260,'Andrei',9,1892);

insert into Tb_Item_Jogador values(1261,'Doni',83,1997);
insert into Tb_Item_Jogador values(1262,'Celso',2,1997);
insert into Tb_Item_Jogador values(1263,'Rodrigo',44,1997);
insert into Tb_Item_Jogador values(1264,'Vinicius',98,1997);
insert into Tb_Item_Jogador values(1265,'Lucas',7,1997);
insert into Tb_Item_Jogador values(1266,'Azevedo',10,1997);
insert into Tb_Item_Jogador values(1267,'Luiz Felipe',6,1997);
insert into Tb_Item_Jogador values(1268,'Arthur',22,1997);
insert into Tb_Item_Jogador values(1269,'Victor',11,1997);
insert into Tb_Item_Jogador values(1270,'Matheus',9,1997);
insert into Tb_Item_Jogador values(1271,'Gabriel',30,1997);

insert into TB_Usuario values('VV_Nigga',2469,86,65,100,70,20,10,1997);
insert into TB_Usuario values('Canelovski',1177,200,0,100,100,0,0,1892);

/*PERGUNTAS*/

#Algum usuario ja chegou  a 100 vitorias?
select Id from tb_usuario
where Vitorias >= 100;

#Qual o nome do time deste usuário?
select a.Nome , b.Id_Time 
from tb_time a,tb_usuario b
where b.Id_Time = b.Id='Canelovski';

#Qual o nome dos camisas nove das equipes registradas?
select a.Nome , a.Id_Time
from tb_item_jogador a where N_Camiseta = 9;

#Qual usuario sofreu mais gols, e quantos gols foram?
select a.Id, a.Gols_sofridos
from tb_usuario a 
group by a.Gols_sofridos
order by count(Gols_sofridos) desc
limit 1;

#Qual o nome a localização e a capacidade do estádio deste usuario
select Id_Time from tb_usuario where Id='VV_Nigga';
select Estadio from tb_time where Id=1997;
select a.Capacidade , a.Localização , b.Nome_item
from tb_item_estadio a , tb_item b 
where a.Id_item = 0007 and b.Id_item = 0007;