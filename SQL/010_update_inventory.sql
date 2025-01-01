-- Update inventory from orders with order_id 1-2

DECLARE @OrderId INT, @OrderTimestamp DATETIME;
DECLARE @ItemId INT, @QuantitySold INT, @ItemQuantity INT, @ItemPrice DECIMAL(10,2), @ItemCategory NVARCHAR(100), @ItemName NVARCHAR(100);

-- Cursor to iterate over each order and its items
DECLARE OrderCursor CURSOR FOR
SELECT o.Order_Id, o.Timestamp, oi.Item_Id, oi.Quantity, i.Quantity AS ItemQuantity, i.Price, i.Category, i.Item
FROM Orders o
JOIN OrderItems oi ON o.Order_Id = oi.Order_id
JOIN Inventory i ON oi.Item_id = i.Item_Id;

-- Open the cursor
OPEN OrderCursor;

-- Fetch the first row
FETCH NEXT FROM OrderCursor INTO @OrderId, @OrderTimestamp, @ItemId, @QuantitySold, @ItemQuantity, @ItemPrice, @ItemCategory, @ItemName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Calculate new inventory quantity
    DECLARE @NewQuantity INT = @ItemQuantity - @QuantitySold;

    -- Insert a new row into the Inventory table
    INSERT INTO Inventory (Timestamp, Item, Quantity, Price, Category)
    VALUES (@OrderTimestamp, @ItemName, @NewQuantity, @ItemPrice, @ItemCategory);

    -- Print status (optional, for debugging)
  --  PRINT CONCAT('Updated Inventory for Item ID ', @ItemId, ': New Quantity = ', @NewQuantity, ' (Order ID: ', @OrderId, ')');

    -- Fetch the next row
    FETCH NEXT FROM OrderCursor INTO @OrderId, @OrderTimestamp, @ItemId, @QuantitySold, @ItemQuantity, @ItemPrice, @ItemCategory, @ItemName;
END

-- Close and deallocate the cursor
CLOSE OrderCursor;
DEALLOCATE OrderCursor;


-- Remark: denne kode virker kun fordi i dette special tilfælde har der kun er én række per item og item_id, hvorfor når ser på nyeste timestamp for item_id svarer det til nyeste timestamp for item.