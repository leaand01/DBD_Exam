if not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Inventory' and TABLE_SCHEMA = 'dbo')
begin
	create table Inventory (
	Item_Id int identity(1,1) primary key,
	Timestamp datetime not null,
	Item nvarchar(100) not null,
	Quantity int not null,
	Price decimal(10,2) not null,
	Category nvarchar(100)
	);
end