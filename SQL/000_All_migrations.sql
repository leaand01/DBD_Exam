-- Shema Migrations in db exam_DB
-- Important before able to run this script: go to Query in menu and select SQLCMD Mode in order to be able to execute lines starting with :r (when selected lines starting with :r are highlighted)

-- use master-database in order to delete exam_DB if exists
use master;
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\delete_exam_db.sql"
go


-- Initialize exam_DB, tables and data insertion

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\001_create_db.sql"
go

use exam_DB;
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\002_create_table_customers.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\003_create_table_inventory.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\004_create_table_orders.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\005_create_table_OrderItems.sql"
go


-- insert data
:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\006_insert_customer_data.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\007_insert_inventory_data.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\008_insert_order_data.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\009_insert_orderItems_data.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\010_update_inventory.sql"
go


-- Migrations
:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\011_migration_customers_after1year.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\012_migration_orderItems_after1year.sql"
go


-- insert Customer data after migration
:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\013_insert_customer_data_post_migration.sql"
go

-- insert order and orderItems data after migration

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\014_insert_order_data_post_migration.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\015_insert_orderItems_data_post_migration.sql"
go

:r "C:\easv\Databases for Developers\Opgaver\Eksamensopgave\SQL\016_update_inventory_post_migration.sql"
go
