-- begin transaction (ACID compliant)
begin try
	begin transaction;

	-- if column Mobile does not exists in Customers table
	if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Customers' and COLUMN_NAME = 'Mobile' and TABLE_SCHEMA = 'dbo')
	begin
		alter table Customers
		add Mobile int,
			Birthday nvarchar(100);
	end

	commit transaction;
end try
begin catch
	-- rollback changes in case of an error
	rollback transaction;

	-- print errors
end catch