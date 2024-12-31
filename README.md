**Create SQL tables, insertion of data and migrations**

In order to create the same tables as referenced in the synopsis appendix, open SQL Server Management Studio and run the document located here:

- SQL\000_All_migrations.sql

A description is given in the top of the document how to run it.
Now all relevant tables has been created in a database called exam_DB.



**Setup MongoDB collections**

Similarly to create the considered collections in the synopsis open pycharm and run the follwing files in the following order:
- MongoDB\init_mongoDB.py
- MongoDB\print.py

You can run the file in pycharm by pressing shift+F10, or push the "run" button. You have now created a MongoDB called exam_DB, where Print.py will print all documents of all created collections in the console.

In file MongoDB\CreateDB.py you may need to change the connection string to your local MongoDB server.
