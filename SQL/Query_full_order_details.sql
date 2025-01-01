-- Prior OrderItems migration
SELECT 
    O.Order_Id,
    -- Kunderelateret info (embed customer data)
    C.Customer_Id AS customer_id,
    C.FullName AS full_name,
    C.Email AS email,
    C.Address AS address,
    
    -- Relaterede varer (embed inventory items data)
    OI.Item_Id AS item_id,
    I.Item AS item,
    I.Price AS price,
    I.Category AS category,
    OI.Quantity AS amount,

    -- Totalpris og tid (total_price + timestamp)
    O.Total_price,
    O.Timestamp
FROM 
    Orders O
    JOIN Customers C ON O.Customer_Id = C.Customer_Id  -- Join med Customers-tabellen
    JOIN OrderItems OI ON O.Order_Id = OI.Order_Id      -- Join med OrderItems-tabellen
    JOIN Inventory I ON OI.Item_Id = I.Item_Id          -- Join med Inventory-tabellen
WHERE 
	O.Order_Id < 3;
    --O.Order_Id = 1;  
	--O.Order_Id = 2;  
