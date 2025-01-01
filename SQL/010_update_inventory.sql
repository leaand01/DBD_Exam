-- Update inventory from orders with order_id 1-2

declare @OrderId int, @OrderTimestamp datetime;
declare @ItemId int, @QuantitySold int, @ItemQuantity int, @ItemPrice decimal(10,2), @ItemCategory nvarchar(100), @ItemName nvarchar(100);

-- Cursor to iterate over each order and its items
declare OrderCursor cursor for
select o.Order_Id, o.Timestamp, oi.Item_Id, oi.Quantity, i.Quantity as ItemQuantity, i.Price, i.Category, i.Item
from Orders o
JOIN OrderItems oi on o.Order_Id = oi.Order_id
JOIN Inventory i on oi.Item_id = i.Item_Id;

-- Open the cursor
open OrderCursor;

-- Fetch the first row
fetch next from OrderCursor into @OrderId, @OrderTimestamp, @ItemId, @QuantitySold, @ItemQuantity, @ItemPrice, @ItemCategory, @ItemName;

while @@fetch_status = 0
begin
    -- Calculate new inventory quantity
    declare @NewQuantity int = @ItemQuantity - @QuantitySold;

    -- Insert a new row into the Inventory table
    insert into Inventory (Timestamp, Item, Quantity, Price, Category)
    values (@OrderTimestamp, @ItemName, @NewQuantity, @ItemPrice, @ItemCategory);

    -- Fetch the next row
    fetch next from OrderCursor into @OrderId, @OrderTimestamp, @ItemId, @QuantitySold, @ItemQuantity, @ItemPrice, @ItemCategory, @ItemName;
end

-- Close and deallocate the cursor
close OrderCursor;
deallocate OrderCursor;


-- Note: denne kode virker kun fordi i dette special tilfælde har der kun er én række per item og item_id, hvorfor når ser på nyeste timestamp for item_id svarer det til nyeste timestamp for item.