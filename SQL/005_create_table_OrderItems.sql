if not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'OrderItems' and TABLE_SCHEMA = 'dbo')
begin
	create table OrderItems (
	OrderItem_id int identity(1,1) primary key,
	Order_id int,
	Item_id int,
	Quantity int,

	foreign key (Order_id) references Orders(Order_id),
	foreign key (Item_id) references Inventory(Item_id)
	);
end