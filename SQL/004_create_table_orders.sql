if not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Orders' and TABLE_SCHEMA = 'dbo')
begin
	create table Orders (
	Order_Id int identity(1,1) primary key,
	Customer_Id int,
	Timestamp datetime not null,
	Total_price decimal(10,2) not null,

	foreign key (Customer_Id) references Customers(Customer_Id)
	);
end