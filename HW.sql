create database HW_Index ON(
    NAME = HW_Index_dat,
    FILENAME = 'D:\HW_Index.mdf',
    SIZE = 10MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
)
LOG ON(  
    NAME = HW_Index_log,  
    FILENAME = 'D:\HW_Index.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB  
)
GO
USE HW_Index
GO
--5.14;
create table authors(
	ID int Primary Key clustered Identity(1,1),
	Name nvarchar(255) not null,
	Surname nvarchar(255) not null,
)
GO
create table press(
	ID int Primary Key Identity(1,1),
	Name nvarchar(255) default 'Untitled',
)
GO
create table books(
	ID int Primary Key Identity(1,1),
	Name nvarchar(255) not null,
	Price money,
	PressID int Foreign Key references press(id) on update cascade on delete cascade,
	AuthorID int Foreign Key references authors(id) on update cascade on delete cascade,
	Quantity int,
)
GO
create table costumers(
	ID int Primary Key Identity(1,1),
	Name nvarchar(255) not null,
)
GO
create table sales(
	ID int Primary Key identity(1,1),
	CostumerID int Foreign Key references costumers(id) on update cascade on delete cascade,
	BookID int Foreign Key references books(id) on update cascade on delete cascade,
	Date DATE default (getdate()),
	Income money,
	Quantity int,
)
GO
 --5.16
create trigger SOlD on sales for insert as
Declare @bookID int, @CostumerID INT, @CBQuantity INT, @BQuantity INT, @BookPrice money, @SalesID int, @Date date
SELECT @bookID = BookID, @CostumerID = CostumerID, @CBQuantity = Quantity, @SalesID = ID, @Date = Date FROM Inserted
SELECT @BQuantity = Quantity, @BookPrice = Price FROM books b where b.ID = @bookID
IF (@BQuantity <= 0) BEGIN RAISERROR('Все экземпляры данной книги проданы.',0,1) update sales set Quantity = 0 where ID = @SalesID END
ELSE
BEGIN
	IF (@CBQuantity > @BQuantity) RAISERROR('Можно купить лишь %d экземпялров данной книги.',0,1, @BQuantity) 
	ELSE 
	BEGIN
		UPDATE books set Quantity = Quantity - @CBQuantity
		UPDATE sales set Income = @BookPrice * @CBQuantity where ID = @SalesID
		RAISERROR('Продажа успешно осушествлена.',0,1)
	END
END
GO
--5.11; 5.15;
--alter table sales
--drop Quantity
--5.13;
--delete sales
--drop trigger SOlD
--GO
--select * from sales
--GO
--select * from books
--GO
--select * from authors
--GO
--select * from press
--GO
--select * from costumers
--truncate table sales
--GO
--truncate table books
--GO
--truncate table authors
--GO
--truncate table press
--GO
--truncate table costumers
--GO

EXECUTE SalesMonthDay 12
GO
--5.12; 
INSERT INTO authors([Name],[Surname]) VALUES('Ignatius','Lyons');
INSERT INTO authors([Name],[Surname]) VALUES('Alana','Malone');
INSERT INTO authors([Name],[Surname]) VALUES('Porter','Kelly');
INSERT INTO authors([Name],[Surname]) VALUES('Bethany','Mejia');
INSERT INTO authors([Name],[Surname]) VALUES('Ainsley','Stevenson');
INSERT INTO authors([Name],[Surname]) VALUES('Ignatius','Franks');
INSERT INTO authors([Name],[Surname]) VALUES('Quin','Munoz');
INSERT INTO authors([Name],[Surname]) VALUES('Igor','Alvarado');
INSERT INTO authors([Name],[Surname]) VALUES('Maggie','Brewer');
INSERT INTO authors([Name],[Surname]) VALUES('William','Harris');
INSERT INTO authors([Name],[Surname]) VALUES('Jackson','Mcgee');
INSERT INTO authors([Name],[Surname]) VALUES('Daryl','Perkins');
INSERT INTO authors([Name],[Surname]) VALUES('Cameron','Oliver');
INSERT INTO authors([Name],[Surname]) VALUES('Adele','Winters');
INSERT INTO authors([Name],[Surname]) VALUES('Vielka','Odonnell');
INSERT INTO authors([Name],[Surname]) VALUES('Wynter','Rivera');
INSERT INTO authors([Name],[Surname]) VALUES('Malcolm','Gates');
INSERT INTO authors([Name],[Surname]) VALUES('Velma','Hardy');
INSERT INTO authors([Name],[Surname]) VALUES('Laith','Roman');
INSERT INTO authors([Name],[Surname]) VALUES('Juliet','Summers');
INSERT INTO authors([Name],[Surname]) VALUES('Dai','Nelson');
INSERT INTO authors([Name],[Surname]) VALUES('Catherine','Lane');
INSERT INTO authors([Name],[Surname]) VALUES('Veronica','Newton');
INSERT INTO authors([Name],[Surname]) VALUES('Vance','Brown');
INSERT INTO authors([Name],[Surname]) VALUES('Cadman','Odonnell');
INSERT INTO authors([Name],[Surname]) VALUES('Jane','Frazier');
INSERT INTO authors([Name],[Surname]) VALUES('Aurelia','Rojas');
INSERT INTO authors([Name],[Surname]) VALUES('Noah','Adkins');
INSERT INTO authors([Name],[Surname]) VALUES('Chelsea','Sanford');
INSERT INTO authors([Name],[Surname]) VALUES('Aphrodite','Morgan');
INSERT INTO authors([Name],[Surname]) VALUES('Cain','Newman');
INSERT INTO authors([Name],[Surname]) VALUES('Dane','Nichols');
INSERT INTO authors([Name],[Surname]) VALUES('Fritz','Bonner');
INSERT INTO authors([Name],[Surname]) VALUES('Harriet','Spencer');
INSERT INTO authors([Name],[Surname]) VALUES('Quynn','Davis');
INSERT INTO authors([Name],[Surname]) VALUES('Maite','Cleveland');
INSERT INTO authors([Name],[Surname]) VALUES('Emily','Pugh');
INSERT INTO authors([Name],[Surname]) VALUES('Daquan','Mcfarland');
INSERT INTO authors([Name],[Surname]) VALUES('Merrill','Wilder');
INSERT INTO authors([Name],[Surname]) VALUES('Demetrius','Pollard');
INSERT INTO authors([Name],[Surname]) VALUES('Christian','Baxter');
INSERT INTO authors([Name],[Surname]) VALUES('Felix','Faulkner');
INSERT INTO authors([Name],[Surname]) VALUES('Tatum','Gould');
INSERT INTO authors([Name],[Surname]) VALUES('Abraham','Little');
INSERT INTO authors([Name],[Surname]) VALUES('Matthew','Fisher');
INSERT INTO authors([Name],[Surname]) VALUES('Caleb','Daniels');
INSERT INTO authors([Name],[Surname]) VALUES('Azalia','Lott');
INSERT INTO authors([Name],[Surname]) VALUES('Jerome','Pena');
INSERT INTO authors([Name],[Surname]) VALUES('Martin','Hendrix');
INSERT INTO authors([Name],[Surname]) VALUES('Aquila','Rosario');
INSERT INTO authors([Name],[Surname]) VALUES('Galvin','Clements');
INSERT INTO authors([Name],[Surname]) VALUES('Rhona','Simon');
INSERT INTO authors([Name],[Surname]) VALUES('Glenna','Brock');
INSERT INTO authors([Name],[Surname]) VALUES('Jerome','Dalton');
INSERT INTO authors([Name],[Surname]) VALUES('Lane','Boyer');
INSERT INTO authors([Name],[Surname]) VALUES('David','Roberson');
INSERT INTO authors([Name],[Surname]) VALUES('Jacob','Tillman');
INSERT INTO authors([Name],[Surname]) VALUES('Stephen','Sloan');
INSERT INTO authors([Name],[Surname]) VALUES('Rae','Huff');
INSERT INTO authors([Name],[Surname]) VALUES('Blythe','Baxter');
INSERT INTO authors([Name],[Surname]) VALUES('Kirestin','Fletcher');
INSERT INTO authors([Name],[Surname]) VALUES('Indigo','Everett');
INSERT INTO authors([Name],[Surname]) VALUES('Ahmed','Malone');
INSERT INTO authors([Name],[Surname]) VALUES('Walker','Hubbard');
INSERT INTO authors([Name],[Surname]) VALUES('Lila','Ewing');
INSERT INTO authors([Name],[Surname]) VALUES('Kadeem','Cohen');
INSERT INTO authors([Name],[Surname]) VALUES('Kaseem','Sosa');
INSERT INTO authors([Name],[Surname]) VALUES('Cheryl','Davidson');
INSERT INTO authors([Name],[Surname]) VALUES('Kieran','Little');
INSERT INTO authors([Name],[Surname]) VALUES('Shelby','Dejesus');
INSERT INTO authors([Name],[Surname]) VALUES('Amal','Harrison');
INSERT INTO authors([Name],[Surname]) VALUES('Kenyon','Hanson');
INSERT INTO authors([Name],[Surname]) VALUES('Rahim','Glover');
INSERT INTO authors([Name],[Surname]) VALUES('Tanek','Fitzgerald');
INSERT INTO authors([Name],[Surname]) VALUES('Driscoll','Church');
INSERT INTO authors([Name],[Surname]) VALUES('Stella','Ryan');
INSERT INTO authors([Name],[Surname]) VALUES('Denton','Juarez');
INSERT INTO authors([Name],[Surname]) VALUES('Keaton','Rivas');
INSERT INTO authors([Name],[Surname]) VALUES('Beck','Brennan');
INSERT INTO authors([Name],[Surname]) VALUES('Candice','Duncan');
INSERT INTO authors([Name],[Surname]) VALUES('Zia','Slater');
INSERT INTO authors([Name],[Surname]) VALUES('Stephen','Bowers');
INSERT INTO authors([Name],[Surname]) VALUES('Sade','Acosta');
INSERT INTO authors([Name],[Surname]) VALUES('Griffin','Valentine');
INSERT INTO authors([Name],[Surname]) VALUES('Tarik','Hodges');
INSERT INTO authors([Name],[Surname]) VALUES('Arthur','Dudley');
INSERT INTO authors([Name],[Surname]) VALUES('Brennan','Snow');
INSERT INTO authors([Name],[Surname]) VALUES('Alisa','Matthews');
INSERT INTO authors([Name],[Surname]) VALUES('Freya','Drake');
INSERT INTO authors([Name],[Surname]) VALUES('Oprah','Durham');
INSERT INTO authors([Name],[Surname]) VALUES('Uriel','Boone');
INSERT INTO authors([Name],[Surname]) VALUES('Yuri','Solomon');
INSERT INTO authors([Name],[Surname]) VALUES('Dakota','Ayers');
INSERT INTO authors([Name],[Surname]) VALUES('Jessamine','Greer');
INSERT INTO authors([Name],[Surname]) VALUES('Reed','Estes');
INSERT INTO authors([Name],[Surname]) VALUES('Kirk','Blake');
INSERT INTO authors([Name],[Surname]) VALUES('Irma','Booker');
INSERT INTO authors([Name],[Surname]) VALUES('Hillary','Taylor');
INSERT INTO authors([Name],[Surname]) VALUES('Carla','Marquez');
INSERT INTO authors([Name],[Surname]) VALUES('Howard','Baldwin');
create nonclustered index authorsName on authors(Name, Surname)
GO

INSERT INTO press([Name]) VALUES('Ante Ipsum Institute');
INSERT INTO press([Name]) VALUES('Cras Interdum Nunc Consulting');
INSERT INTO press([Name]) VALUES('Quisque Libero PC');
INSERT INTO press([Name]) VALUES('Et Euismod Et Industries');
INSERT INTO press([Name]) VALUES('Gravida Molestie Arcu Industries');
INSERT INTO press([Name]) VALUES('Nec Institute');
INSERT INTO press([Name]) VALUES('Nulla Interdum Curabitur Ltd');
INSERT INTO press([Name]) VALUES('Nec Company');
INSERT INTO press([Name]) VALUES('Nunc Id Enim Corporation');
INSERT INTO press([Name]) VALUES('Velit Institute');
INSERT INTO press([Name]) VALUES('Sem Pellentesque PC');
INSERT INTO press([Name]) VALUES('Consectetuer Corporation');
INSERT INTO press([Name]) VALUES('Eleifend PC');
INSERT INTO press([Name]) VALUES('Est Institute');
INSERT INTO press([Name]) VALUES('Eu Augue Porttitor Inc.');
INSERT INTO press([Name]) VALUES('Metus Facilisis Associates');
INSERT INTO press([Name]) VALUES('Dolor LLC');
INSERT INTO press([Name]) VALUES('Cursus Ltd');
INSERT INTO press([Name]) VALUES('Nam Tempor Diam Company');
INSERT INTO press([Name]) VALUES('Ante Lectus Convallis Associates');
INSERT INTO press([Name]) VALUES('Porttitor Corporation');
INSERT INTO press([Name]) VALUES('Lectus Ltd');
INSERT INTO press([Name]) VALUES('Sed Dolor Foundation');
INSERT INTO press([Name]) VALUES('Semper Industries');
INSERT INTO press([Name]) VALUES('Non Lorem Institute');
INSERT INTO press([Name]) VALUES('Molestie Tellus Aenean Institute');
INSERT INTO press([Name]) VALUES('Mauris Id LLC');
INSERT INTO press([Name]) VALUES('Suspendisse Ac Associates');
INSERT INTO press([Name]) VALUES('Maecenas Mi PC');
INSERT INTO press([Name]) VALUES('Mauris Inc.');
INSERT INTO press([Name]) VALUES('Ante Vivamus Non Institute');
INSERT INTO press([Name]) VALUES('Duis PC');
INSERT INTO press([Name]) VALUES('Pede Consulting');
INSERT INTO press([Name]) VALUES('Tortor Integer Aliquam Limited');
INSERT INTO press([Name]) VALUES('Nisl Ltd');
INSERT INTO press([Name]) VALUES('Eu Elit Associates');
INSERT INTO press([Name]) VALUES('Molestie Dapibus Ligula Foundation');
INSERT INTO press([Name]) VALUES('Lorem Ipsum LLP');
INSERT INTO press([Name]) VALUES('A Mi Foundation');
INSERT INTO press([Name]) VALUES('Dictum Phasellus In Institute');
INSERT INTO press([Name]) VALUES('Pede Associates');
INSERT INTO press([Name]) VALUES('Amet Metus Institute');
INSERT INTO press([Name]) VALUES('Dolor Sit Amet Consulting');
INSERT INTO press([Name]) VALUES('Vel Institute');
INSERT INTO press([Name]) VALUES('Neque Sed Incorporated');
INSERT INTO press([Name]) VALUES('At Corporation');
INSERT INTO press([Name]) VALUES('Molestie In Corporation');
INSERT INTO press([Name]) VALUES('Rhoncus Proin Nisl Consulting');
INSERT INTO press([Name]) VALUES('Elit Nulla Limited');
INSERT INTO press([Name]) VALUES('Faucibus Orci PC');
INSERT INTO press([Name]) VALUES('Quisque Fringilla Industries');
INSERT INTO press([Name]) VALUES('Dolor Quisque Tincidunt Inc.');
INSERT INTO press([Name]) VALUES('Lectus Institute');
INSERT INTO press([Name]) VALUES('Nam Interdum Corp.');
INSERT INTO press([Name]) VALUES('Magna Ut PC');
INSERT INTO press([Name]) VALUES('Neque In Corp.');
INSERT INTO press([Name]) VALUES('Turpis Inc.');
INSERT INTO press([Name]) VALUES('Sagittis Nullam Vitae Incorporated');
INSERT INTO press([Name]) VALUES('Non Industries');
INSERT INTO press([Name]) VALUES('Dictum Cursus Nunc PC');
INSERT INTO press([Name]) VALUES('Urna Et Arcu Ltd');
INSERT INTO press([Name]) VALUES('Egestas A Company');
INSERT INTO press([Name]) VALUES('Cubilia Curae; Phasellus LLP');
INSERT INTO press([Name]) VALUES('Integer In LLP');
INSERT INTO press([Name]) VALUES('Diam Nunc Industries');
INSERT INTO press([Name]) VALUES('Donec Luctus Aliquet Company');
INSERT INTO press([Name]) VALUES('Dui Lectus Rutrum LLC');
INSERT INTO press([Name]) VALUES('Dignissim Lacus Aliquam Associates');
INSERT INTO press([Name]) VALUES('Hendrerit Id Ante Corp.');
INSERT INTO press([Name]) VALUES('Justo Industries');
INSERT INTO press([Name]) VALUES('Vehicula Aliquet Libero Inc.');
INSERT INTO press([Name]) VALUES('Non Quam Consulting');
INSERT INTO press([Name]) VALUES('Quam Vel Limited');
INSERT INTO press([Name]) VALUES('Quis Pede Institute');
INSERT INTO press([Name]) VALUES('Mauris Erat Eget Foundation');
INSERT INTO press([Name]) VALUES('Risus Donec Ltd');
INSERT INTO press([Name]) VALUES('Libero Et LLC');
INSERT INTO press([Name]) VALUES('Porttitor Eros Corp.');
INSERT INTO press([Name]) VALUES('Tristique Senectus LLP');
INSERT INTO press([Name]) VALUES('Convallis Associates');
INSERT INTO press([Name]) VALUES('Augue Malesuada Malesuada Institute');
INSERT INTO press([Name]) VALUES('Non Dapibus Incorporated');
INSERT INTO press([Name]) VALUES('Nam Nulla Magna Industries');
INSERT INTO press([Name]) VALUES('Vel Corporation');
INSERT INTO press([Name]) VALUES('A Magna Associates');
INSERT INTO press([Name]) VALUES('Ligula Nullam Feugiat PC');
INSERT INTO press([Name]) VALUES('Vel Consulting');
INSERT INTO press([Name]) VALUES('Pulvinar PC');
INSERT INTO press([Name]) VALUES('Posuere Industries');
INSERT INTO press([Name]) VALUES('Arcu Vestibulum Ut Institute');
INSERT INTO press([Name]) VALUES('Donec Incorporated');
INSERT INTO press([Name]) VALUES('Quam A Ltd');
INSERT INTO press([Name]) VALUES('Nec Imperdiet Limited');
INSERT INTO press([Name]) VALUES('Nibh Institute');
INSERT INTO press([Name]) VALUES('Sem Nulla Institute');
INSERT INTO press([Name]) VALUES('A Tortor Industries');
INSERT INTO press([Name]) VALUES('Donec Egestas Duis Industries');
INSERT INTO press([Name]) VALUES('Eu Odio Inc.');
INSERT INTO press([Name]) VALUES('In Consequat Associates');
INSERT INTO press([Name]) VALUES('Pharetra Ut Pharetra Company');
GO

INSERT INTO costumers([Name]) VALUES('Cooper B. Sawyer');
INSERT INTO costumers([Name]) VALUES('Chloe Hurley');
INSERT INTO costumers([Name]) VALUES('Malcolm Espinoza');
INSERT INTO costumers([Name]) VALUES('Basia T. Watson');
INSERT INTO costumers([Name]) VALUES('Veronica N. Lucas');
INSERT INTO costumers([Name]) VALUES('Timon W. Gonzalez');
INSERT INTO costumers([Name]) VALUES('Scarlet Leonard');
INSERT INTO costumers([Name]) VALUES('Vincent M. Vazquez');
INSERT INTO costumers([Name]) VALUES('Deirdre N. Donovan');
INSERT INTO costumers([Name]) VALUES('Ciaran D. Holden');
INSERT INTO costumers([Name]) VALUES('Melodie U. Bush');
INSERT INTO costumers([Name]) VALUES('Cara B. Glover');
INSERT INTO costumers([Name]) VALUES('Danielle Hill');
INSERT INTO costumers([Name]) VALUES('Ayanna Pate');
INSERT INTO costumers([Name]) VALUES('Wilma Gibson');
INSERT INTO costumers([Name]) VALUES('Derek Q. Pollard');
INSERT INTO costumers([Name]) VALUES('Reese U. Vazquez');
INSERT INTO costumers([Name]) VALUES('Martina U. Dodson');
INSERT INTO costumers([Name]) VALUES('Hedwig Wright');
INSERT INTO costumers([Name]) VALUES('Jael Chavez');
INSERT INTO costumers([Name]) VALUES('Yolanda H. Barlow');
INSERT INTO costumers([Name]) VALUES('Nicholas I. Goodman');
INSERT INTO costumers([Name]) VALUES('Kibo Robinson');
INSERT INTO costumers([Name]) VALUES('Riley Mccarthy');
INSERT INTO costumers([Name]) VALUES('Mariam U. Skinner');
INSERT INTO costumers([Name]) VALUES('Doris Jefferson');
INSERT INTO costumers([Name]) VALUES('Beau V. Small');
INSERT INTO costumers([Name]) VALUES('Flynn Mccoy');
INSERT INTO costumers([Name]) VALUES('Shay U. Dean');
INSERT INTO costumers([Name]) VALUES('Kylee Morse');
INSERT INTO costumers([Name]) VALUES('Beau I. Roberson');
INSERT INTO costumers([Name]) VALUES('Amethyst U. Ewing');
INSERT INTO costumers([Name]) VALUES('Trevor Dean');
INSERT INTO costumers([Name]) VALUES('Rahim O. Gaines');
INSERT INTO costumers([Name]) VALUES('Connor I. Vincent');
INSERT INTO costumers([Name]) VALUES('Amity Y. Gomez');
INSERT INTO costumers([Name]) VALUES('Charity O. Bowen');
INSERT INTO costumers([Name]) VALUES('Kelsey Bishop');
INSERT INTO costumers([Name]) VALUES('Gail Payne');
INSERT INTO costumers([Name]) VALUES('Simone H. Morgan');
INSERT INTO costumers([Name]) VALUES('Lacy Humphrey');
INSERT INTO costumers([Name]) VALUES('MacKenzie M. Albert');
INSERT INTO costumers([Name]) VALUES('Maryam Guy');
INSERT INTO costumers([Name]) VALUES('Preston Chang');
INSERT INTO costumers([Name]) VALUES('Demetrius Neal');
INSERT INTO costumers([Name]) VALUES('Lucian B. Hubbard');
INSERT INTO costumers([Name]) VALUES('Vanna Collier');
INSERT INTO costumers([Name]) VALUES('Dawn T. Marsh');
INSERT INTO costumers([Name]) VALUES('Mikayla House');
INSERT INTO costumers([Name]) VALUES('Norman Knapp');
INSERT INTO costumers([Name]) VALUES('Sybil Weber');
INSERT INTO costumers([Name]) VALUES('Giacomo Y. Wooten');
INSERT INTO costumers([Name]) VALUES('Orla Scott');
INSERT INTO costumers([Name]) VALUES('Callum Puckett');
INSERT INTO costumers([Name]) VALUES('Patricia Ramsey');
INSERT INTO costumers([Name]) VALUES('Erasmus Pickett');
INSERT INTO costumers([Name]) VALUES('Leah Stone');
INSERT INTO costumers([Name]) VALUES('Alika Frazier');
INSERT INTO costumers([Name]) VALUES('Natalie S. Sampson');
INSERT INTO costumers([Name]) VALUES('Garrett Hayden');
INSERT INTO costumers([Name]) VALUES('Elton Henson');
INSERT INTO costumers([Name]) VALUES('Karina May');
INSERT INTO costumers([Name]) VALUES('Justin Owens');
INSERT INTO costumers([Name]) VALUES('Basia Smith');
INSERT INTO costumers([Name]) VALUES('Shea Small');
INSERT INTO costumers([Name]) VALUES('Chadwick R. Bray');
INSERT INTO costumers([Name]) VALUES('Sloane F. Fuentes');
INSERT INTO costumers([Name]) VALUES('Desiree Chavez');
INSERT INTO costumers([Name]) VALUES('Dillon K. May');
INSERT INTO costumers([Name]) VALUES('Owen F. Garcia');
INSERT INTO costumers([Name]) VALUES('Indira Z. Martin');
INSERT INTO costumers([Name]) VALUES('Shea Holden');
INSERT INTO costumers([Name]) VALUES('Gay Albert');
INSERT INTO costumers([Name]) VALUES('Ursa B. Morton');
INSERT INTO costumers([Name]) VALUES('Helen J. Sweet');
INSERT INTO costumers([Name]) VALUES('Jonah X. Hancock');
INSERT INTO costumers([Name]) VALUES('Sawyer Murray');
INSERT INTO costumers([Name]) VALUES('Charity D. Pena');
INSERT INTO costumers([Name]) VALUES('Jolie A. Mccarthy');
INSERT INTO costumers([Name]) VALUES('Fleur F. Miranda');
INSERT INTO costumers([Name]) VALUES('Colorado E. Baldwin');
INSERT INTO costumers([Name]) VALUES('Angelica P. Woodard');
INSERT INTO costumers([Name]) VALUES('Melissa E. Brady');
INSERT INTO costumers([Name]) VALUES('Jada Gibson');
INSERT INTO costumers([Name]) VALUES('Ebony G. Holt');
INSERT INTO costumers([Name]) VALUES('Lynn F. Terry');
INSERT INTO costumers([Name]) VALUES('Ali M. Hobbs');
INSERT INTO costumers([Name]) VALUES('Xenos Shepard');
INSERT INTO costumers([Name]) VALUES('Evangeline O. Brady');
INSERT INTO costumers([Name]) VALUES('Merrill Z. Harrison');
INSERT INTO costumers([Name]) VALUES('Joan N. Foreman');
INSERT INTO costumers([Name]) VALUES('Melyssa B. Moses');
INSERT INTO costumers([Name]) VALUES('Chanda F. Reyes');
INSERT INTO costumers([Name]) VALUES('Olympia Burgess');
INSERT INTO costumers([Name]) VALUES('Pascale I. Moore');
INSERT INTO costumers([Name]) VALUES('Noel T. Jarvis');
INSERT INTO costumers([Name]) VALUES('Igor Z. Slater');
INSERT INTO costumers([Name]) VALUES('Mufutau T. Simpson');
INSERT INTO costumers([Name]) VALUES('Avye Frost');
INSERT INTO costumers([Name]) VALUES('Hadley Q. Merritt');
GO 

INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut','$76.56',1,1,88);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('libero mauris, aliquam eu, accumsan sed, facilisis','$61.70',2,2,45);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('mi felis, adipiscing fringilla,','$58.18',3,3,95);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('ultrices. Duis volutpat nunc sit amet','$96.36',4,4,21);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('magnis dis parturient montes,','$68.87',5,5,26);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('pede, malesuada','$79.77',6,6,36);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('quam quis diam. Pellentesque habitant morbi tristique senectus et netus','$76.36',7,7,11);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('eget ipsum. Suspendisse sagittis. Nullam vitae','$46.49',8,8,11);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Quisque ac libero nec','$14.08',9,9,33);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('lorem eu metus. In','$46.14',10,10,63);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('elit sed consequat auctor, nunc','$79.59',11,11,60);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Fusce','$54.02',12,12,85);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('non magna. Nam ligula elit, pretium et, rutrum non,','$28.33',13,13,48);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Donec tempor, est ac mattis semper,','$25.58',14,14,63);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('vitae, sodales at,','$35.13',15,15,46);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('dolor. Fusce feugiat. Lorem','$23.27',16,16,49);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Donec porttitor tellus non magna. Nam ligula elit, pretium et,','$56.81',17,17,71);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('ipsum primis in faucibus orci luctus et ultrices posuere','$90.78',18,18,69);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('a, facilisis non, bibendum sed,','$23.31',19,19,86);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet','$0.58',20,20,77);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('ornare, elit elit fermentum','$96.51',21,21,12);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('nulla. In tincidunt','$32.13',22,22,57);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('nonummy','$27.00',23,23,24);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('at lacus. Quisque','$40.02',24,24,11);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet','$32.30',25,25,54);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('et nunc. Quisque ornare tortor at','$9.16',26,26,27);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('pharetra ut, pharetra','$93.82',27,27,58);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('ridiculus mus.','$95.88',28,28,43);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie','$78.28',29,29,91);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('a, aliquet vel,','$92.00',30,30,99);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('ridiculus mus. Proin vel','$84.46',31,31,46);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('dignissim tempor arcu. Vestibulum ut eros','$25.72',32,32,97);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('fringilla euismod enim. Etiam gravida molestie arcu. Sed eu','$7.04',33,33,31);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('mi. Duis risus odio, auctor vitae,','$50.82',34,34,72);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('vel, convallis in, cursus','$63.35',35,35,44);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('laoreet posuere, enim nisl elementum purus, accumsan interdum libero','$20.33',36,36,34);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec,','$65.05',37,37,83);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper','$65.32',38,38,42);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('elit, pharetra ut,','$59.24',39,39,36);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Cum sociis natoque penatibus et','$94.64',40,40,60);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('egestas a,','$87.51',41,41,55);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna.','$80.62',42,42,72);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('amet diam eu dolor egestas','$29.61',43,43,55);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('vulputate, nisi sem semper erat, in consectetuer ipsum nunc id','$8.49',44,44,20);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('congue a, aliquet vel, vulputate eu,','$63.94',45,45,13);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('a mi fringilla mi','$96.11',46,46,71);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Suspendisse','$55.27',47,47,33);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('dui. Fusce diam nunc, ullamcorper','$16.47',48,48,17);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu,','$13.09',49,49,36);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('est ac facilisis facilisis, magna tellus faucibus','$70.19',50,50,68);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('fringilla mi lacinia mattis. Integer eu lacus.','$92.45',51,51,48);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque','$44.00',52,52,23);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('diam. Proin dolor. Nulla semper tellus id nunc','$13.58',53,53,26);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('metus. Aenean sed pede nec ante blandit viverra.','$46.54',54,54,43);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('turpis. Nulla','$53.53',55,55,72);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis','$43.45',56,56,45);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('iaculis,','$5.55',57,57,73);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('dictum augue','$17.87',58,58,18);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('dui, nec tempus mauris erat eget','$40.12',59,59,95);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('urna suscipit nonummy. Fusce fermentum fermentum arcu.','$3.18',60,60,61);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('commodo hendrerit. Donec porttitor tellus','$8.42',61,61,26);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('sed turpis nec mauris blandit mattis. Cras eget nisi dictum','$31.15',62,62,24);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Suspendisse commodo tincidunt nibh. Phasellus nulla.','$22.24',63,63,15);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('sem, vitae aliquam eros','$76.06',64,64,64);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('magna et ipsum cursus vestibulum. Mauris magna. Duis','$72.28',65,65,61);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit','$36.18',66,66,18);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('netus et malesuada','$87.95',67,67,25);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('id, ante. Nunc mauris','$34.41',68,68,76);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('molestie tortor nibh sit amet orci. Ut sagittis lobortis','$25.62',69,69,17);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('fermentum','$95.04',70,70,27);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('euismod mauris eu elit. Nulla facilisi.','$39.44',71,71,15);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('nulla. Integer vulputate, risus','$1.46',72,72,53);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('penatibus et magnis dis parturient montes, nascetur','$57.07',73,73,63);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus','$12.35',74,74,18);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('adipiscing lobortis risus. In mi pede, nonummy','$45.40',75,75,74);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('faucibus. Morbi vehicula.','$85.70',76,76,88);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('dignissim pharetra. Nam ac nulla.','$9.29',77,77,49);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Suspendisse commodo tincidunt','$69.36',78,78,47);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('tempus eu, ligula. Aenean euismod mauris eu elit. Nulla','$48.31',79,79,80);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus','$23.75',80,80,57);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('sapien. Cras dolor dolor, tempus non, lacinia at, iaculis','$84.95',81,81,59);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('nunc interdum feugiat. Sed nec metus facilisis lorem tristique','$17.09',82,82,53);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('adipiscing lacus. Ut nec urna et','$66.34',83,83,23);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('imperdiet, erat nonummy ultricies ornare, elit','$75.10',84,84,24);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('sed tortor. Integer aliquam adipiscing','$12.54',85,85,23);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Curabitur massa. Vestibulum accumsan','$46.88',86,86,85);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('quis turpis vitae purus gravida sagittis. Duis gravida. Praesent','$75.96',87,87,50);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('Duis elementum, dui quis accumsan convallis, ante','$19.00',88,88,48);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt','$68.60',89,89,66);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('faucibus id, libero. Donec consectetuer mauris','$73.75',90,90,53);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('et','$4.36',91,91,25);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non,','$15.05',92,92,91);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('rutrum. Fusce dolor quam, elementum at, egestas a,','$47.57',93,93,44);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum','$0.93',94,94,25);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('pede','$66.65',95,95,23);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('mi.','$75.33',96,96,63);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('parturient montes, nascetur ridiculus mus. Proin vel','$17.01',97,97,11);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('purus gravida sagittis. Duis','$45.02',98,98,93);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('sem','$69.04',99,99,12);
INSERT INTO books([Name],[Price],[PressID],[AuthorID],[Quantity]) VALUES('libero et tristique pellentesque, tellus sem mollis dui, in sodales','$50.64',100,100,20);
GO

INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(1,1,'25/06/2019',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(2,2,'26/08/2018',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(3,3,'21/02/2019',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(4,4,'02/09/2017',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(5,5,'12/03/2019',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(6,6,'04/01/2018',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(7,7,'17/01/2019',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(8,8,'31/01/2018',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(9,9,'23/03/2018',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(10,10,'20/05/2019',9);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(11,11,'20/04/2019',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(12,12,'26/03/2019',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(13,13,'07/05/2019',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(14,14,'14/01/2018',3);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(15,15,'22/05/2018',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(16,16,'13/01/2018',2);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(17,17,'06/10/2017',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(18,18,'02/09/2017',9);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(19,19,'10/12/2017',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(20,20,'14/08/2017',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(21,21,'01/01/2019',2);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(22,22,'13/09/2017',2);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(23,23,'12/02/2018',9);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(24,24,'16/08/2017',8);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(25,25,'23/08/2017',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(26,26,'27/08/2018',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(27,27,'10/01/2018',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(28,28,'22/11/2018',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(29,29,'05/12/2017',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(30,30,'06/12/2017',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(31,31,'10/10/2018',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(32,32,'07/08/2018',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(33,33,'03/06/2019',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(34,34,'27/03/2019',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(35,35,'13/09/2018',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(36,36,'11/07/2019',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(37,37,'10/02/2019',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(38,38,'20/12/2018',2);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(39,39,'20/04/2019',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(40,40,'12/05/2018',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(41,41,'31/03/2019',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(42,42,'20/04/2019',3);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(43,43,'22/09/2018',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(44,44,'24/01/2018',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(45,45,'30/06/2018',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(46,46,'19/08/2018',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(47,47,'07/08/2018',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(48,48,'23/03/2018',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(49,49,'26/08/2018',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(50,50,'07/10/2017',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(51,51,'23/04/2019',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(52,52,'26/11/2018',8);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(53,53,'06/03/2019',3);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(54,54,'28/05/2018',9);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(55,55,'02/01/2019',3);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(56,56,'03/01/2018',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(57,57,'06/12/2017',9);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(58,58,'27/01/2018',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(59,59,'01/10/2017',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(60,60,'21/12/2017',8);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(61,61,'07/08/2017',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(62,62,'21/12/2018',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(63,63,'11/06/2019',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(64,64,'08/08/2018',2);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(65,65,'24/12/2018',4);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(66,66,'27/01/2019',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(67,67,'26/03/2018',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(68,68,'23/01/2018',3);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(69,69,'02/07/2019',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(70,70,'09/12/2017',9);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(71,71,'28/04/2018',8);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(72,72,'26/02/2019',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(73,73,'27/12/2017',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(74,74,'22/02/2018',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(75,75,'07/05/2019',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(76,76,'30/06/2018',8);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(77,77,'01/12/2018',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(78,78,'02/06/2018',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(79,79,'16/04/2018',9);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(80,80,'22/07/2018',2);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(81,81,'25/11/2017',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(82,82,'05/01/2019',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(83,83,'22/03/2018',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(84,84,'20/08/2018',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(85,85,'28/02/2019',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(86,86,'12/04/2018',8);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(87,87,'06/04/2018',8);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(88,88,'19/11/2017',6);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(89,89,'08/09/2017',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(90,90,'04/10/2018',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(91,91,'03/08/2018',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(92,92,'26/11/2017',7);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(93,93,'09/06/2019',1);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(94,94,'10/04/2018',3);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(95,95,'29/05/2019',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(96,96,'30/08/2018',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(97,97,'17/07/2018',3);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(98,98,'22/09/2018',10);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(99,99,'14/12/2017',5);
INSERT INTO sales([CostumerID],[BookID],[Date],[Quantity]) VALUES(100,100,'26/07/2018',6);
GO

--drop table sales
--GO


--Tasks 
--5.1; 5.3; 5.7; 5.8; 
create procedure MonthIncome @Year int, @Month int as
select c.Name Costumer_Name, b.Name Book_Name, s.Quantity, s.Income, s.Date
from sales s
left join costumers c on s.CostumerID = c.ID
left join books b on s.BookID = b.ID
where MONTH(s.Date) = @Month AND YEAR(s.Date) = @Year AND s.Income is not null
order by Income DESC
GO
--5.4; 
create procedure YearIncome @Year int as
select c.Name Costumer_Name, b.Name Book_Name, s.Quantity, s.Income, s.Date
from sales s,costumers c,books b
where s.BookID = b.ID AND s.CostumerID = c.ID AND s.Income is not null
group by c.Name, b.Name, s.Quantity, s.Income, s.Date
having YEAR(s.Date) = @Year
order by s.Date DESC
GO
--5.5
create procedure TotalIncome as
select c.Name Costumer_Name, b.Name Book_Name, s.Quantity, s.Income, s.Date
from sales s
join costumers c on s.CostumerID = c.ID
join books b on s.BookID = b.ID 
where s.Income is not null
order by s.Date DESC
GO

--5.2;
create procedure YearMonthIncome @Year int, @Month int as
select @Year YEAR, @Month MONTH, SUM(s.Income) INCOME from sales s where YEAR(s.Date) = @Year AND MONTH(s.Date) = @Month
GO

--5.6
select * from press
union
select * from costumers
GO

create procedure CostumerIncome @Costumer nvarchar(255) as
select c.Name, s.Income from sales s, costumers c where c.Name = @Costumer
GO
--5.9
create view SalesMaxIncome as
select c.Name, (select Max(s.Income)from sales s join costumers c on s.CostumerID = c.ID) Income from sales s
join costumers c on s.CostumerID = c.ID where s.Income = Income
GO
--5.10
create view BooksLike as
select * from books b where b.Name like('%Duis%')
GO

EXECUTE MonthIncome 2017, 10
GO
EXECUTE YearIncome 2018
GO
EXECUTE TotalIncome
GO
EXECUTE YearMonthIncome 2017, 10
GO
select * from BooksLike 
GO
select * from SalesMaxIncome 
GO


--Check
--drop procedure MonthIncome
--drop procedure YearIncome
--drop procedure TotalIncome
--drop procedure YearMonthIncome
--drop procedure BooksLike
--drop view SalesMaxIncome


--select * from sales
--GO
--select * from books
--GO
--select * from authors
--GO

--select * from press
--union
--select * from costumers
--GO


--5.9 вложенный select
--5.10 like
--5.11 alter
--5.13 delete




--use master
--GO
--drop database HW_Index
