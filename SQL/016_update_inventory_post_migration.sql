-- Update inventory for order with Order_id = 3
DECLARE @OrderTimestamp DATETIME, @ItemId INT, @OrderQuantity INT, @CurrentQuantity INT, @NewQuantity INT;
DECLARE @ItemName NVARCHAR(100), @ItemPrice DECIMAL(10,2), @ItemCategory NVARCHAR(100);

-- Get the timestamp of the order with Order_id = 3
SELECT @OrderTimestamp = Timestamp
FROM Orders
WHERE Order_Id = 3;

-- Cursor to iterate over the items in the order
DECLARE OrderItemsCursor CURSOR FOR
SELECT oi.Item_id, oi.Quantity
FROM OrderItems oi
WHERE oi.Order_id = 3;

OPEN OrderItemsCursor;

FETCH NEXT FROM OrderItemsCursor INTO @ItemId, @OrderQuantity;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Get the item name and latest inventory details for the item (based on Item, not Item_Id)
    SELECT TOP 1 @ItemName = Item, @CurrentQuantity = Quantity, @ItemPrice = Price, @ItemCategory = Category
    FROM Inventory
    WHERE Item_Id = @ItemId
    ORDER BY Timestamp DESC;

    -- Get the latest inventory status for the current item (based on `Item`, not `Item_Id`)
    SELECT TOP 1 @CurrentQuantity = Quantity
    FROM Inventory
    WHERE Item = @ItemName  -- Now we search by Item, not Item_Id
    ORDER BY Timestamp DESC; -- Always fetch the newest record for the `Item`

    -- Calculate the new quantity
    SET @NewQuantity = @CurrentQuantity - @OrderQuantity;

    -- Insert a new inventory log with updated quantity, ensuring no duplicates
    INSERT INTO Inventory (Timestamp, Item, Quantity, Price, Category)
    VALUES (@OrderTimestamp, @ItemName, @NewQuantity, @ItemPrice, @ItemCategory);

    -- Fetch the next item in the order
    FETCH NEXT FROM OrderItemsCursor INTO @ItemId, @OrderQuantity;
END;

CLOSE OrderItemsCursor;
DEALLOCATE OrderItemsCursor;




/*
-- Update inventory for order with Order_id = 3
DECLARE @OrderTimestamp DATETIME, @ItemId INT, @OrderQuantity INT, @CurrentQuantity INT, @NewQuantity INT;
DECLARE @ItemName NVARCHAR(100);

-- Get the timestamp of the order with Order_id = 3
SELECT @OrderTimestamp = Timestamp
FROM Orders
WHERE Order_Id = 3;

-- Cursor to iterate over the items in the order
DECLARE OrderItemsCursor CURSOR FOR
SELECT oi.Item_id, oi.Quantity
FROM OrderItems oi
WHERE oi.Order_id = 3;

OPEN OrderItemsCursor;

FETCH NEXT FROM OrderItemsCursor INTO @ItemId, @OrderQuantity;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Get the item name from Inventory based on Item_Id
    SELECT @ItemName = Item
    FROM Inventory
    WHERE Item_Id = @ItemId
    ORDER BY Timestamp DESC
    -- Fetch the latest item row
    -- NOTE: No need for "FETCH FIRST", this is handled by SELECT TOP 1

    -- Get the latest inventory status for the current item (based on the item name)
    SELECT TOP 1 @CurrentQuantity = Quantity
    FROM Inventory
    WHERE Item = @ItemName
    ORDER BY Timestamp DESC; -- Always fetch the newest record for the item

    -- Calculate the new quantity
    SET @NewQuantity = @CurrentQuantity - @OrderQuantity;

    -- Insert a new inventory log with updated quantity
    INSERT INTO Inventory (Timestamp, Item, Quantity, Price, Category)
    SELECT @OrderTimestamp, Item, @NewQuantity, Price, Category
    FROM Inventory
    WHERE Item = @ItemName
    ORDER BY Timestamp DESC;  -- Again, using TOP 1 to get the latest inventory details

    -- Fetch the next item in the order
    FETCH NEXT FROM OrderItemsCursor INTO @ItemId, @OrderQuantity;
END;

CLOSE OrderItemsCursor;
DEALLOCATE OrderItemsCursor;

*/
