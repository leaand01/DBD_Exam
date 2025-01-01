# init mongoDB, collections and insert data
import CreateDB
import Collection_CustomerData
import Collection_InventoryData
import Collection_OrderData
import update_inventory_post_orders
import Collection_LoggingData

if __name__ == "__main__":

    print('Initialize mongoDB, collections and insert data')
    CreateDB # run script
    Collection_CustomerData
    Collection_InventoryData
    Collection_OrderData
    update_inventory_post_orders
    Collection_LoggingData

    # print list of db names
    print("Databases:", CreateDB.client.list_database_names())