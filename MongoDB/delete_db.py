from CreateDB import client

if "exam_DB" in client.list_database_names():
    print('exam_DB already exists. Delete and re-initialize it')
    client.drop_database("exam_DB")

    # print list of db names
    print("Databases remaining: ", client.list_database_names())
