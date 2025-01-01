-- begin transaction (ACID compliant)
begin try
	begin transaction;

	if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'OrderItems' and COLUMN_NAME = 'DiscountCode' and TABLE_SCHEMA = 'dbo')
	begin
		alter table OrderItems
		add DiscountCode nvarchar(100);
	end

	commit transaction;
end try
begin catch
	-- rollback changes in case of an error
	rollback transaction;

	-- print errors
end catch
