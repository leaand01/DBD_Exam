-- Prior OrderItems migration
select 
    O.Order_Id,
    -- Kunderelateret info (embed customer data)
    C.Customer_Id as customer_id,
    C.FullName as full_name,
    C.Email as email,
    C.Address as address,
    
    -- Relaterede varer (embed inventory items data)
    OI.Item_Id as item_id,
    I.Item as item,
    I.Price as price,
    I.Category as category,
    OI.Quantity as amount,

    -- Totalpris og tid
    O.Total_price,
    O.Timestamp
from 
    Orders O
    JOIN Customers C on O.Customer_Id = C.Customer_Id  -- Join med Customers-tabellen
    JOIN OrderItems OI on O.Order_Id = OI.Order_Id      -- Join med OrderItems-tabellen
    JOIN Inventory I on OI.Item_Id = I.Item_Id          -- Join med Inventory-tabellen
where 
	O.Order_Id < 3;
    --O.Order_Id = 1;  
	--O.Order_Id = 2;  
