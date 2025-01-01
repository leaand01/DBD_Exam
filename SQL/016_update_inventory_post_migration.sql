-- Update inventory for order with Order_id = 3
declare @OrderTimestamp datetime, @ItemId int, @OrderQuantity int, @CurrentQuantity int, @NewQuantity int;
declare @ItemName nvarchar(100), @ItemPrice decimal(10,2), @ItemCategory nvarchar(100);

-- Get the timestamp of the order with Order_id = 3
select @OrderTimestamp = Timestamp
from Orders
where Order_Id = 3;

-- Cursor to iterate over the items in the order
declare OrderItemsCursor cursor for
select oi.Item_id, oi.Quantity
from OrderItems oi
where oi.Order_id = 3;

open OrderItemsCursor;

fetch next from OrderItemsCursor into @ItemId, @OrderQuantity;

while @@fetch_status = 0
begin
    -- Get the item name and latest inventory details for the item
    select top 1 @ItemName = Item, @CurrentQuantity = Quantity, @ItemPrice = Price, @ItemCategory = Category
    from Inventory
    where Item_Id = @ItemId
    order by Timestamp desc;

    -- Get the latest inventory status for the current item
    select top 1 @CurrentQuantity = Quantity
    from Inventory
    where Item = @ItemName
    order by Timestamp desc; -- Always fetch the newest record for the `Item`

    -- Calculate the new quantity
    set @NewQuantity = @CurrentQuantity - @OrderQuantity;

    insert into Inventory (Timestamp, Item, Quantity, Price, Category)
    values (@OrderTimestamp, @ItemName, @NewQuantity, @ItemPrice, @ItemCategory);

    -- Fetch the next item in the order
    fetch next from OrderItemsCursor into @ItemId, @OrderQuantity;
end;

close OrderItemsCursor;
deallocate OrderItemsCursor;
