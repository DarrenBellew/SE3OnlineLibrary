create table Users  (
	--Changed from using an ID to just a username, because it's going to be unique ANYWAY
	Username varchar(40) not null,
	Password varchar(40) not null,
	First_Name varchar(40),
	Surname varchar(40),
	--Extra data, that an actual library will need to function, (for *future* queries)
	Address_1 varchar(51),
	Address_2 varchar(51),
	City varChar(15),
	Telephone int(12),
	Mobile int(12),
	/******************/
	primary key (Username),
);

create table Categories  (
	CategoryID int(3),
	CategoryDetails varchar(15),

	primary key (CategoryID)
);



create table Books  (
	ISBN varchar(18),
	BookTitle varchar(35),
	Author varchar(55),
	Edition int(3),
	Year date,
	CategoryID int(3),
	
	primary key (ISBN),
	foreign key (CategoryID) references Categories
	(CategoryID)
);

--I removed the fine class(table), to just have a float in this table. 
--Making it easier to work with and more efficient
create table BookReserve  (
	ISBN varchar(18), 
	Username varchar(21),
	ReservedDate date not null,
	ReturnDate date,
	fine decimal(6,2),

	primary key (ISBN, Username),
	foreign key (ISBN) references Books(ISBN),
	foreign key (Username) references Users(Username)
);

create table Review  (
	ISBN varchar(18),
	username varchar2(40), 
	review text,

	primary key (bookId, username),
	foreign key (username) references users(username),
	foreign key(bookId) referneces Books(ISBN)
);

