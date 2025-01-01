if not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Customers' and TABLE_SCHEMA = 'dbo')
begin
	create table Customers (
	Customer_Id int identity(1,1) primary key,
	FullName nvarchar(100) not null,
	Email nvarchar(100) not null,
	Address nvarchar(250) not null
	);
end